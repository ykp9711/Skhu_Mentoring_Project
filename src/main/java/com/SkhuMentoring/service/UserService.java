package com.SkhuMentoring.service;

import java.util.Map;

import com.SkhuMentoring.dto.User;


public interface UserService {

   public User login(Map<String, String > map) throws Exception;

}