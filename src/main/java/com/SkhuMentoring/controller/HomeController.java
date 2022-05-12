package com.SkhuMentoring.controller;


import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.SkhuMentoring.service.UserService;

import com.SkhuMentoring.dto.*;
import com.SkhuMentoring.mapper.MentoringBoardMapper;
import com.SkhuMentoring.mapper.MyPageMapper;
import com.SkhuMentoring.mapper.UserMapper;

import com.SkhuMentoring.serivce.MailService;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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

    @GetMapping("/menteeStatus")
    public String menteeStatus(Model model) {
        model.addAttribute("list", myPageMapper.getMenteeStatus());
        return "menteeStatus";
    }

    @GetMapping("/mentorStatus")
    public String mentorStatus(Model model) {
        model.addAttribute("list", myPageMapper.getMentorStatus());
        return "mentorStatus";
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



    @GetMapping("/mentorRegister") // 멘토 게시글 등록페이지로 이동
    public String MentoRegister(Department department, Subject subject, Model model, @ModelAttribute Mentor mentor, HttpSession session, Long bno)  {
        model.addAttribute("list",mentoringBoardMapper.getDetailMentee(bno)); // 멘토목록에서 신청시 해당 게시글 정보 넘겨줌
        log.info(mentoringBoardMapper.getDetailMentee(bno));
        model.addAttribute("departments" , mentoringBoardMapper.getDepartment()); //학부 리스트
        model.addAttribute("subject", mentoringBoardMapper.getSubject()); // 과목 리스트
        model.addAttribute("user", userMapper.getUser((String)session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        model.addAttribute("menteeStudentNum",mentor.getMenteeStudentNum());
        /*mentoringBoardMapper.setUpMentoring(menteeStudentNum);*/
        return  "mentorRegister";
    }

    @GetMapping("/menteeRegister")
    public String MenteeRegister(@ModelAttribute Mentee mentee, Model model, Department department, HttpSession session,Long bno){
        model.addAttribute("list",mentoringBoardMapper.getDetailMentor(bno)); // 멘토목록에서 신청시 해당 게시글 정보 넘겨줌
        log.info(mentoringBoardMapper.getDetailMentor(bno));
        model.addAttribute("departments", mentoringBoardMapper.getDepartment());
        model.addAttribute("subject" , mentoringBoardMapper.getSubject());
        model.addAttribute("user", userMapper.getUser((String)session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        return "menteeRegister";
    }

    @Transactional // 멘토 게시글 등록
    @PostMapping("/mentorRegister")
    public String MentoRegister(@ModelAttribute Mentor mentor, @ModelAttribute Department department,HttpSession session){
        if(mentor.getSubjectName()=="기타" || mentor.getSubjectName().equals("기타")){
            mentor.setSubjectName(mentor.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentor.getSubjectName());
            mentoringBoardMapper.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록
        }
        mentor.setUserId((String)session.getAttribute("sessionId"));
        mentoringBoardMapper.insertMentorBoard(mentor);
        return "redirect:/mentorStatus";
    }


    @Transactional
    @PostMapping("/menteeRegister") // 멘티 게시글 등록
    public String MenteeRegister(@ModelAttribute Mentee mentee, HttpSession session){
        if(mentee.getSubjectName()=="기타" || mentee.getSubjectName().equals("기타")){
            mentee.setSubjectName(mentee.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentee.getSubjectName());
            mentoringBoardMapper.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록된다
        }
        mentee.setUserId((String) session.getAttribute("sessionId"));
        mentoringBoardMapper.insertMenteeBoard(mentee);
        return "redirect:/menteeStatus";
    }

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
    //마이페이지로 이동
    @GetMapping("/myPage")
    public String myPageGo(@ModelAttribute Mentor mentor, Model model,HttpSession session, Mentee mentee){
        model.addAttribute("user", userMapper.getUser((String)session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        log.info(session.getAttribute("sessionId"));
        String userId = (String) session.getAttribute("sessionId");
        model.addAttribute("list",myPageMapper.getMentorMyStatus(userMapper.getId(userId))); // 멘토정보 불러오기
        model.addAttribute("list2",myPageMapper.getMenteeMyStatus(userMapper.getId(userId))); //멘티정보 불러오기
        model.addAttribute("applicationMentor", myPageMapper.getApplicationMentor(userId)); // 멘토에게 보낸 신청
        model.addAttribute("requestMentee", myPageMapper.getRequestMentee(userId)); // 멘토에게 보낸 신청
        return "myPage";
    }

    // 마이페이지 > 멘토 현황 > 상세보기

    @GetMapping("/detailMentoring")
    public String detailMentoring(Model model){
        model.addAttribute("list2",myPageMapper.getMenteeStatus());
        return "detailMentoring";
    }
    // 마이페이지 > 멘티에게 받은 요청 > 거절하기
    @GetMapping("/requestRefusal")
    public String requestRefusal(Long bno,Model model, HttpServletRequest req, HttpServletResponse resp){
        log.info(bno);
        myPageMapper.requestRefusal(bno);
        String referer = req.getHeader("Referer");
        return "redirect:"+ referer;
    }
    // 마이페이지 > 멘티에게 받은 요청 > 수락
    @GetMapping("/requestAccept")
    public String requestAccept(Long bno, Model model, HttpServletRequest req, HttpServletResponse resp, Mentee mentee) {

        log.info(bno);
        if(myPageMapper.requestAccept(bno)){
            myPageMapper.requestAcceptData(mentee);
            String referer = req.getHeader("Referer");
            return "redirect:"+ referer;
        }else return null;
    }
    // 마이페이지 > 멘티 상세보기
    /*@GetMapping("/whoIsMentee")
    public String whoIsMentee()*/



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


    @GetMapping("/deleteMentorBoard") // 멘토 게시글 삭제
    public String deleteMentorBoard(Long bno){
        mentoringBoardMapper.deleteMentorBoard(bno);
        return "redirect:/mentorStatus";
    }

    @GetMapping("/deleteMenteeBoard") // 멘티 게시글 삭제
    public String deleteMenteeBoard(Long bno){
        mentoringBoardMapper.deleteMenteeBoard(bno);
        return "redirect:/menteeStatus";
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
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html;charset=utf-8");
        out.println("<script>");
        out.println("alert('신청이 완료되었습니다.')");
        out.println("</script>");
        out.close();
        return "/";
    }
}

//한 명의 멘토에게 신청을 하면 중복 신청이 안 되도록 막아준다.
//이메일 인증 할 떄 학생인증을 하기 위해서 office.skhu.ac.kr 고정으로 박아준다
// 상세보기