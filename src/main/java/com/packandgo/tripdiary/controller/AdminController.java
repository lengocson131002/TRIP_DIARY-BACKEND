package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.payload.response.MessageResponse;
import com.packandgo.tripdiary.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    private final UserService userService;

    @Autowired
    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @DeleteMapping("/users/{username}")
    public ResponseEntity<?> removeUser(@PathVariable("username") String username) {
        userService.removeUser(username);
        return ResponseEntity.ok(new MessageResponse("User removed successfully"));
    }

}
