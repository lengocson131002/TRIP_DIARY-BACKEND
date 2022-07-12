package com.packandgo.tripdiary.payload.response;

import com.packandgo.tripdiary.enums.Gender;
import com.packandgo.tripdiary.enums.UserStatus;

import java.util.Date;

public class AdminResponse extends UserResponse{
    private String email;
    private UserStatus status;
    private String phonenumber;
    public Gender gender;
    public Date birthday;

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }



    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }
}
