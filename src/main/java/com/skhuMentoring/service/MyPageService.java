package com.skhuMentoring.service;

import com.skhuMentoring.dto.*;

import java.util.List;

public interface MyPageService {
    int getMentorCount(String MentorId); // 해당 멘토가 지금까지 진행한 멘토링 횟수

    int getMentoringCount(String mentorId); // 해당 멘토의 멘토링을 받은 멘티 수

    //마이페이지 멘티에게 받은 요청에서 멘티의 상세보기
    Mentee getDetailMentee(Long bno, String menteeId);

    int getMenteeCount(String menteeId); // 해당 멘티가 지금까지 진행한 멘토링 횟수

    //내 멘토 현황
    public List<Mentor> getMentorMyStatus(String userId);

    //마이페이지 멘토에게 보낸 신청
    List<Mentee> getApplicationMentor(String menteeId);

    //마이페이지 멘티에게 받은 요청
    List<Mentee> getRequestMentee(String mentorId);

    List<Mentoring> getMyMentoring(String userId); // 마이페이지 - > 멘토현황

    List<Mentoring> getMyMenteeStatus(String userId); // 마이페이지 - > 멘티현황

    //멘티현황
    public List<Mentee> getMenteeStatus();

    //멘토링 현황
    public List<Mentoring> getMentoring();

    Mentoring showRefusalReason(Long bno, String menteeId); // 거절 이유 확인

    void refusalReason(Long bno, String menteeId, String refusalReason); // 거절 이유 작성

    //마이페이지 -> 멘토에게 보낸 신청취소
    void cancelApplication(Long bno, String menteeId);

    //마이페이지 내정보 수정
    void modifyUserInfo(User user);

    List<Mentoring> getMenteeList(Long bno); // 해당 멘토링에 참여중인 모든 멘티 목록을 가져온다

    List<Mentoring> getMentorList(Long bno); // 해당 멘토링에 참여중인 모든 멘토 목록을 가져온다

    int getCheckRatingMentor(Long bno,String menteeId); // 해당 멘토링 게시글에 멘티가 멘토 평가여부를 가져온다.

    void updateRating(Rating rating); // tbl_user 테이블에 멘티 평가점수를 합산시켜준다

    void ratingOk(Rating rating); // 멘티평가 후 해당 멘티평가 여부를 변경시켜준다.

    void updateRatingMentor(Rating rating);

    /*멘토 평가 종료*/
    public void endRatingMentor(Long bno, String userId);

    //멘토링종료
    public void endMentoring(Long bno);
    public void endMentoringAccept(Long bno); // tbl_applicationMentor 테이블에서 Accept를 수락됨 - > 종료됨으로 변경


}
