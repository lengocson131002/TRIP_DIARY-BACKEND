package com.packandgo.tripdiary.payload.response;

import com.packandgo.tripdiary.model.Comment;

import java.util.Date;
import java.util.List;

public class CommentResponse<T> {
    private Long id;
    private String content;
    private Date time;
    private Long comment_root_id;

    public CommentResponse(List<Comment> commentList) {
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

    public Long getComment_root_id() {
        return comment_root_id;
    }

    public void setComment_root_id(Long comment_root_id) {
        this.comment_root_id = comment_root_id;
    }
}
