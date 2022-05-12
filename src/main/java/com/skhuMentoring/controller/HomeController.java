package com.skhuMentoring.controller;


import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.skhuMentoring.service.UserService;

import com.skhuMentoring.dto.*;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;

import com.skhuMentoring.service.MailService;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/")
public class HomeController {

    private final MentoringBoardMapper mentoringBoardMapper;
    private final MyPageMapper myPageMapper;
    private final UserMapper userMapper;
    private final MailService mailService;


    @GetMapping("/")
    public String main() {
        return "index";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
        try {
            if (map.get("userId") == null || map.get("userPw") == null) {
                model.addAttribute("msg", "아이디 또는 비밀번호를 입력해주세요");
                return "user/login";
            }
            User user = userService.login(map);
            if (user != null) {
                session.setAttribute("user", user);
            } else {
                model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
                return "user/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
            return "user/login";
        }
        session.setAttribute("sessionId", userMapper.getId(map.get("userId"))); // 세션값 등록
        model.addAttribute("sessionId", session.getAttribute("sessionId"));
        return "index";
    } // end of PostMapping("login")


    @GetMapping("/findPwId")
    public String findPwId() {return  "user/findPwId";}



    @GetMapping("/ranking")
    public String ranking() {return  "ranking";}



    @GetMapping(value = "/checkSubject") // 멘토 , 멘티 게시글 등록 시 기타 항목 과목 기입 후 중복확인
    @ResponseBody
    public String userIdCheck(String subject) throws Exception {

        int result = mentoringBoardMapper.checkSubject(subject);
        if (result == 1) { // result로 받은 값이 1이라면 이미 등록된 과목으로 fail 리턴
            return "fail";
        }
        else { // result 값이 1이 아니라면 없는 아이디로 success 리턴
            return "success";  }
    }



    //회원가입 페이지로 이동
    @GetMapping("/signUp")
    public String signUp(Model model, @ModelAttribute User user, @ModelAttribute Department department) {
        model.addAttribute("user", new User());
        model.addAttribute("departments" , mentoringBoardMapper.getDepartment());
        return  "user/signUp";
    }

    //회원가입 정보 등록
    @PostMapping("/signUp")
    public String singUp(Model model, @ModelAttribute User user){
        userMapper.addUser(user);
        return "user/login";
    }

    // 회원가입 id 중복확인
    @GetMapping("/checkId")
    @ResponseBody
    public String checkId(@RequestParam String id){
        log.info("들어옴");
        int result = userMapper.checkId(id);
        if (result == 0) {
            return "success";
        }
        else {
            return "fail";
        }
    }

    //회원가입 이메일 인증
    @GetMapping("/sendMail")
    @ResponseBody
    public String checkAuth(@RequestParam String email){

        String auth = mailService.sendMail(email+"@naver.com"); // office.skhu.ac.kr로 바꿔서 학생인증메일로만 회원가입 가능하게 만든다.

        return auth;
    }

}