package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.model.User;
import com.packandgo.tripdiary.payload.response.*;
import com.packandgo.tripdiary.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin/users")
public class UserAdminController {

    private final UserService userService;

    @Autowired
    public UserAdminController(UserService userService) {
        this.userService = userService;
    }


    @DeleteMapping("/{username}")
    public ResponseEntity<?> removeUser(@PathVariable("username") String username) {
        userService.removeUser(username);
        return ResponseEntity.ok(new MessageResponse("User removed successfully"));
    }

    @PutMapping("/block/{username}")
    public ResponseEntity<?> blockUser(@PathVariable("username") String username) {
        User user = userService.blockUsers(username);
        return ResponseEntity.ok(user);
    }

    @PutMapping("/unblock/{username}")
    public ResponseEntity<?> unblockUser(@PathVariable("username") String username) {
        User user = userService.unblockUsers(username);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/{username}")
    public ResponseEntity<?> getUserInfo(@PathVariable("username") String username) {
        AdminResponse info = userService.getUserInfo(username);
        return ResponseEntity.ok(info);
    }
    @GetMapping("")
    public ResponseEntity<?> getAllUsers(@RequestParam(defaultValue = "1", required = false) int page,
                                         @RequestParam(defaultValue = "10", required = false) int size) {

        page = page <= 0 ? 1 : page;
        Page<UserResponse> result =  userService.getUsersAndAllTrips(page, size);
        PagingResponse<UserResponse> response = new PagingResponse<>(page, size, result.getTotalPages(), result.getContent());
        return ResponseEntity.ok(response);
    }
    @PostMapping("/grant/{username}")
    public ResponseEntity<?> grantAdmin(@PathVariable("username") String username){
        userService.grantAdmin(username);
        return ResponseEntity.ok(new MessageResponse("grant successfully"));
    }
    @PostMapping("/revoke/{username}")
    public ResponseEntity<?> revokeAdmin(@PathVariable("username") String username){
        userService.revokeAdmin(username);
        return ResponseEntity.ok(new MessageResponse("revoke successfully"));
    }
}
