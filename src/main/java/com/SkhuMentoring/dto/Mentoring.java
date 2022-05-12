package com.SkhuMentoring.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Mentoring {
    private Long mno;
    private String mentorId;
    private String menteeCount;
    private String student;
    private boolean proceeding;
    private Long bno;
}
