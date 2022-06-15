package com.skhuMentoring.service;

import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.dto.User;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private MentoringBoardMapper mentoringBoardMapper;

    private UserMapper userMapper;

    public User login(Map<String, String> map) throws Exception {
        return mentoringBoardMapper.login(map);
    }

    @Override
    public List<String> findId(String userEmail) throws Exception {
        return userMapper.findId(userEmail);
    }

    // 회원탈퇴
    @Override
    public void deleteUser(String userId) throws Exception {
        userMapper.deleteUser(userId);
    }

    // userId로 해당 유저 정보 모두 가져오기
    @Override
    public User getUser(String userId){
        return userMapper.getUser(userId);
    }

}
