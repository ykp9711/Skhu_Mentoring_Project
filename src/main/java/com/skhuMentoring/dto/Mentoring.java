package com.skhuMentoring.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Mentoring {
    private Long mno;
    private String menteeId;
    private String userName;
    private String subjectName;
    private Date regDate;
    private Long personnel;
    private Long bno;
    private String recruiting;
    private Date realStartDate; // 멘토링 시작일
    private Date realEndDate; // 멘토링 종료일
    private String refusalReason; // 멘토링 신청 거절 사유
}
