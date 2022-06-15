package com.skhuMentoring.controller;
import com.skhuMentoring.dto.Criteria;
import com.skhuMentoring.dto.Mentee;
import com.skhuMentoring.dto.PageDTO;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.MailService;
import com.skhuMentoring.service.MentoringBoardService;
import com.skhuMentoring.service.UserService;
import lombok.extern.log4j.Log4j2;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/status/*")
public class StatusController {
    private final MyPageMapper myPageMapper;
    private final MailService mailService;
    private final MentoringBoardService  mentoringBoardService;
    private final UserMapper userService;

    @GetMapping("/menteeStatus") //멘티 목록
    public String menteeStatus(Model model, Criteria cri) {
        model.addAttribute("list", mentoringBoardService.getMenteeList(cri));
        model.addAttribute("pageMaker" , new PageDTO(cri, mentoringBoardService.getMenteeTotal(cri))); // 페이지 목록
        return "status/menteeStatus";
    }

    @GetMapping("/mentorStatus") // 멘토 목록
    public String mentorStatus(Model model, Criteria cri) {
        model.addAttribute("list", mentoringBoardService.getList(cri)); // 게시글 10개씩 끊기
        model.addAttribute("pageMaker" , new PageDTO(cri, mentoringBoardService.getMentorTotal(cri))); // 페이지 목록
        return "status/mentorStatus";
    }

    @GetMapping("/deleteMentorBoard") // 멘토 게시글 삭제
    public String deleteMentorBoard(Long bno) {
        mentoringBoardService.deleteMentorBoard(bno);
        return "redirect:/status/mentorStatus";
    }

    @GetMapping("/endMentorBoard") // 멘토 게시글 모집 종료
    @Transactional
    public String endMentorBoard(Long bno ,HttpServletResponse resp) throws Exception {
        if(mentoringBoardService.getPersonnel(bno) == 0){
            resp.setContentType("text/html; charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('해당 멘토링 정원이 0명일 경우에는 모집종료가 불가능합니다.')");
            out.println("location.href='/status/mentorStatus'");
            out.println("</script>");
            out.close();
            return null;
        }else {
            mentoringBoardService.endMentorBoard(bno); // recruiting 진행중으로 변경
            mentoringBoardService.endApplicationMentor(bno); // 멘토링 모집 종료시 tbl_applicationMentor 테이블의 accept를 진행중으로 변경 하고 startDate 값 입력
            return "redirect:/myPage/myPage?bno=" + bno;
        }
    }

    @GetMapping("/deleteMenteeBoard") // 멘티 게시글 삭제
    public String deleteMenteeBoard(Long bno) {
        mentoringBoardService.deleteMenteeBoard(bno);
        return "redirect:/status/menteeStatus";
    }

    @GetMapping("/detailMentor") // 멘토 게시글 상세보기
    public String detailMentor(Model model, Long bno, String mentorId) {
        model.addAttribute("mentorId", mentorId);
        model.addAttribute("detailMentor", mentoringBoardService.getDetailMentor(bno));
        model.addAttribute("user", userService.getUser(mentoringBoardService.getDetailMentor(bno).getUserId()));// 해당 게시글 userId로 유저 정보 가져옴
        model.addAttribute("mentorMentoringCount", myPageMapper.getMentorCount(mentorId)); // 멘토가 현재까지 진행한 멘토링 횟수
        model.addAttribute("getMentoringCount", myPageMapper.getMentoringCount(mentorId)); // 해당 멘토의 현재까지 가르킨 멘티 수
        return "status/detailMentor";
    }

    @GetMapping("/detailMentee") // 멘티 게시글 상세보기 (마이페이지 , 멘토목록에서 멘티 상세보기)
    public String detailMentee(Model model, Long bno, Mentee mentee, String menteeId) {
        model.addAttribute("detailMentee", myPageMapper.getDetailMentee(bno, menteeId));
        model.addAttribute("menteeMentoringCount", myPageMapper.getMenteeCount(menteeId)); // 멘티가 현재까지 들은 멘토링 횟수
        model.addAttribute("user", userService.getUser(menteeId));
        return "status/detailMentee";

    }

    @GetMapping("/detailMentee2") // 멘티 게시글  상세보기 ( 멘티 목록 / 멘티 상세보기)
    public String detailMentee2(Model model, Long bno, Mentee mentee, String menteeId) {
        model.addAttribute("detailMentee", myPageMapper.getDetailMentee(bno, menteeId));
        model.addAttribute("menteeMentoringCount", myPageMapper.getMenteeCount(menteeId)); // 멘티가 현재까지 들은 멘토링 횟수
        model.addAttribute("detailMentee", mentoringBoardService.getDetailMentee(bno));
        model.addAttribute("user", userService.getUser(mentoringBoardService.getDetailMentee(bno).getUserId()));
        return "status/detailMentee";

    }
    @PostMapping("/application") // 멘토 게시글 목록에서 신청
    public String applicationMentor(Mentee mentee, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws Exception {
        mentee.setMenteeId((String) session.getAttribute("sessionId"));
        mentoringBoardService.applicationMentor(mentee);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토링 신청이 완료되었습니다.')");
        out.println("location.href='/status/mentorStatus'");
        out.println("</script>");
        out.close();
        return null;
    }

    @PostMapping("/checkApplicationStatus")
    @ResponseBody
    public String checkApplicationStatus(Long bno, String menteeId){
        int result = mentoringBoardService.checkApplicationStatus(bno, menteeId);
        if(result == 1){ // 1이라는건 이미 신청이 되어있다는 것
            return "fail";
        }else
            return "success";
    }

    @GetMapping("/menteeAccept") // 멘티가 보낸 요청 수락
    @Transactional
    public String menteeAceept(Long bno, String menteeId){
        Long personnel = mentoringBoardService.getPersonnel(bno);
        Long maxPersonnel = mentoringBoardService.getMaxPersonnel(bno);
        Long addPersonnel = personnel + 1;

        if (personnel < maxPersonnel && addPersonnel < maxPersonnel) {
            mentoringBoardService.menteeAccept(bno);
            mentoringBoardService.menteeAcceptStatus(bno, menteeId);
            return "redirect:/myPage/myPage"; // 멘토 수락 후 종료를 눌러야 마이페이지->멘토현황에 나온다

        }  else if(personnel < maxPersonnel && addPersonnel == maxPersonnel) {
            mentoringBoardService.menteeAccept(bno);
            mentoringBoardService.menteeAcceptStatus(bno, menteeId);
            mentoringBoardService.mentorBoardUpdate(bno);   // 모집현황에 대한 flag 업데이트 ( 모집중->진행중)
            return "redirect:/myPage/myPage";
        }
        else {
            return "redirect:/myPage/myPage";

        }
    }

    @GetMapping("/detailMentees") // 멘토목록에서 신청한 멘티 목록 보여줌
    public String detailMentees(Long bno,Model model) {
            model.addAttribute("detailMentees" , mentoringBoardService.getDetailMentees(bno));

        return "/status/detailMentees";
    }
}
