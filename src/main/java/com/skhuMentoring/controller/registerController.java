package com.skhuMentoring.controller;

import com.skhuMentoring.dto.Department;
import com.skhuMentoring.dto.Mentee;
import com.skhuMentoring.dto.Mentor;
import com.skhuMentoring.dto.Subject;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/register")
public class registerController {
    private final MentoringBoardMapper mentoringBoardMapper;
    private final MyPageMapper myPageMapper;
    private final UserMapper userMapper;

    @GetMapping("/mentorRegister") // 멘토 게시글 등록페이지로 이동
    public String MentoRegister(Department department, Subject subject, Model model, @ModelAttribute Mentor mentor, HttpSession session, Long bno)  {
        model.addAttribute("list",mentoringBoardMapper.getDetailMentee(bno)); // 멘토목록에서 신청시 해당 게시글 정보 넘겨줌
        log.info(mentoringBoardMapper.getDetailMentee(bno));
        model.addAttribute("departments" , mentoringBoardMapper.getDepartment()); //학부 리스트
        model.addAttribute("subject", mentoringBoardMapper.getSubject()); // 과목 리스트
        model.addAttribute("user", userMapper.getUser((String)session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        model.addAttribute("menteeStudentNum",mentor.getMenteeStudentNum());
        /*mentoringBoardMapper.setUpMentoring(menteeStudentNum);*/
        return  "/register/mentorRegister";
    }

    @GetMapping("/menteeRegister")
    public String MenteeRegister(@ModelAttribute Mentee mentee, Model model, Department department, HttpSession session, Long bno){
        model.addAttribute("list",mentoringBoardMapper.getDetailMentor(bno)); // 멘토목록에서 신청시 해당 게시글 정보 넘겨줌
        log.info(mentoringBoardMapper.getDetailMentor(bno));
        model.addAttribute("departments", mentoringBoardMapper.getDepartment());
        model.addAttribute("subject" , mentoringBoardMapper.getSubject());
        model.addAttribute("user", userMapper.getUser((String)session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        return "/register/menteeRegister";
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
        return "redirect:/status/mentorStatus";
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
        return "redirect:/status/menteeStatus";
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
