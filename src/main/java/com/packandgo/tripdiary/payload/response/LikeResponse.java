package com.packandgo.tripdiary.payload.response;

public class LikeResponse {
    private Long tripId;
    private Long userId;

    public LikeResponse(){}
    public Long getTripId() {
        return tripId;
    }

    public void setTripId(Long tripId) {
        this.tripId = tripId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
