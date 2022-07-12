package com.packandgo.tripdiary.service;

import com.packandgo.tripdiary.model.Comment;
import com.packandgo.tripdiary.model.Like;
import com.packandgo.tripdiary.model.Trip;
import com.packandgo.tripdiary.payload.request.trip.CommentRequest;
import com.packandgo.tripdiary.payload.response.CommentResponse;
import com.packandgo.tripdiary.payload.response.LikeResponse;

import java.util.List;

public interface ReactService {
    public void commentTrip(Long commentId, CommentRequest request);
    public List<Comment> getCommentsByTripId(Long tripId);
    public Like likeTrip(Long tripId);
    public Like unlikeTrip(Long tripId);
    public List<LikeResponse> getLikesByTripId(Long tripId);
    public void deleteComment(Long commentId);
    public void editComment(Long commentId, CommentRequest request);
    public void replyComment(Long commentId, CommentRequest request);
    public List<CommentResponse> mappingComment(List<Comment> commentList);
    public int countLikes(Long tripId);
}
