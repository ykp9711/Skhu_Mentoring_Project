package com.SkhuMentoring.dto;

import lombok.Data;

@Data
public class User {
    private String userId;
    private String password;
    private String name;
    private String department;
    private String phone;
    private String email;
    private String studentNum;

}
