package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.payload.response.*;
import com.packandgo.tripdiary.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin")
public class UserAdminController {

    private final UserService userService;

    @Autowired
    public UserAdminController(UserService userService) {
        this.userService = userService;
    }


    @DeleteMapping("/users/{username}")
    public ResponseEntity<?> removeUser(@PathVariable("username") String username) {
        userService.removeUser(username);
        return ResponseEntity.ok(new MessageResponse("User removed successfully"));
    }

    @PutMapping("users/block/{username}")
    public ResponseEntity<?> blockUser(@PathVariable("username") String username) {
        userService.blockUsers(username);
        return ResponseEntity.ok(new MessageResponse("User block successfully"));
    }

    @PutMapping("users/unblock/{username}")
    public ResponseEntity<?> unblockUser(@PathVariable("username") String username) {
        userService.unblockUsers(username);
        return ResponseEntity.ok(new MessageResponse("User unblock successfully"));
    }

    @GetMapping("users/{username}")
    public ResponseEntity<?> getUserInfo(@PathVariable("username") String username) {

        AdminResponse info = userService.getUserInfo(username);
        return ResponseEntity.ok(info);
    }
    @GetMapping("users")
    public ResponseEntity<?> getAllUsers(@RequestParam(defaultValue = "1", required = false) int page,
                                         @RequestParam(defaultValue = "10", required = false) int size) {

        page = page <= 0 ? 1 : page;
        Page<UserResponse> result =  userService.getUsersAndAllTrips(page, size);
        PagingResponse<UserResponse> response = new PagingResponse<>(page, size, result.getTotalPages(), result.getContent());
        return ResponseEntity.ok(response);
    }
}
