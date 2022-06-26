package com.packandgo.tripdiary.payload.response;

import com.packandgo.tripdiary.model.Comment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CommentResponse<T> {
    private Long id;
    private String content;
    private String time;
    private Long root_id;

    public Long getRoot_id() {
        return root_id;
    }

    public void setRoot_id(Long root_id) {
        this.root_id = root_id;
    }

    //    private List<Comment> extraComment = new ArrayList<>();
    private String username;
    private String avatar;

    public CommentResponse() {
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

//    public List<Comment> getExtraComment() {
//        return extraComment;
//    }
//
//    public void setExtraComment(List<Comment> extraComment) {
//        this.extraComment = extraComment;
//    }
}
