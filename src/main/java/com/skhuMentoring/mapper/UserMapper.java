package com.skhuMentoring.mapper;

import com.skhuMentoring.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    public int login(User user); // 로그인

    public String getId(String userId); // 로그인 Id 값 가져오기

    int checkId(String userId); //아이디 중복 체크

    void addUser(User user);
    
    User getUser(String userId); // userId로 해당 유저 정보 모두 가져오기

    public List<String> findId(@Param("userEmail") String userEmail); // 이메일 존재여부 체크로 아이디 값 가져오기

}

