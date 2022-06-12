package com.skhuMentoring.service;

import com.skhuMentoring.dto.Criteria;
import com.skhuMentoring.dto.Mentee;
import com.skhuMentoring.dto.Mentor;
import com.skhuMentoring.dto.Subject;
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
    public void deleteMenteeboard(Long bno) { mapper.deleteMenteeboard(bno); }

    @Override
    public void applicationMentor(Mentee mentee) { mapper.applicationMentor(mentee); }

    @Override
    public void menteeAcceptStatus(Long bno, String menteeId) { mapper.menteeAcceptStatus(bno, menteeId); }

    @Override
    public void insertSubject(Subject subject) { mapper.insertSubject(subject); }
}
