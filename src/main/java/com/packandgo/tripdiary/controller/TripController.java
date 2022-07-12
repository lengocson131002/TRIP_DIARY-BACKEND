package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.exception.TripNotFoundException;
import com.packandgo.tripdiary.model.Comment;
import com.packandgo.tripdiary.model.Like;
import com.packandgo.tripdiary.model.Trip;

import com.packandgo.tripdiary.model.UserInfo;
import com.packandgo.tripdiary.payload.request.trip.CommentRequest;
import com.packandgo.tripdiary.payload.request.trip.TripRequest;
import com.packandgo.tripdiary.payload.response.*;
import com.packandgo.tripdiary.service.ReactService;
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
    private final ReactService reactService;

    @Autowired
    public TripController(TripService tripService, UserService userService, ReactService reactService) {
        this.tripService = tripService;
        this.userService = userService;
        this.reactService = reactService;
    }


    @GetMapping("/{id}")
    @ExceptionHandler(value = {TripNotFoundException.class})
    public ResponseEntity<?> getTrip(@PathVariable(name = "id", required = true) Long tripId) {
        Trip trip = tripService.get(tripId);
        TripResponse tripResponse = trip.toResponse();

        tripResponse.setNumOfLikes(reactService.countLikes(tripId));
        return ResponseEntity.ok(tripResponse);
    }


    @GetMapping("")
    public ResponseEntity<?> getAllTrips(@RequestParam(defaultValue = "1", required = false) int page,
                                         @RequestParam(defaultValue = "10", required = false) int size) {

        page = page <= 0 ? 1 : page;
        Page<Trip> trips = tripService.getTrips(page, size);
        List<TripResponse> tripResponses = trips
                .stream()
                .map(t -> {
                    TripResponse response =  t.toResponse();
                    response.setNumOfLikes(reactService.countLikes(t.getId()));
                    return response;
                })
                .collect(Collectors.toList());

        PagingResponse<TripResponse> response = new PagingResponse<>(page, size, trips.getTotalPages(), tripResponses);
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

    @PutMapping("/{tripId}")
    public ResponseEntity<?> updateTrip(@PathVariable(name = "tripId", required = true) Long tripId,
                                        @RequestBody TripRequest request) {

        Trip savedTrip = tripService.updateTrip(tripId, request);
        TripResponse tripResponse = savedTrip.toResponse();
        return ResponseEntity.ok(tripResponse);
    }

    @PostMapping("/like/{tripId}")
    public ResponseEntity<?> likeTrip(@PathVariable(name = "tripId", required = true)String tripId) {
        Long id = changeStringIntoLong(tripId);
        Like like = reactService.likeTrip(id);
        LikeResponse response = new LikeResponse();
        response.setTripId(like.getTrip().getId());
        response.setUsername(like.getUser().getUsername());
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/like/{tripId}")
    public ResponseEntity<?> unlikeTrip(@PathVariable(name = "tripId", required = true) String tripId) {
        Long id = changeStringIntoLong(tripId);
        Like unlike = reactService.unlikeTrip(id);
        LikeResponse response = new LikeResponse();
        response.setTripId(unlike.getTrip().getId());
        response.setUsername(unlike.getUser().getUsername());
        return ResponseEntity.ok(response);
    }
    @GetMapping("/like/{tripId}")
    public ResponseEntity<?> getLikesByTrip(@PathVariable(name = "tripId") String tripId){
        Long id = changeStringIntoLong(tripId);
        return ResponseEntity.ok(reactService.getLikesByTripId(id));
    }

    @PostMapping("/{tripId}/comments")
    public ResponseEntity<?> addComment(@PathVariable(name = "tripId", required = true) Long tripId,
                                         @RequestBody CommentRequest request){
        reactService.commentTrip(tripId, request);
        return ResponseEntity.ok(new MessageResponse("Comment successfully"));
    }

    @PostMapping("/comments/{commentId}/reply")
    public ResponseEntity<?> replyComment(@PathVariable(name = "commentId", required = true) Long commentId,
                                          @RequestBody CommentRequest request){
        reactService.replyComment(commentId, request);
        return ResponseEntity.ok(new MessageResponse("Reply successfully"));
    }

    @GetMapping("/{tripId}/comments")
    public ResponseEntity<?> getComments(@PathVariable(name = "tripId", required = true) Long tripId){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Comment> commentList = reactService.getCommentsByTripId(tripId);
        List<CommentResponse> listResponses = commentList.stream().map(comment -> {
            CommentResponse rComment = new CommentResponse();
            //mapping
            rComment.setId(comment.getId());
            rComment.setTime(sdf.format(comment.getTime()));
            rComment.setContent(comment.getContent());
            rComment.setUsername(comment.getUser().getUsername());
            UserInfo info = userService.getInfo(comment.getUser());
            rComment.setAvatar(info.getProfileImageUrl());
            List<CommentResponse> exComments = reactService.mappingComment(comment.getExtraComment());
            rComment.setExtraComments(exComments);
//            rComment.setRoot_id(comment.getComment() != null ? comment.getComment().getId() : 0);
            return  rComment;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(listResponses);
    }


    @DeleteMapping("/comments/{commentId}")
    public ResponseEntity<?> deleteComment(@PathVariable(name = "commentId") Long commentId){
        reactService.deleteComment(commentId);
        return ResponseEntity.ok(new MessageResponse("Comment was deleted successfully"));
    }

    @PutMapping("/comments/{commentId}")
    public ResponseEntity<?> editComment(@PathVariable(name = "commentId") Long commentId,
                                         @RequestBody CommentRequest request){
        reactService.editComment(commentId, request);
        return ResponseEntity.ok(new MessageResponse("Comment was edit successfully"));
    }

    private Long changeStringIntoLong(String id){
        long tripId = 0;
        try{
            tripId = Long.parseLong(id);
        }catch (Exception e){
            throw new TripNotFoundException("Trip not found");
        }
        return tripId;
    }
}