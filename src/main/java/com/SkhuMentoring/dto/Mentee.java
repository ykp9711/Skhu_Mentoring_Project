package com.SkhuMentoring.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Mentee {
    private int bno;
    private String userId;
    private String userStudentNum;
    private String mentorWho;
    private String department;
    private String subjectName;
    private Date startDate;
    private Date endDate;
    private Date regDate;
    private String hopeDay;
    private String introduce;
}
