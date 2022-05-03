package com.SkhuMentoring.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
public class Mentor {
    private Long bno;
    private String userName;
    private String userId;
    private Long userStudentNum;
    private String department;
    private String subjectName;
    private String subject;
    private String menteeCount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    private Date regDate;
    private String hopeDay;
    private String introduce;
    private String addSubject; // 과목 선택 시 항목에 없어 기타로 입력한 값
    private List<Long> menteeStudentNum;
    private Long maxPersonnel; //멘토링 최대 정원
    private Long personnel; // 멘토링 신청 인원
}
