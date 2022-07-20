package com.packandgo.tripdiary.payload.response;

import com.packandgo.tripdiary.enums.UserStatus;
import com.packandgo.tripdiary.model.Role;
import com.packandgo.tripdiary.model.Trip;

import java.util.List;
import java.util.Set;

public class UserResponse {
    private String username;

    private Set<Role> roles;
    private String avatar;
    private String aboutMe;
    private String country;
    private String profileImageUrl;
    private String coverImageUrl;
    private List<TripResponse> trips;

    private UserStatus status;

    public UserResponse() {}

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getProfileImageUrl() {
        return profileImageUrl;
    }

    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }

    public String getCoverImageUrl() {
        return coverImageUrl;
    }

    public void setCoverImageUrl(String coverImageUrl) {
        this.coverImageUrl = coverImageUrl;
    }

    public List<TripResponse> getTrips() {
        return trips;
    }

    public void setTrips(List<TripResponse> trips) {
        this.trips = trips;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }
}
