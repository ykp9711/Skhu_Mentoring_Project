package com.skhuMentoring.controller;

import com.skhuMentoring.dto.*;
import com.skhuMentoring.mapper.MentoringBoardMapper;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.MailService;
import com.skhuMentoring.service.UserService;
import lombok.extern.log4j.Log4j2;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/myPage/*")
public class MyPageController {
    private final MentoringBoardMapper mentoringBoardMapper;
    private final MyPageMapper myPageMapper;
    private final UserMapper userMapper;
    private final MailService mailService;

    @Autowired
    private UserService userService;
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
    @GetMapping("/menteeRate") // 멘티평가하기
    public String detailMentees(Long bno,Model model) {
        List<Mentoring> list = myPageMapper.getMenteeList(bno);
        // 해당 게시글 모든 멘티의 checkRating를 확인 후 0(평점을 메기지 않은 멘티)가 존재한다면 noRating을 menteeRate.jsp로 전달한다
        for(int i =0; i<list.size(); i++){
            if(list.get(i).getCheckRating()==0){
                model.addAttribute("noRating", "noRating");
            }
        }
        model.addAttribute("mentee" , myPageMapper.getMenteeList(bno));
        model.addAttribute("bno",bno);
        return "/myPage/menteeRate";
    }

    @GetMapping("/menteeRateGo") // 각 멘티 평점주기
    public String menteeRateGo(Long bno, String menteeId,String userName, Model model) {
        model.addAttribute("bno" , bno);
        model.addAttribute("menteeId", menteeId);
        model.addAttribute("userName", userName);
        return "/myPage/menteeRateGo";
    }


    @GetMapping("/mentorRate") //
    public String detailMentors(Long bno,Model model) {
        List<Mentoring> list = myPageMapper.getMentorList(bno);
        model.addAttribute("mentor" , myPageMapper.getMentorList(bno));
        model.addAttribute("bno",bno);
        return "/myPage/mentorRate";
    }

    @GetMapping("/mentorRateGo") // 각 멘티 평점주기
    public String mentorRateGo(Long bno,String userName,String userStudentNum, Model model) {
        model.addAttribute("userStudentNum", userStudentNum);
        model.addAttribute("bno" , bno);
        model.addAttribute("userName", userName);
        return "/myPage/mentorRateGo";
    }


    @PostMapping("/updateRating") // 멘티 평가 완료 tbl_user테이블에 점수가 합산되고, tbl_applicationMentor테이블의 checkRating 값을 1로 변경(평가여부 확인 1 ok / 0 no)
    @Transactional
    public String updateRating(Rating rating, HttpServletResponse resp) throws Exception{
        rating.setSumRating(rating.getRating()+ rating.getRating2()+ rating.getRating3());
        myPageMapper.updateRating(rating);
        myPageMapper.ratingOk(rating);
        log.info("여기" + rating.getBno());
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('평가가 완료되었습니다.')");
        out.println("location.replace('/myPage/menteeRate?bno="+rating.getBno()+"')");
        out.println("</script>");
        out.close();
        return null;
    }

    @PostMapping("/updateRatingMentor") // 멘티 평가 완료 tbl_user테이블에 점수가 합산되고, tbl_applicationMentor테이블의 checkRating 값을 1로 변경(평가여부 확인 1 ok / 0 no)
    @Transactional
    public String updateRatingMentor(Rating rating, HttpServletResponse resp) throws Exception{
        rating.setSumRating(rating.getRating()+ rating.getRating2()+ rating.getRating3());
        myPageMapper.updateRatingMentor(rating);
        log.info(rating);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('평가가 완료되었습니다.')");
        out.println("location.replace('/myPage/mentorRate?bno="+rating.getBno()+"')");
        out.println("</script>");
        out.close();
        return null;
    }
    // 마이페이지 > 멘토 현황 > 멘토링 종료
    @GetMapping("/endMentoring")
    public String endMentoring(Long bno, HttpServletResponse resp) throws Exception{
        myPageMapper.endMentoring(bno);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토링이 종료되었습니다.')");
        out.println("window.close()");
        out.println("opener.location.reload();");
        out.println("</script>");
        out.close();
        return null;
    }

    /*멘토현황 > 멘토 평가 완료 후 평가 종료를 누를 시 나옴 / 평가 종료를 누르면 다시 멘토링에 대한 멘토 평가 불가*/
    @GetMapping("/endRatingMentor")
    public String endRatingMentor(Long bno, HttpServletResponse resp) throws Exception{
        myPageMapper.endRatingMentor(bno);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토링이 종료되었습니다.')");
        out.println("window.close()");
        out.println("opener.location.reload();");
        out.println("</script>");
        out.close();
        return null;
    }

    // 마이페이지 > 회원탈퇴
    @GetMapping("/deleteUser")
    public String deleteUser() {
        return "/myPage/deleteUser";
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("userPw") String userPw, User dto, HttpSession session, Model model,
                             RedirectAttributes ra) throws Exception {
        log.info(userPw);

        User user = (User) session.getAttribute("user");

        String oldPass = user.getUserPw();
        String newPass = dto.getUserPw();

        if (oldPass.equals(newPass)) {
            userService.deleteUser(user.getUserId());
            // ra.addFlashAttribute("result", "success");
            session.invalidate();
            model.addAttribute("msg", "회원정보가 삭제되었습니다.");
            return "/myPage/deleteUser";
        } else {
            // ra.addFlashAttribute("result", "fail");
            model.addAttribute("msg", "잘못된 패스워드입니다.");
            return "/myPage/deleteUser";
        }

    }
}
