package com.skhuMentoring.mapper;

import com.skhuMentoring.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MentoringBoardMapper {
    List<Department> getDepartment(); // 학과 목록 가져오기

    List<Subject> getSubject(); // 등록된 강의목록 가져오기

    void insertSubject(Subject subject);

    void insertMentorBoard(Mentor mentor); // 멘토 게시글 등록
    
    int checkSubject(String subject); // 과목 등록 시 이미 DB에 등록된 과목인지 체크

    void insertMenteeBoard(Mentee mentee); // 멘티 게시글 등록
    
    void deleteMentorBoard(Long bno); // 멘토 게시판 글 삭제

    void endMentorBoard(Long bno); // 멘토 게시판 모집 종료

    void deleteMenteeBoard(Long bno); // 멘티 게시판 글 삭제

    public void setUpMentoring(String menteeStudentNum);

    public User login(Map<String, String> map);

    Mentor getDetailMentor(Long bno); // 멘토목록 상세보기 값 가져오기
    
    Mentee getDetailMentee(Long bno); // 멘티목록 상세보기 값 가져오기
    
    void applicationMentor(Mentee mentee); //멘토 게시글에서 신청



    List<Mentor> getMentoring(Long bno); // bno번호로 멘토게시글 정보 가져오기

    int checkApplicationStatus(Long bno, String menteeId); // 멘토목록에서 신청한 게시글 여부 확인

    void menteeAccept(Long bno); // 멘티 수락 시 정원 +1
    
    void menteeAcceptStatus(Long bno); // 멘티 수락 시 상태를 수락중으로 변경
    
    List<Mentee> getDetailMentees(Long bno); // 멘토 목록에서 현재 신청한 멘티 정보를 가져온다

    List<Mentor> sliderMentor();

    List<Mentor> sliderMentee();
}
