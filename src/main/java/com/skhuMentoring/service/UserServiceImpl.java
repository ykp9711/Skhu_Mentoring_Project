package com.skhuMentoring.service;

import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.dto.User;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private MentoringBoardMapper mentoringBoardMapper;
    @Autowired
    private UserMapper userMapper;

    public User login(Map<String, String> map) throws Exception {
        return mentoringBoardMapper.login(map);
    }

    @Override
    public List<String> findId(String userEmail) throws Exception {
        return userMapper.findId(userEmail);
    }

}
