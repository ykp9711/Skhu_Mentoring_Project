package com.skhuMentoring.service;

import com.skhuMentoring.dto.*;
import com.skhuMentoring.mapper.MyPageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService {
    private final MyPageMapper mapper;
    @Override
    public int getMentorCount(String MentorId) {
        return mapper.getMentorCount(MentorId);
    }

    @Override
    public int getMentoringCount(String mentorId) {
        return mapper.getMentoringCount(mentorId);
    }

    @Override
    public Mentee getDetailMentee(Long bno, String menteeId) {
        return mapper.getDetailMentee(bno,menteeId);
    }

    @Override
    public int getMenteeCount(String menteeId) {
        return mapper.getMenteeCount(menteeId);
    }

    @Override
    public List<Mentor> getMentorMyStatus(String userId) {
        return mapper.getMentorMyStatus(userId);
    }

    @Override
    public List<Mentee> getApplicationMentor(String menteeId) {
        return mapper.getApplicationMentor(menteeId);
    }

    @Override
    public List<Mentee> getRequestMentee(String mentorId) {
        return mapper.getRequestMentee(mentorId);
    }

    @Override
    public List<Mentoring> getMyMentoring(String userId) {
        return mapper.getMyMentoring(userId);
    }

    @Override
    public List<Mentoring> getMyMenteeStatus(String userId) {
        return mapper.getMyMenteeStatus(userId);
    }

    @Override
    public List<Mentee> getMenteeStatus() {
        return mapper.getMenteeStatus();
    }

    @Override
    public List<Mentoring> getMentoring() {
        return mapper.getMentoring();
    }

    @Override
    public Mentoring showRefusalReason(Long bno, String menteeId) {
        return mapper.showRefusalReason(bno, menteeId);
    }

    @Override
    public void refusalReason(Long bno, String menteeId, String refusalReason) {
        mapper.refusalReason(bno,menteeId,refusalReason);
    }

    @Override
    public void cancelApplication(Long bno, String menteeId) {
        mapper.cancelApplication(bno, menteeId);
    }

    @Override
    public void modifyUserInfo(User user) {
        mapper.modifyUserInfo(user);
    }

    @Override
    public List<Mentoring> getMenteeList(Long bno) {
        return mapper.getMenteeList(bno);
    }

    @Override
    public List<Mentoring> getMentorList(Long bno) {
        return mapper.getMentorList(bno);
    }

    @Override
    public int getCheckRatingMentor(Long bno, String menteeId) {
        return mapper.getCheckRatingMentor(bno, menteeId);
    }

    @Override
    public void updateRating(Rating rating) {
        mapper.updateRating(rating);
    }

    @Override
    public void ratingOk(Rating rating) {
        mapper.ratingOk(rating);
    }

    @Override
    public void updateRatingMentor(Rating rating) {
        mapper.updateRatingMentor(rating);
    }

    @Override
    public void endRatingMentor(Long bno, String userId) {
        mapper.endRatingMentor(bno, userId);
    }

    @Override
    public void endMentoring(Long bno) {
        mapper.endMentoring(bno);
    }

    @Override
    public void endMentoringAccept(Long bno) {
        mapper.endMentoringAccept(bno);
    }
}
