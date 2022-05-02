package com.SkhuMentoring.mapper;

import com.SkhuMentoring.dto.*;
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

    void deleteMenteeBoard(Long bno); // 멘티 게시판 글 삭제

    public void setUpMentoring(String menteeStudentNum);

    public User login(Map<String, String> map);

    Mentor getDetailMentor(Long bno); // 멘토목록 상세보기 값 가져오기
    
    Mentee getDetailMentee(Long bno); // 멘티목록 상세보기 값 가져오기
}
