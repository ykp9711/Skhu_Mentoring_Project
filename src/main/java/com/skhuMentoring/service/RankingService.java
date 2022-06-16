package com.skhuMentoring.service;

import com.skhuMentoring.dto.User;

import java.util.List;

public interface RankingService {
    List<User> getMentorRankAll(); // 멘토 4~10등 정보
    User getMentorRankOne(); // 멘토 1등 정보
    User getMentorRankTwo(); // 멘토 2등 정보
    User getMentorRankThree(); // 멘토 3등 정보
}
