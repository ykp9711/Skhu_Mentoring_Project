package com.SkhuMentoring.mapper;

import com.SkhuMentoring.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
//    User getUser();

    int checkId(String userId); //아이디 중복 체크

    void signUp(User user);
}
