package com.packandgo.tripdiary.repository;

import com.packandgo.tripdiary.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    boolean existsById(Long id);
    Optional<Comment> findCommentById(Long id);
    List<Comment> findCommentsByTripId(Long id);
    @Query("SELECT c FROM Comment c WHERE c.id = ?1 and c.trip.id = ?2")
    Optional<Comment> findCommentByCommentIdAndTripId(Long id, Long tripId);
}
