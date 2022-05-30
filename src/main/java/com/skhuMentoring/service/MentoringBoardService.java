package com.skhuMentoring.service;

import com.skhuMentoring.dto.Criteria;
import com.skhuMentoring.dto.Mentor;

import java.util.List;

public interface MentoringBoardService {

    //멘토 목록 게시글 페이징해서 가져오기
    public List<Mentor> getList(Criteria cri);

    //멘토 목록 게시글 총 개수
    public Long getMentorTotal(Criteria cri);
}
