package com.SkhuMentoring.mapper;

import com.SkhuMentoring.dto.Mentee;
import com.SkhuMentoring.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {
    public int login(User user);
}
