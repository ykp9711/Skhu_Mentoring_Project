package com.skhuMentoring.service;

import com.skhuMentoring.dto.*;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class MentoringBoardServiceImpl implements MentoringBoardService {

    private final MentoringBoardMapper mapper;

    @Override
    public List<Mentor> getList(Criteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Override
    public List<Mentee> getMenteeList(Criteria cri) {
        return mapper.getListWithPagingMentee(cri);
    }

    @Override
    public Long getMentorTotal(Criteria cri) {
        return mapper.getMentorBoardTotal(cri);
    }

    @Override
    public Long getMenteeTotal(Criteria cri) {
        return mapper.getMenteeBoardTotal(cri);
    }

    @Override
    public void insertMentorBoard(Mentor mentor) { mapper.insertMentorBoard(mentor); }

    @Override
    public void addPersonnel(Long bno) { mapper.addPersonnel(bno); }

    @Override
    public Mentee getDetailMentee(Long bno) { return mapper.getDetailMentee(bno); }

    @Override
    public void deleteMenteeBoard(Long bno) { mapper.deleteMenteeBoard(bno); }

    @Override
    public void applicationMentor(Mentee mentee) { mapper.applicationMentor(mentee); }

    @Override
    public void menteeAcceptStatus(Long bno, String menteeId) { mapper.menteeAcceptStatus(bno, menteeId); }

    @Override
    public void insertSubject(Subject subject) { mapper.insertSubject(subject); }

    @Override
    public List<Department> getDepartment(){return mapper.getDepartment();} // 학과 목록 가져오기

    @Override
    public List<Subject> getSubject(){return mapper.getSubject();} // 등록된 강의목록 가져오기


    @Override
    public int checkSubject(String subject){return mapper.checkSubject(subject);} // 과목 등록 시 이미 DB에 등록된 과목인지 체크


    @Override
    public void deleteMentorBoard(Long bno) {
        mapper.deleteMentorBoard(bno);
    }

    @Override
    public Long getPersonnel(Long bno) {
        return mapper.getPersonnel(bno);
    }

    @Override
    public void endMentorBoard(Long bno) {
        mapper.endMentorBoard(bno);
    }

    @Override
    public void endApplicationMentor(Long bno) {
        mapper.endApplicationMentor(bno);
    }

    @Override
    public Mentor getDetailMentor(Long bno) {
        return mapper.getDetailMentor(bno);
    }

    @Override
    public int checkApplicationStatus(Long bno, String menteeId) {
        return mapper.checkApplicationStatus(bno, menteeId);
    }

    @Override
    public Long getMaxPersonnel(Long bno) {
        return mapper.getMaxPersonnel(bno);
    }

    @Override
    public void menteeAccept(Long bno) {
        mapper.menteeAccept(bno);
    }

    @Override
    public void mentorBoardUpdate(Long bno) {
        mapper.mentorBoardUpdate(bno);
    }

    @Override
    public List<Mentee> getDetailMentees(Long bno) {
        return mapper.getDetailMentees(bno);
    }

    @Override
    public void insertMenteeBoard(Mentee mentee) {
        mapper.insertMenteeBoard(mentee);
    }
}
