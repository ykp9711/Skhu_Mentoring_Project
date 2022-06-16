package com.skhuMentoring.service;

import com.skhuMentoring.dto.User;
import com.skhuMentoring.mapper.RangkingMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RankingServiceImpl implements RankingService{
    private final RangkingMapper mapper;
    @Override
    public List<User> getMentorRankAll() {
        return mapper.getMentorRankAll();
    }

    @Override
    public User getMentorRankOne() {
        return mapper.getMentorRankOne();
    }

    @Override
    public User getMentorRankTwo() {
        return mapper.getMentorRankTwo();
    }

    @Override
    public User getMentorRankThree() {
        return mapper.getMentorRankThree();
    }
}
