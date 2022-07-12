package com.packandgo.tripdiary.payload.response;

public class LikeResponse {
    private Long tripId;
    private String username;

    public LikeResponse(){}
    public Long getTripId() {
        return tripId;
    }

    public void setTripId(Long tripId) {
        this.tripId = tripId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
