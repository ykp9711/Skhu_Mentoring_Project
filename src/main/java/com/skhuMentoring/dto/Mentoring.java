package com.skhuMentoring.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Mentoring {
    private Long mno;
    private String menteeId;
    private String userName;
    private Long userStudentNum;
    private String subjectName;
    private Date regDate;
    private Long personnel;
    private Long bno;
    private String recruiting;
    private Date realStartDate; // 멘토링 시작일
    private Date realEndDate; // 멘토링 종료일
    private String refusalReason; // 멘토링 신청 거절 사유
    private String rating; // 멘티가 멘토에게 준 평점
    private int checkRating; // 멘티평점 완료 여부
    private Date startDate;
    private Date endDate;
}
