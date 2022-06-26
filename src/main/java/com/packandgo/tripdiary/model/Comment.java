package com.packandgo.tripdiary.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "content")
    private String content;

    @Column(name = "date", columnDefinition = "DATETIME")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date time;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "user_id",referencedColumnName = "id", nullable = false)
    @JsonIgnore
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "trip_id",referencedColumnName = "id", nullable = false)
    @JsonIgnore
    private Trip trip;

    @OneToMany(mappedBy = "trip",
            fetch = FetchType.LAZY,
            cascade = CascadeType.ALL,
            orphanRemoval = true)
    private List<Comment> extraComment;

    @ManyToOne(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "comment_root_id",referencedColumnName = "id")
    @JsonIgnore
    private Comment rComment;
    public void addExComment(Comment exComment) {
        if (this.extraComment == null) {
            extraComment = new ArrayList<>();
        }
        this.extraComment.add(exComment);
        exComment.setComment(this);
    }

    public Comment getComment() {
        return rComment;
    }

    public void setComment(Comment rComment) {
        this.rComment = rComment;
    }

    public List<Comment> getExtraComment() {
        return extraComment;
    }

    public void setExtraComment(List<Comment> extraComment) {
        this.extraComment = extraComment;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }

}
