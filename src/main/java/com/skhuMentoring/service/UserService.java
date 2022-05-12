package com.skhuMentoring.service;

import java.util.Map;

import com.skhuMentoring.dto.User;


public interface UserService {

   public User login(Map<String, String > map) throws Exception;

}
