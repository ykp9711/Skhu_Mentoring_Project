package com.skhuMentoring.service;

import java.util.Map;
import java.util.List;

import com.skhuMentoring.dto.User;


public interface UserService {

   public User login(Map<String, String > map) throws Exception;
   public List<String> findId(String userEmail) throws Exception;
   public void deleteUser(String userId) throws Exception; // 회원탈퇴

}
