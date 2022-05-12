package com.skhuMentoring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.dto.User;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private MentoringBoardMapper mentoringBoardMapper;

    public User login(Map<String, String> map) throws Exception {
        return mentoringBoardMapper.login(map);
    }


}
