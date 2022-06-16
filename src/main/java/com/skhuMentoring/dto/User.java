package com.skhuMentoring.dto;

import lombok.Data;

@Data
public class User {

    private Long bno;
    private String userId;
    private String userPw;
    private Long userStudentNum;
    private String userEmail;
    private String userPhoneNum;
    private String userName;
    private String department;
    private Long menteeRating;
    private Long mentorRating;
    private String imgName;
    private String nickName;
    private String oneWord;
    private String mainSubject;
    private String sns;
}
