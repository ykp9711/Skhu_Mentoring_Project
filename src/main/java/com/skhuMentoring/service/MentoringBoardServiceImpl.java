package com.skhuMentoring.service;

import com.skhuMentoring.dto.Criteria;
import com.skhuMentoring.dto.Mentor;
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
    public Long getMentorTotal(Criteria cri) {
        return mapper.getMentorBoardTotal(cri);
    }
}
