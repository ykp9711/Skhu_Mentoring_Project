package com.SkhuMentoring.mapper;

import com.SkhuMentoring.dto.Mentee;
import com.SkhuMentoring.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {
    public int login(User user); // 로그인

    public String getId(String userId); // 로그인 Id 값 가져오기

    int checkId(String userId); //아이디 중복 체크

    void addUser(User user);

}

