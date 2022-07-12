package com.packandgo.tripdiary.service.impl;

import com.packandgo.tripdiary.model.*;
import com.packandgo.tripdiary.payload.request.trip.CommentRequest;
import com.packandgo.tripdiary.payload.response.CommentResponse;
import com.packandgo.tripdiary.payload.response.LikeResponse;
import com.packandgo.tripdiary.repository.*;
import com.packandgo.tripdiary.service.EmailSenderService;
import com.packandgo.tripdiary.service.ReactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReactServiceImpl implements ReactService {
    private final TripRepository tripRepository;
    private final UserRepository userRepository;
    private final LikeRepository likeRepository;
    private final CommentRepository commentRepository;
    private final UserInfoRepository userInfoRepository;
    @Value("${tripdiary.baseurl.frontend}")
    private String frontendUrl;

    @Autowired
    public ReactServiceImpl(TripRepository tripRepository, UserRepository userRepository,
                            LikeRepository likeRepository, CommentRepository commentRepository,
                            UserInfoRepository userInfoRepository)
    {
        this.tripRepository = tripRepository;
        this.userRepository = userRepository;
        this.likeRepository = likeRepository;
        this.commentRepository = commentRepository;
        this.userInfoRepository = userInfoRepository;
    }
    @Override
    public Like likeTrip(Long tripId) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();


        Trip trip = tripRepository.findById(tripId).orElseThrow(
                () -> new IllegalArgumentException("Trip with ID \"" + tripId + "\" doesn't exist")
        );
        if (likeRepository.existsByTripIdAndUserId(trip.getId(), user.getId()) == false) {
            Like like = new Like();
            like.setUser(user);
            like.setTrip(trip);
            likeRepository.save(like);
            return like;
        } else {
            throw new IllegalArgumentException("You already like this trip");
        }
    }
    @Override
    public Like unlikeTrip(Long tripId) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();


        Trip trip = tripRepository.findById(tripId).orElseThrow(
                () -> new IllegalArgumentException("Trip with ID \"" + tripId + "\" doesn't exist")
        );
        if (likeRepository.existsByTripIdAndUserId(trip.getId(), user.getId()) == true) {
            Like existedLike = likeRepository.findByTripIdAndUserId(trip.getId(), user.getId());
            likeRepository.delete(existedLike);
            return existedLike;
        } else {
            throw new IllegalArgumentException("You already unlike this trip");
        }
    }
    @Override
    public List<LikeResponse> getLikesByTripId(Long tripId){
        Trip trip = tripRepository.findById(tripId).orElseThrow(
                () -> new IllegalArgumentException("Trip with ID \"" + tripId + "\" doesn't exist")
        );
        List<Like> likeList = likeRepository.findTripsByTripId(tripId);
        List<LikeResponse> likeResponseList = likeList.stream().map(like -> {
            LikeResponse response = new LikeResponse();
                    response.setTripId(like.getTrip().getId());
                    response.setUserId(like.getUser().getId());
                    return response;
        }).collect(Collectors.toList());
        return likeResponseList;
    }
    @Override
    public void commentTrip(Long tripId, CommentRequest request){

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();
        Trip trip = tripRepository.findById(tripId).orElseThrow(
                () ->  new IllegalArgumentException("Trip with ID \"" + tripId + "\" doesn't exist")
        );
        Date date = new Date();
        Comment comment = new Comment();
        if(request.getContent().trim().isEmpty())
        {
            throw new IllegalArgumentException("Comment can't be blank");
        }

        comment.setContent(request.getContent());
        comment.setUser(user);
        comment.setTrip(trip);
        comment.setTime(date);
        comment.setComment(null);
        commentRepository.save(comment);

    }
    @Override
    public List<Comment> getCommentsByTripId(Long tripId){

        List<Comment> comments = commentRepository.findCommentsByTripId(tripId);
        return comments;
    }
    @Override
    public void deleteComment(Long commentId){
        if (commentId == null) {
            throw new IllegalArgumentException("Removed comment's ID is required");
        }

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();

        Comment existedComment = commentRepository.findCommentById(commentId).orElseThrow(
                () -> new IllegalArgumentException("Comment with ID \"" + commentId + "\" doesn't exist")
        );
        if(existedComment.getUser().getId() == user.getId()) {
            commentRepository.delete(existedComment);
        }else{
            throw new IllegalArgumentException("You have no permission to delete this comment");
        }
    }
    @Override
    public void editComment(Long commentId, CommentRequest request) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();
        if (request.getContent().trim().isEmpty()) {
            throw new IllegalArgumentException("Comment can't be blank");
        }
        Comment existedComment = commentRepository.findCommentById(commentId).orElseThrow(
                () -> new IllegalArgumentException("Comment with ID \"" + commentId + "\" ")
        );
        if (existedComment.getUser().getId() == user.getId()) {
            existedComment.setContent(request.getContent());
            commentRepository.save(existedComment);
        } else {
            throw new IllegalArgumentException("You have no permission to edit this comment");
        }
    }
    @Override
    public void replyComment(Long commentId, CommentRequest request){
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();
        Comment rootComment = commentRepository.findCommentById(commentId).orElseThrow(
                () ->  new IllegalArgumentException("Comment with ID \"" + commentId + "\" doesn't exist")
        );
        Trip trip = tripRepository.findById(rootComment.getTrip().getId()).orElseThrow(
                () ->  new IllegalArgumentException("Trip with ID \"" + rootComment.getTrip().getId() + "\" doesn't exist")
        );
        Date date = new Date();
        Comment comment = new Comment();
        if(request.getContent().trim().isEmpty())
        {
            throw new IllegalArgumentException("Comment can't be blank");
        }
        comment.setContent(request.getContent());
        comment.setUser(user);
        comment.setTrip(trip);
        comment.setTime(date);
//        comment.setComment(rootComment);
        commentRepository.save(comment);
        rootComment.addExComments(comment);
        commentRepository.save(rootComment);
    }
    @Override
    public List<CommentResponse> mappingComment(List<Comment> commentList){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<CommentResponse> listResponses = commentList.stream().map(comment -> {
            CommentResponse rComment = new CommentResponse();
            //mapping
            rComment.setId(comment.getId());
            rComment.setTime(sdf.format(comment.getTime()));
            rComment.setContent(comment.getContent());
            rComment.setUsername(comment.getUser().getUsername());
            UserInfo info = userInfoRepository.findByUserId(comment.getUser().getId()).orElseThrow(
                    () ->  new IllegalArgumentException("UserInfo is in error")
            );;
            rComment.setAvatar(info.getProfileImageUrl());
            rComment.setExtraComments(comment.getExtraComment());
//            rComment.setRoot_id(comment.getComment() != null ? comment.getComment().getId() : 0);
            return  rComment;
        }).collect(Collectors.toList());
        return listResponses;
    }
    @Override
    public int countLikes(Long tripId){
        return likeRepository.countNumOfLike(tripId);
    }
}
