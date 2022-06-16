package com.packandgo.tripdiary.service.impl;

import com.packandgo.tripdiary.model.Comment;
import com.packandgo.tripdiary.model.Like;
import com.packandgo.tripdiary.model.Trip;
import com.packandgo.tripdiary.model.User;
import com.packandgo.tripdiary.payload.request.trip.CommentRequest;
import com.packandgo.tripdiary.payload.request.trip.TripRequest;
import com.packandgo.tripdiary.repository.*;
import com.packandgo.tripdiary.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;



@Service
public class TripServiceImpl implements TripService {
    private final TripRepository tripRepository;
    private final UserRepository userRepository;
    private final DestinationRepository destinationRepository;
    private final LikeRepository likeRepository;
    private final CommentRepository commentRepository;

    @Autowired
    public TripServiceImpl(TripRepository tripRepository, UserRepository userRepository, DestinationRepository destinationRepository, LikeRepository likeRepository, CommentRepository commentRepository) {
        this.tripRepository = tripRepository;
        this.userRepository = userRepository;
        this.destinationRepository = destinationRepository;
        this.likeRepository = likeRepository;
        this.commentRepository = commentRepository;
    }

    @Override
    @Transactional
    public void insertTrip(TripRequest request) {
        if (request == null) {
            throw new IllegalArgumentException("Trip information is required");
        }

        //get current user
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).orElseThrow(
                () -> new UsernameNotFoundException("Unauthorized user")
        );

        if (request.getNotifyBefore() < 1) {
            throw new IllegalArgumentException("Trip should be announced at least 1 day earlier than its starting");
        }
        if (request.getDestination() == null) {
            throw new IllegalArgumentException("Trip's destination is required");
        }
        if (request.getName() == null || request.getName().trim().length() == 0) {
            throw new IllegalArgumentException("Trip's name is required");
        }
        if (request.getName() == null || request.getName().trim().length() == 0) {
            throw new IllegalArgumentException("Trip's name is required");
        }

        Trip newTrip = new Trip();
        newTrip.mapping(request);
        newTrip.setUser(user);

        tripRepository.save(newTrip);
    }

    @Override
    public Page<Trip> getTrips(int page, int size) {
        Pageable paging = PageRequest.of(page - 1, size);
        Page<Trip> trips = tripRepository.findAll(paging);

        return trips;
    }

    @Override
    @Transactional
    public void removeTrip(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("Removed trip's ID is required");
        }

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();
        List<Trip> trips = getTripsForUser(user);

        Trip existedTrip = trips.stream().filter(trip -> trip.getId() == id).findAny().orElseThrow(
                () -> new IllegalArgumentException("You have no permission to delete this trip")
        );

        tripRepository.delete(existedTrip);
    }

    @Override
    @Transactional
    public void updateTrip(Long tripId, TripRequest request) {

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();
        List<Trip> trips = getTripsForUser(user);

        Trip trip = trips.stream().filter(t -> t.getId() == tripId).findAny().orElseThrow(
                () -> new IllegalArgumentException("You have no permission to update this trip")
        );

        if (request.getNotifyBefore() < 1) {
            throw new IllegalArgumentException("Trip should be announced at least 1 day earlier than its starting");
        }
        if (request.getDestination() == null) {
            throw new IllegalArgumentException("Trip's destination is required");
        }
        if (request.getName() == null || request.getName().trim().length() == 0) {
            throw new IllegalArgumentException("Trip's name is required");
        }

        //remove the old destination in database
        if (trip.getDestination() != null) {
            destinationRepository.delete(trip.getDestination());
        }

        trip.mapping(request);

        tripRepository.save(trip);
    }

    @Override
    public Trip get(Long id) {
        Trip trip = tripRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("Trip with ID \"" + id + "\" doesn't exist")
        );
        return trip;
    }

    @Override
    public List<Trip> getTripsForUser(User user) {
        List<Trip> trips = tripRepository.findByUserId(user.getId());
        return trips;
    }

    @Override
    public boolean existedTrip(Long tripId) {
        return tripRepository.existsById(tripId);
    }


    public void likeTrip(Long tripId){
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();

        User user = userRepository.findByUsername(userDetails.getUsername()).get();


        Trip trip = tripRepository.findById(tripId).orElseThrow(
                () ->  new IllegalArgumentException("Trip with ID \"" + tripId + "\" doesn't exist")
        );
        if (likeRepository.existsByTripIdAndUserId(trip.getId(), user.getId()) == false) {
            Like like = new Like();
            like.setUser(user);
            like.setTrip(trip);
            likeRepository.save(like);
        } else {
            Like existedLike = likeRepository.findByTripIdAndUserId(trip.getId(), user.getId());
            likeRepository.delete(existedLike);
        }
    }

    @Override
    public boolean existedLike(Long tripId){
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();


        User user = userRepository.findByUsername(userDetails.getUsername()).get();

        Trip trip = tripRepository.findById(tripId).orElseThrow(
                () ->  new IllegalArgumentException("Trip with ID \"" + tripId + "\" doesn't exist")
        );
        return likeRepository.existsByTripIdAndUserId(trip.getId(), user.getId());
    }

    @Override
    public List<Trip> getNotifiedTripsForDay() {
        return tripRepository.getTripsForToday();
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
        if(request.getId() != 0) {
            Comment rootComment = commentRepository.findCommentById(request.getId()).orElseThrow(
                    () ->  new IllegalArgumentException("Comment with ID \"" + request.getId() + "\" doesn't exist")
            );
            comment.setContent(request.getContent());
            comment.setUser(user);
            comment.setTrip(trip);
            comment.setTime(date);
            comment.setComment(rootComment);
            commentRepository.save(comment);
        }else {
            comment.setContent(request.getContent());
            comment.setUser(user);
            comment.setTrip(trip);
            comment.setTime(date);
            comment.setComment(null);
            commentRepository.save(comment);
        }
    }
    @Override
    public List<Comment> getCommentsByTripId(Long tripId){
        List<Comment> comments = commentRepository.findCommentsByTripId(tripId);
        return comments;
    }
}
