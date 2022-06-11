package com.skhuMentoring.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Mentee {
    private Long bno;
    private String userId;
    private String userName;
    private Long userStudentNum;
    private Long menteeStudentNum;
    private String mentorWho;
    private String department;
    private String subjectName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regDate;
    private String hopeDay;
    private String introduce;
    private String addSubject; // 과목 선택 시 항목에 없어 기타로 입력한 값
    private String subject;
    private String menteeId;
    private String accept;
    private String rating; // 멘티가 멘토에게 준 평점
}
