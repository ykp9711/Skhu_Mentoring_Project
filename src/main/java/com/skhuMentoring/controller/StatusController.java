package com.skhuMentoring.controller;
import com.skhuMentoring.dto.Mentee;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.MailService;
import lombok.extern.log4j.Log4j2;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/status/*")
public class StatusController {
    private final MentoringBoardMapper mentoringBoardMapper;
    private final MyPageMapper myPageMapper;
    private final UserMapper userMapper;
    private final MailService mailService;

    @GetMapping("/menteeStatus")
    public String menteeStatus(Model model) {
        model.addAttribute("list", myPageMapper.getMenteeStatus());
        return "status/menteeStatus";
    }

    @GetMapping("/mentorStatus")
    public String mentorStatus(Model model) {
        model.addAttribute("list", myPageMapper.getMentorStatus());
        return "status/mentorStatus";
    }


    @GetMapping("/deleteMentorBoard") // 멘토 게시글 삭제
    public String deleteMentorBoard(Long bno) {
        mentoringBoardMapper.deleteMentorBoard(bno);
        return "redirect:status/mentorStatus";
    }

    @GetMapping("/deleteMenteeBoard") // 멘티 게시글 삭제
    public String deleteMenteeBoard(Long bno) {
        mentoringBoardMapper.deleteMenteeBoard(bno);
        return "redirect:status/menteeStatus";
    }

    @GetMapping("/detailMentor") // 멘토 게시글 목록 상세보기
    public String detailMentor(Model model, Long bno) {

        model.addAttribute("detailMentor", mentoringBoardMapper.getDetailMentor(bno));
        model.addAttribute("user", userMapper.getUser(mentoringBoardMapper.getDetailMentor(bno).getUserId()));// 해당 게시글 userId로 유저 정보 가져옴
        return "status/detailMentor";
    }

    @GetMapping("/detailMentee") // 멘티 게시글 목록 상세보기
    public String detailMentee(Model model, Long bno, Mentee mentee) {
        mentee = myPageMapper.getDetailMentee(bno);
        model.addAttribute("detailMentee", mentee);

        return "status/detailMentee";

    }

    @PostMapping("/appilcation") // 멘토 게시글 목록에서 신청
    public String applicationMentor(Mentee mentee, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws Exception {
        mentee.setMenteeId((String) session.getAttribute("sessionId"));
        mentoringBoardMapper.applicationMentor(mentee);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토링 신청이 완료되었습니다.')");
        out.println("location.href='/status/mentorStatus'");
        out.println("</script>");
        out.close();
        return null;
    }
}
