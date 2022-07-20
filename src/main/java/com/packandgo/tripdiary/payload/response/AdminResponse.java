package com.packandgo.tripdiary.payload.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.packandgo.tripdiary.enums.Gender;
import com.packandgo.tripdiary.enums.UserStatus;

import java.util.Date;

public class AdminResponse extends UserResponse{
    private String email;
    private String phoneNumber;
    public Gender gender;

    @JsonFormat(pattern = "yyyy-MM-dd", shape = JsonFormat.Shape.STRING)
    public Date birthday;

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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


}
