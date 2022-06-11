package com.skhuMentoring.controller;

import com.skhuMentoring.dto.Mentoring;
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
import java.io.PrintWriter;


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
        model.addAttribute("applicationMentor", myPageMapper.getApplicationMentor(userId)); // 멘토에게 보낸 신청
        model.addAttribute("requestMentee", myPageMapper.getRequestMentee(userId)); // 멘토에게 보낸 신청
        model.addAttribute("departments", mentoringBoardMapper.getDepartment());
        model.addAttribute("Mentoring", myPageMapper.getMyMentoring(userId)); // (마이페이지 -> 멘토현황)
        model.addAttribute("myMenteeStatus", myPageMapper.getMyMenteeStatus(userId)); // 마이페이지 - > 멘티현황
        return "/myPage/myPage";
    }
    // 마이페이지 > 멘토 현황 > 상세보기

    @GetMapping("/detailMentoring")
    public String detailMentoring(Model model){
        model.addAttribute("list2",myPageMapper.getMenteeStatus());
        model.addAttribute("Mentoring",myPageMapper.getMentoring());
        return "/myPage/detailMentoring";
    }

    // 마이페이지 > 멘티에게 받은 요청 > 거절하기
    @GetMapping("/applicationRefusal") // 거절 사유 작성 창
    public String requestRefusal(Long bno, String menteeId, Model model){
        model.addAttribute("bno",bno);
        model.addAttribute("menteeId", menteeId);
        return "/myPage/applicationRefusal";
    }
    @GetMapping("/showRefusalReason") // 거절 사유 작성 창
    public String showRefusalReason(Long bno, String menteeId, Model model){
        model.addAttribute("refusalReason", myPageMapper.showRefusalReason(bno,menteeId));
        return "/myPage/showRefusalReason";
    }

    @PostMapping("/applicationRefusal") // 거절 사유 작성
    public String requestRefusal(Long bno,String menteeId ,String refusalReason, HttpServletResponse resp) throws Exception{
        myPageMapper.refusalReason(bno, menteeId, refusalReason);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('거절되었습니다.')");
        out.println("window.close()");
        out.println("</script>");
        out.close();
        return null;
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
    @GetMapping("/menteeRate") // 신청한 멘티 목록
    public String detailMentees(Long bno,Model model) {
        model.addAttribute("getMentee" , myPageMapper.getMentee(bno));
        model.addAttribute("bno",bno);
        return "/myPage/menteeRate";
    }

    @PostMapping("/updateRating") // 멘티 평점 추가
    public String updateRating(Mentoring mentoring, HttpServletResponse resp) throws Exception{
        log.info(mentoring);
        myPageMapper.updateRating(mentoring);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토링 종료.')");
        out.println("window.close()");
        out.println("</script>");
        out.close();
        return null;
    }
    // 마이페이지 > 멘토 현황 > 멘토링 종료
    @GetMapping("/endMentoring")
    public String endMentoring(Long bno){
        myPageMapper.endMentoring(bno);
        return "redirect:/myPage/myPage";
    }
}
