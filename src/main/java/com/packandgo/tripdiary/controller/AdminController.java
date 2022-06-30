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
}
