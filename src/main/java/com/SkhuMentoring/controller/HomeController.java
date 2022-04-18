package com.SkhuMentoring.controller;

import com.SkhuMentoring.dto.Department;
import com.SkhuMentoring.dto.Mentee;
import com.SkhuMentoring.dto.Mentor;
import com.SkhuMentoring.dto.Subject;
import com.SkhuMentoring.mapper.MentoringBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/")
public class HomeController {

    private final MentoringBoardMapper mentoringBoardMapper;

    @GetMapping("/")
    public String main() {
        return "index";
    }

    @GetMapping("/menteeStatus")
    public String menteeStatus() {return  "menteeStatus";}

    @GetMapping("/mentorStatus")
    public String mentorStatus() {return  "mentorStatus";}

    @GetMapping("/myPage")
    public String myPage() {return  "myPage";}

    @GetMapping("/login")
    public String login() {return  "login";}

    @GetMapping("/myInfo")
    public String myInfo() {return  "myInfo";}

    @GetMapping("/findPwId")
    public String findPwId() {return  "findPwId";}

    @GetMapping("/signUp")
    public String signup() {return  "signup";}

    @GetMapping("/ranking")
    public String ranking() {return  "ranking";}

    @GetMapping("/mentoRegister") // 멘토 게시글 등록페이지로 이동
    public String MentoRegister(Department department, Subject subject, Model model, @ModelAttribute Mentor mentor) {
        model.addAttribute("departments" , mentoringBoardMapper.getDepartment());
        model.addAttribute("subject", mentoringBoardMapper.getSubject());
        return  "mentoRegister";
    }

    @Transactional // 멘토 게시글 등록
    @PostMapping("/mentoRegister")
    public String MentoRegister(@ModelAttribute Mentor mentor, @ModelAttribute Department department){
        if(mentor.getSubjectName()=="기타" || mentor.getSubjectName().equals("기타")){
            mentor.setSubjectName(mentor.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentor.getSubjectName());
            mentoringBoardMapper.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록
        }
        mentoringBoardMapper.insertMentorBoard(mentor);
        return null;
    }

    @GetMapping("/menteeRegister")
    public String MenteeRegister(@ModelAttribute Mentee mentee, Model model, Department department){
        model.addAttribute("departments", mentoringBoardMapper.getDepartment());
        model.addAttribute("subject" , mentoringBoardMapper.getSubject());
        return "menteeRegister";
    }

    @PostMapping("/menteeRegister") // 멘티 게시글 등록
    public String MenteeRegister(@ModelAttribute Mentee mentee ){
        if(mentee.getSubjectName()=="기타" || mentee.getSubjectName().equals("기타")){
            mentee.setSubjectName(mentee.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentee.getSubjectName());
            mentoringBoardMapper.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록된다
        }
        mentoringBoardMapper.insertMenteeBoard(mentee);
        return "menteeRegister";
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


}
