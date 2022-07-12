package com.packandgo.tripdiary.repository;

import com.packandgo.tripdiary.model.Like;
import com.packandgo.tripdiary.model.Trip;
import com.packandgo.tripdiary.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LikeRepository extends JpaRepository<Like, Long> {
    Boolean existsByTripIdAndUserId(Long tripId, Long userId);
    Like findByTripIdAndUserId(Long tripId, Long userId);
    @Query("SELECT l FROM Like l WHERE l.trip.id = ?1")
    List<Like> findTripsByTripId(Long tripId);
}
