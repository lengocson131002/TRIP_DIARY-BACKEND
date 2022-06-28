package com.packandgo.tripdiary.service;

import com.packandgo.tripdiary.model.Comment;
import com.packandgo.tripdiary.payload.request.trip.CommentRequest;
import com.packandgo.tripdiary.payload.response.CommentResponse;

import java.util.List;

public interface ReactService {
    public void commentTrip(Long commentId, CommentRequest request);
    public List<Comment> getCommentsByTripId(Long tripId);
    public void likeTrip(Long tripId);
    public void deleteComment(Long commentId);
    public void editComment(Long commentId, CommentRequest request);
    public void replyComment(Long commentId, CommentRequest request);
    public List<CommentResponse> mappingComment(List<Comment> commentList);
}
