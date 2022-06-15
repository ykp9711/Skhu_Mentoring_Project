package com.skhuMentoring.service;

import com.skhuMentoring.dto.*;

import java.util.List;

public interface MentoringBoardService {

    //멘토 목록 게시글 페이징해서 가져오기
    public List<Mentor> getList(Criteria cri);

    //멘토 목록 게시글 총 개수
    public Long getMentorTotal(Criteria cri);

    //멘티 목록 게시글 페이징해서 가져오기
    public List<Mentee> getMenteeList(Criteria cri);

    //멘티 목록 게시글 총 개수
    public Long getMenteeTotal(Criteria cri);

    // 멘토 목록에 멘토 등록
    public void insertMentorBoard(Mentor mentor);

    // 정원 +1
    public void addPersonnel(Long bno);

    // 멘티 상세보기
    public Mentee getDetailMentee(Long bno);

    // 멘토 신청
    public void applicationMentor(Mentee mentee);

    // 멘티 대기중에서 수락됨으로
    public void menteeAcceptStatus(Long bno, String menteeId);

    // 과목 추가
    public void insertSubject(Subject subject);

    // 학과 목록 가져오기
    public List<Department> getDepartment();

    // 등록된 강의목록 가져오기
    public List<Subject> getSubject();

    // 멘토목록 상세보기 값 가져오기
    public Mentor getDetailMentor(Long bno);

    // 과목 등록 시 이미 DB에 등록된 과목인지 체크
    public int checkSubject(String subject);

    void deleteMentorBoard(Long bno); // 멘토 게시판 글 삭제

    Long getPersonnel(Long bno); // 해당 멘토링 현재 신청 인원 조회

    void endMentorBoard(Long bno); // 멘토 게시판 모집 종료

    void endApplicationMentor(Long bno); // 멘토가 모집종료를 누르면 tbl_applicationMentor의 accept값이 수락됨 - > 진행중으로 변경

    void deleteMenteeBoard(Long bno); //멘티보드에서 해당 bno로 글 삭제

    int checkApplicationStatus(Long bno, String menteeId); // 멘토목록에서 신청한 게시글 여부 확인

    Long getMaxPersonnel(Long bno); // 멘토가 개설한 정원수

    void menteeAccept(Long bno); // 멘티 수락 시 정원 +1

    void mentorBoardUpdate(Long bno);

    List<Mentee> getDetailMentees(Long bno); // 멘토 목록에서 현재 신청한 멘티 정보를 가져온다

}
