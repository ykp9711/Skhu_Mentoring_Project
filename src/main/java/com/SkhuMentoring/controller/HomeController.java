package com.SkhuMentoring.controller;

import com.SkhuMentoring.dto.*;
import com.SkhuMentoring.mapper.MentoringBoardMapper;
import com.SkhuMentoring.mapper.MyPageMapper;
import com.SkhuMentoring.mapper.UserMapper;
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
    @GetMapping("/")
    public String main() {
        return "index";
    }

    @PostMapping("/login")
    public String login2(User user, HttpSession session, Model model) {
        log.info(user);
        if(userMapper.login(user)==1){
            session.setAttribute("sessionId",userMapper.getId(user.getUserId()));
            model.addAttribute("sessionId", session.getAttribute("sessionId"));
            return "index";
        }
        else return "login";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/menteeStatus")
    public String menteeStatus(Model model) {
        model.addAttribute("list",myPageMapper.getMenteeStatus());
        return  "menteeStatus";
    }

    @GetMapping("/mentorStatus")
    public String mentorStatus(Model model) {
        model.addAttribute("list" ,myPageMapper.getMentorStatus());
        return  "mentorStatus";
    }


    @GetMapping("/login")
    public String login() {return  "login";}

    @GetMapping("/myInfo")
    public String myInfo() {return  "myInfo";}

    @GetMapping("/findPwId")
    public String findPwId() {return  "findPwId";}

    @GetMapping("/signUp")
    public String signup() {return  "signUp";}

    @GetMapping("/ranking")
    public String ranking() {return  "ranking";}

    @GetMapping("/mentorRegister") // 멘토 게시글 등록페이지로 이동
    public String MentoRegister(Department department, Subject subject, Model model, @ModelAttribute Mentor mentor) {
        model.addAttribute("departments" , mentoringBoardMapper.getDepartment());
        model.addAttribute("subject", mentoringBoardMapper.getSubject());
        return  "mentorRegister";
    }

    @Transactional // 멘토 게시글 등록
    @PostMapping("/mentorRegister")
    public String MentoRegister(@ModelAttribute Mentor mentor, @ModelAttribute Department department){
        if(mentor.getSubjectName()=="기타" || mentor.getSubjectName().equals("기타")){
            mentor.setSubjectName(mentor.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentor.getSubjectName());
            mentoringBoardMapper.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록
        }
        mentoringBoardMapper.insertMentorBoard(mentor);
        return "redirect:/mentorStatus";
    }

    @GetMapping("/menteeRegister")
    public String MenteeRegister(@ModelAttribute Mentee mentee, Model model, Department department){
        model.addAttribute("departments", mentoringBoardMapper.getDepartment());
        model.addAttribute("subject" , mentoringBoardMapper.getSubject());
        return "menteeRegister";
    }
    @Transactional
    @PostMapping("/menteeRegister") // 멘티 게시글 등록
    public String MenteeRegister(@ModelAttribute Mentee mentee, HttpSession session ){
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
    public String myPageGo(@ModelAttribute Mentor mentor, Model model){
        model.addAttribute("list",myPageMapper.getMentorStatus());
        model.addAttribute("list2",myPageMapper.getMenteeStatus());
        return "myPage";
    }
    //마이페이지 > 멘토 현황 > 멘토링 종료
    @GetMapping("/endMentoring")
    public String endMentoring(@RequestParam("subjectName") String subjectName,Model model, HttpServletRequest req, HttpServletResponse resp){
        log.info(subjectName);
        myPageMapper.endMentoring(subjectName);
        String referer = req.getHeader("Referer");
        return "redirect:"+ referer;
    }
    // 마이페이지 > 멘토 현황 > 상세보기
    @GetMapping("/detailMentoring")
    public String detailMentee(Model model){
        model.addAttribute("list2",myPageMapper.getMenteeStatus());
        return "detailMentoring";
    }
    // 마이페이지 > 멘티에게 받은 요청 > 거절하기
    @GetMapping("/requestRefusal")
    public String requestRefusal(@RequestParam("userStudentNum") String userStudentNum,Model model, HttpServletRequest req, HttpServletResponse resp){
        log.info(userStudentNum);
        myPageMapper.requestRefusal(userStudentNum);
        String referer = req.getHeader("Referer");
        return "redirect:"+ referer;
    }
    // 마이페이지 > 멘티에게 받은 요청 > 수락
    @GetMapping("/requestAccept")
    public String requestAccept(@RequestParam("userStudentNum") String userStudentNum, Model model, HttpServletRequest req, HttpServletResponse resp) {
        log.info(userStudentNum);
        if(myPageMapper.requestAccept(userStudentNum)){
            myPageMapper.requestAcceptData(userStudentNum);
            String referer = req.getHeader("Referer");
            return "redirect:"+ referer;
        }else return null;
    }
    // 마이페이지 > 멘티 상세보기
    /*@GetMapping("/whoIsMentee")
    public String whoIsMentee()*/
}
