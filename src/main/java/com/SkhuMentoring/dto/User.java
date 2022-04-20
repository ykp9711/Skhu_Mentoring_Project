package com.SkhuMentoring.dto;

import lombok.Data;

@Data
public class User {

    private  long seq;

    int userNum;
    String userName;
    String userId;
    String userPw;
    String department;
    String userStudentNum;
    String userEmail;
    String userPhoneNum;
    int checkAdmin;

}
