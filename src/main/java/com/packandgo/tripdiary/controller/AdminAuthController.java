package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.auth.UserDetailsImpl;
import com.packandgo.tripdiary.model.User;
import com.packandgo.tripdiary.payload.request.auth.LoginRequest;
import com.packandgo.tripdiary.payload.response.ErrorResponse;
import com.packandgo.tripdiary.payload.response.JwtResponse;
import com.packandgo.tripdiary.payload.response.MessageResponse;
import com.packandgo.tripdiary.service.UserService;
import com.packandgo.tripdiary.util.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin")
public class AdminAuthController {

    private final UserService userService;
    private final JwtUtils jwtUtils;
    private final AuthenticationManager authenticationManager;

    @Autowired
    public AdminAuthController(
            UserService userService,
            JwtUtils jwtUtils, AuthenticationManager authenticationManager
    ) {
        this.userService = userService;
        this.jwtUtils = jwtUtils;
        this.authenticationManager = authenticationManager;
    }

    @PostMapping("/signin")
    public ResponseEntity<?> signin(@RequestBody LoginRequest loginRequest) {
        Authentication authentication = null;
        try {
            authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            loginRequest.getUsernameOrEmail(),
                            loginRequest.getPassword()
                    )
            );
        } catch (Exception exception) {
            throw new IllegalArgumentException("Email(username) or password is not correct!");
        }
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userService.findUserByUsername(userDetails.getUsername());
        if(!user.isEnabled()) {
            return ResponseEntity.badRequest().body(new MessageResponse("Account hasn't been verified"));
        }

        boolean isAdmin = user
                .getRoles()
                .stream()
                .filter(role -> "ADMIN".equals(role.getName()))
                .collect(Collectors.toList())
                .size() > 0;
        if(!isAdmin) {
            return ResponseEntity
                    .status(HttpStatus.FORBIDDEN)
                    .body(
                            new ErrorResponse(
                                    HttpStatus.FORBIDDEN.value(),
                                    "Account is not Administrator",
                                    new Date(),
                                    "/api/admin/signin"
                            )
                    );
        }

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        JwtResponse body = new JwtResponse(
                jwt,
                userDetails.getUsername(),
                userDetails.getEmail());

        return new ResponseEntity<>(body, HttpStatus.OK);
    }

}
