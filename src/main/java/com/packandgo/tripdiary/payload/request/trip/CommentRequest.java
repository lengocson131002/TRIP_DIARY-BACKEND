package com.packandgo.tripdiary.payload.request.trip;

public class CommentRequest {
    private String content;

    private Long id;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
