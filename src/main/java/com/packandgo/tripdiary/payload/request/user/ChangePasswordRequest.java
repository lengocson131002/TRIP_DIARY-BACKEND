package com.packandgo.tripdiary.payload.request.user;

public class ChangePasswordRequest {

    private String password;
    private String confirmPassword;

    public ChangePasswordRequest() {
    }

    public ChangePasswordRequest(String password, String confirmPassword) {
        this.password = password;
        this.confirmPassword = confirmPassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
