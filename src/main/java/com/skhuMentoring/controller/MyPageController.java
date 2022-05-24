package com.skhuMentoring.controller;

import com.skhuMentoring.dto.User;
import com.skhuMentoring.dto.Mentee;
import com.skhuMentoring.dto.Mentor;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.MailService;
import lombok.extern.log4j.Log4j2;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/myPage/*")
public class MyPageController {
    private final MentoringBoardMapper mentoringBoardMapper;
    private final MyPageMapper myPageMapper;
    private final UserMapper userMapper;
    private final MailService mailService;

    //마이페이지로 이동
    @GetMapping("/myPage")
    public String myPageGo(@ModelAttribute Mentor mentor, Model model, HttpSession session, Mentee mentee, Long bno) {
        model.addAttribute("user", userMapper.getUser((String) session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        String userId = (String) session.getAttribute("sessionId");
        model.addAttribute("list", myPageMapper.getMentorMyStatus(userMapper.getId(userId))); // 멘토정보 불러오기
        model.addAttribute("list2", myPageMapper.getMenteeMyStatus(userMapper.getId(userId))); //멘티정보 불러오기
        model.addAttribute("applicationMentor", myPageMapper.getApplicationMentor(userId)); // 멘토에게 보낸 신청
        model.addAttribute("requestMentee", myPageMapper.getRequestMentee(userId)); // 멘토에게 보낸 신청
        model.addAttribute("departments", mentoringBoardMapper.getDepartment());
        model.addAttribute("Mentoring", myPageMapper.getMyMentoring(userId));
        return "/myPage/myPage";
    }
    // 마이페이지 > 멘토 현황 > 상세보기

    @GetMapping("/detailMentoring")
    public String detailMentoring(Model model){
        model.addAttribute("list2",myPageMapper.getMenteeStatus());
        model.addAttribute("Mentoring",myPageMapper.getMentoring());
        return "/myPage/detailMentoring";
    }
    // 마이페이지 > 멘토 현황 > 멘토링 종료
    @GetMapping("/endMentoring")
    public String endMentoring(Long bno){
        myPageMapper.endMentoring(bno);
        return "redirect:/myPage/myPage";
    }
    // 마이페이지 > 멘티에게 받은 요청 > 거절하기
    @GetMapping("/requestRefusal")
    public String requestRefusal(Long bno, Model model, HttpServletRequest req, HttpServletResponse resp){
        log.info(bno);
        myPageMapper.requestRefusal(bno);
        String referer = req.getHeader("Referer");
        return "redirect:"+ referer;
    }
    // 마이페이지 > 멘토에게 보낸 요청 > 취소하기
    @GetMapping("/cancelApplication")
    public String cancelApplication(Long bno, HttpSession session){
        myPageMapper.cancelApplication(bno, (String)session.getAttribute("sessionId"));

        return "redirect:/myPage/myPage";
    }

    //마이페이지 > 내 정보 수정
    @PostMapping("/modifyUserInfo")
    public String modifyUserInfo(@ModelAttribute User user){
        myPageMapper.modifyUserInfo(user);
        log.info(user);
        return "redirect:/myPage/myPage";
    }


}
