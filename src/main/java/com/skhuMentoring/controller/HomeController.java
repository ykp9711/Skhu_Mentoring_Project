package com.skhuMentoring.controller;


import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.skhuMentoring.service.UserService;

import com.skhuMentoring.dto.*;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;

import com.skhuMentoring.serivce.MailService;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
        try {
            if (map.get("userId") == null || map.get("userPw") == null) {
                model.addAttribute("msg", "아이디 또는 비밀번호를 입력해주세요");
                return "login";
            }
            User user = userService.login(map);
            if (user != null) {
                session.setAttribute("user", user);
            } else {
                model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
                return "login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
            return "login";
        }
        session.setAttribute("sessionId", userMapper.getId(map.get("userId"))); // 세션값 등록
        model.addAttribute("sessionId", session.getAttribute("sessionId"));
        return "index";
    } // end of PostMapping("login")




    @GetMapping("/myInfo")
    public String myInfo() {return  "myInfo";}

    @GetMapping("/findPwId")
    public String findPwId() {return  "findPwId";}



    @GetMapping("/ranking")
    public String ranking() {return  "ranking";}







    //회원가입 페이지로 이동
    @GetMapping("/signUp")
    public String signUp(Model model, @ModelAttribute User user, @ModelAttribute Department department) {
        model.addAttribute("user", new User());
        model.addAttribute("departments" , mentoringBoardMapper.getDepartment());
        return  "signUp";
    }

    //회원가입 정보 등록
    @PostMapping("/signUp")
    public String singUp(Model model, @ModelAttribute User user){
        userMapper.addUser(user);
        return "login";
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


    @GetMapping("/test")
    public String test(){
        return "detailMentor";
    }

    @GetMapping("/detailMentor") // 멘토 게시글 목록 상세보기
    public String detailMentor(Model model, Long bno){

        model.addAttribute("detailMentor", mentoringBoardMapper.getDetailMentor(bno));
        model.addAttribute("user",  userMapper.getUser(mentoringBoardMapper.getDetailMentor(bno).getUserId()));// 해당 게시글 userId로 유저 정보 가져옴
        return "detailMentor";
    }

    @GetMapping("/detailMentee") // 멘티 게시글 목록 상세보기
    public String detailMentee(Model model, Long bno, Mentee mentee){
        mentee = myPageMapper.getDetailMentee(bno);
        model.addAttribute("detailMentee", mentee);

        return "detailMentee";

    }

    @PostMapping("/appilcation") // 멘토 게시글 목록에서 신청
    public String applicationMentor(Mentee mentee ,HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws Exception{
        mentee.setMenteeId((String)session.getAttribute("sessionId"));
        mentoringBoardMapper.applicationMentor(mentee);
        return "/index";
    }
}