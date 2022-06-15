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

    // 멘티 목록에서 삭제
    public void deleteMenteeboard(Long bno);

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
}
