package com.skhuMentoring.dto;

import lombok.Data;

@Data
public class Rating {
    private int rating;  // 수업태도
    private int rating2; // 시간준수
    private int rating3; // 준비물
    private int sumRating; // 평가점수 합
    private Long bno;    // 해당 멘토링 게시글 번호
    private String menteeId; // 해당 멘토링 게시글에서 평점을 메긴 menteeId
}
