package com.SkhuMentoring.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Mentor {
    private int bno;
    private String userId;
    private String userStudentNum;
    private int menteeCount;
    private String department;
    private String subjectName;
    private Date startDate;
    private Date endDate;
    private Date regDate;
    private String hopeDay;
    private String introduce;
}
