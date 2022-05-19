package com.skhuMentoring.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Mentoring {
    private Long mno;
    private String menteeId;
    private String subjectName;
    private Date regDate;
    private String personnel;
    private Long bno;
    private String recruiting;
    private Date startDate;
    private Date endDate;
}
