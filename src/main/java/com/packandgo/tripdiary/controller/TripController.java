package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.exception.TripNotFoundException;
import com.packandgo.tripdiary.model.Comment;
import com.packandgo.tripdiary.model.Trip;

import com.packandgo.tripdiary.model.UserInfo;
import com.packandgo.tripdiary.payload.request.trip.CommentRequest;
import com.packandgo.tripdiary.payload.request.trip.TripRequest;
import com.packandgo.tripdiary.payload.response.CommentResponse;
import com.packandgo.tripdiary.payload.response.MessageResponse;
import com.packandgo.tripdiary.payload.response.PagingResponse;
import com.packandgo.tripdiary.payload.response.TripResponse;
import com.packandgo.tripdiary.service.TripService;
import com.packandgo.tripdiary.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/trips")
public class TripController {
    private final TripService tripService;
    private final UserService userService;

    @Autowired
    public TripController(TripService tripService, UserService userService) {
        this.tripService = tripService;
        this.userService = userService;
    }


    @GetMapping("/{id}")
    @ExceptionHandler(value = {TripNotFoundException.class})
    public ResponseEntity<?> getTrip(@PathVariable(name = "id", required = true) Long tripId) {
        Trip trip = tripService.get(tripId);
        TripResponse tripResponse = trip.toResponse();
        return ResponseEntity.ok(tripResponse);
    }


    @GetMapping("")
    public ResponseEntity<?> getAllTrips(@RequestParam(defaultValue = "1", required = false) int page,
                                         @RequestParam(defaultValue = "10", required = false) int size) {

        page = page <= 0 ? 1 : page;
        Page<Trip> trips = tripService.getTrips(page, size);
        PagingResponse<Trip> response = new PagingResponse<>(page, size, trips.getTotalPages(), trips.getContent());
        return ResponseEntity.ok(response);
    }

    @PostMapping("")
    public ResponseEntity<?> insertTrip(@RequestBody TripRequest tripRequest) {
        Trip savedTrip = tripService.insertTrip(tripRequest);
        TripResponse tripResponse = savedTrip.toResponse();
        return ResponseEntity.ok(tripResponse);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTrip(@PathVariable(name = "id", required = true) Long tripId) {
        tripService.removeTrip(tripId);
        return ResponseEntity.ok(new MessageResponse("Trip was removed successfully"));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateTrip(@PathVariable(name = "id", required = true) Long tripId,
                                        @RequestBody TripRequest request) {

        Trip savedTrip = tripService.updateTrip(tripId, request);
        TripResponse tripResponse = savedTrip.toResponse();
        return ResponseEntity.ok(tripResponse);
    }

    @PostMapping("/like/{id}")

    public ResponseEntity<?> likeTrip(@PathVariable(name = "id", required = true) Long tripId) {
        tripService.likeTrip(tripId);
        return ResponseEntity.ok(new MessageResponse("OK"));
    }


    @PostMapping("/comments/{id}")
    public ResponseEntity<?> addComment(@PathVariable(name = "id", required = true) Long tripId,
                                         @RequestBody CommentRequest request){
        tripService.commentTrip(tripId, request.getContent());
        return ResponseEntity.ok(new MessageResponse("Comment successfully"));
    }
    @PostMapping("reply/{id}")
    public ResponseEntity<?> replyComment(@PathVariable(name = "id", required = true) Long tripId,
                                          @RequestBody CommentRequest request){
        tripService.replyComment(tripId, request);
        return ResponseEntity.ok(new MessageResponse("Reply successfully"));
    }

    @GetMapping("/{id}/comments")
    public ResponseEntity<?> getComments(@PathVariable(name = "id", required = true) Long tripId){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Comment> commentList = tripService.getCommentsByTripId(tripId);
        List<CommentResponse> listResponses = commentList.stream().map(comment -> {
            CommentResponse rComment = new CommentResponse();
            //mapping
            rComment.setId(comment.getId());
            rComment.setTime(sdf.format(comment.getTime()));
            rComment.setContent(comment.getContent());
            rComment.setUsername(comment.getUser().getUsername());
            UserInfo info = userService.getInfo(comment.getUser());
            rComment.setAvatar(info.getProfileImageUrl());
//            rComment.setExtraComment(comment.getExtraComment());
            rComment.setRoot_id(comment.getComment() != null ? comment.getComment().getId() : 0);
            return  rComment;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(listResponses);
    }

    @DeleteMapping("/comments/{id}")
    public ResponseEntity<?> deleteComment(@PathVariable(name = "id") Long commentId){
        tripService.deleteComment(commentId);
        return ResponseEntity.ok(new MessageResponse("Comment was deleted successfully"));
    }
    @PutMapping("/comments")
    public ResponseEntity<?> editComment(@RequestBody CommentRequest request){
        tripService.editComment(request);
        return ResponseEntity.ok(new MessageResponse("Comment was edit successfully"));
    }
}