package com.skhuMentoring.controller;

import com.skhuMentoring.dto.Department;
import com.skhuMentoring.dto.Mentee;
import com.skhuMentoring.dto.Mentor;
import com.skhuMentoring.dto.Subject;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.MentoringBoardService;
import com.skhuMentoring.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/register")
public class RegisterController {
    private final MentoringBoardMapper mentoringBoardMapper;
    private final UserMapper userService;
    private final MentoringBoardService mentoringService;


    @GetMapping("/mentorRegister") // 멘토 게시글 등록페이지로 이동
    public String MentorRegister(Department department, Subject subject, Model model, @ModelAttribute Mentor mentor, Mentee mentee, HttpSession session, Long bno) {
        model.addAttribute("list", mentoringService.getDetailMentee(bno)); // 멘토목록에서 신청시 해당 게시글 정보 넘겨줌
        model.addAttribute("departments", mentoringService.getDepartment()); //학부 리스트
        model.addAttribute("subject", mentoringService.getSubject()); // 과목 리스트
        model.addAttribute("user", userService.getUser((String) session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        model.addAttribute("menteeStudentNum", mentor.getMenteeStudentNum()); //멘티 학번 가져오기
        return "/register/mentorRegister";
    }

    @GetMapping("/menteeRegister")
    public String MenteeRegister(@ModelAttribute Mentee mentee, Model model, Department department, HttpSession session, Long bno) {
        model.addAttribute("list", mentoringService.getDetailMentor(bno)); // 멘토목록에서 신청시 해당 게시글 정보 넘겨줌
        model.addAttribute("departments", mentoringService.getDepartment());
        model.addAttribute("subject", mentoringService.getSubject());
        model.addAttribute("user", userService.getUser((String) session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        return "/register/menteeRegister";
    }

    @Transactional // 멘토 게시글 등록
    @PostMapping("/mentorRegister")
    public String MentorRegister(@ModelAttribute Mentor mentor, @ModelAttribute Department department, Long bno, HttpSession session, HttpServletResponse resp) throws  Exception {
        if (mentor.getSubjectName() == "기타" || mentor.getSubjectName().equals("기타")) {
            mentor.setSubjectName(mentor.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentor.getSubjectName());
            mentoringService.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록
        }

        List<String> menteeStudentNum = mentor.getMenteeStudentNum();

        mentor.setUserId((String) session.getAttribute("sessionId"));

        if(menteeStudentNum != null){  // 멘티 목록에서 개설할 경우
            mentoringService.insertMentorBoard(mentor);
            mentoringService.addPersonnel(mentor.getBno());

            Mentee mentee = mentoringService.getDetailMentee(bno);  // bno로 멘티 정보 가져오기
            mentee.setMenteeId(mentee.getUserId());
            mentoringService.deleteMenteeBoard(mentee.getBno());    // 등록된 멘티 게시글 멘티보드에서 삭제
            mentee.setBno(mentor.getBno());                             // 멘티 bno를 새로 등록된 멘토 bno로 변경한 뒤 applicationMentor DB에 멘티 등록
            mentoringService.applicationMentor(mentee);
            mentoringService.menteeAcceptStatus(mentee.getBno(), mentee.getMenteeId());


        } else{
            mentoringService.insertMentorBoard(mentor);
        }

        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토등록이 완료되었습니다.')");
        out.println("location.href='/status/mentorStatus'");
        out.println("</script>");
        out.close();

        return null;
    }

    @Transactional
    @PostMapping("/menteeRegister") // 멘티 게시글 등록
    public String MenteeRegister(@ModelAttribute Mentee mentee, HttpSession session, HttpServletResponse resp) throws Exception {
        if (mentee.getSubjectName() == "기타" || mentee.getSubjectName().equals("기타")) {
            mentee.setSubjectName(mentee.getAddSubject());
            Subject subject = new Subject();
            subject.setSubjectName(mentee.getSubjectName());
            mentoringService.insertSubject(subject); // 기타항목 선택 후 입력한 강의 DB에 등록된다
        }
        mentee.setUserId((String) session.getAttribute("sessionId"));
        mentoringBoardMapper.insertMenteeBoard(mentee);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘티등록이 완료되었습니다.')");
        out.println("location.href='/status/menteeStatus'");
        out.println("</script>");
        out.close();
        return null;
    }

    @GetMapping(value = "/checkSubject") // 멘토 , 멘티 게시글 등록 시 기타 항목 과목 기입 후 중복확인
    @ResponseBody
    public String userIdCheck(String subject) throws Exception {

        int result = mentoringBoardMapper.checkSubject(subject);
        if (result == 1) { // result로 받은 값이 1이라면 이미 등록된 과목으로 fail 리턴
            return "fail";
        } else { // result 값이 1이 아니라면 없는 아이디로 success 리턴
            return "success";
        }
    }
}
