package com.skhuMentoring.controller;

import com.skhuMentoring.dto.*;
import com.skhuMentoring.mapper.MyPageMapper;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.EncryptionService;
import com.skhuMentoring.service.MailService;
import com.skhuMentoring.service.MentoringBoardService;
import com.skhuMentoring.service.MyPageService;
import lombok.extern.log4j.Log4j2;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/myPage/*")
public class MyPageController {
    private final MentoringBoardService mentoringBoardService;
    private final MailService mailService;
    private final MyPageService myPageService;
    private final UserMapper userService;
    private final Upload upload;
    private final EncryptionService Encryption;
    //마이페이지로 이동
    @GetMapping("/myPage")
    public String myPageGo(@ModelAttribute Mentor mentor, Model model, HttpSession session, Mentee mentee, Long bno) {
        model.addAttribute("user", userService.getUser((String) session.getAttribute("sessionId"))); // 로그인 세션 값으로 유저 정보 보내줌
        String userId = (String) session.getAttribute("sessionId");
        model.addAttribute("list", myPageService.getMentorMyStatus(userService.getId(userId))); // 멘토정보 불러오기
        model.addAttribute("applicationMentor", myPageService.getApplicationMentor(userId)); // 멘토에게 보낸 신청
        model.addAttribute("requestMentee", myPageService.getRequestMentee(userId)); //  멘티에게 받은 요청
        model.addAttribute("departments", mentoringBoardService.getDepartment());
        model.addAttribute("Mentoring", myPageService.getMyMentoring(userId)); // (마이페이지 -> 멘토현황)
        model.addAttribute("myMenteeStatus", myPageService.getMyMenteeStatus(userId)); // 마이페이지 - > 멘티현황
        model.addAttribute("menteeMentoringCount", myPageService.getMenteeCount(userId)); // 멘티가 현재까지 들은 멘토링 횟수
        model.addAttribute("mentorMentoringCount", myPageService.getMentorCount(userId)); // 멘토가 현재까지 진행한 멘토링 횟수
        model.addAttribute("getMentoringCount", myPageService.getMentoringCount(userId)); // 해당 멘토의 현재까지 가르킨 멘티 수
        return "/myPage/myPage";
    }
    // 마이페이지 > 멘토 현황 > 상세보기

    @GetMapping("/detailMentoring")
    public String detailMentoring(Model model){
        model.addAttribute("list2",myPageService.getMenteeStatus());
        model.addAttribute("Mentoring",myPageService.getMentoring());
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
        model.addAttribute("refusalReason", myPageService.showRefusalReason(bno,menteeId));
        return "/myPage/showRefusalReason";
    }

    @PostMapping("/applicationRefusal") // 거절 사유 작성
    public String requestRefusal(Long bno,String menteeId ,String refusalReason, HttpServletResponse resp) throws Exception{
        myPageService.refusalReason(bno, menteeId, refusalReason);
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
        myPageService.cancelApplication(bno, (String)session.getAttribute("sessionId"));

        return "redirect:/myPage/myPage";
    }

    //마이페이지 > 내 정보 수정
    @PostMapping("/modifyUserInfo")
    public String modifyUserInfo(@ModelAttribute User user) throws InvalidAlgorithmParameterException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, BadPaddingException, InvalidKeyException {
        user.setUserPw(Encryption.encrypt(user.getUserPw()));
        myPageService.modifyUserInfo(user);
        return "redirect:/myPage/myPage";
    }
    @GetMapping("/menteeRate") // 멘티평가하기
    public String detailMentees(Long bno,Model model) {
        List<Mentoring> list = myPageService.getMenteeList(bno);
        // 해당 게시글 모든 멘티의 checkRating를 확인 후 0(평점을 메기지 않은 멘티)가 존재한다면 noRating을 menteeRate.jsp로 전달한다
        for(int i =0; i<list.size(); i++){
            if(list.get(i).getCheckRating()==0){
                model.addAttribute("noRating", "noRating");
            }
        }
        model.addAttribute("mentee" , myPageService.getMenteeList(bno));
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
    public String detailMentors(Long bno,Model model, HttpSession session) {
        String userId =(String)session.getAttribute("sessionId");
        List<Mentoring> list = myPageService.getMentorList(bno);
        model.addAttribute("mentor" , myPageService.getMentorList(bno));
        model.addAttribute("bno",bno);
        model.addAttribute("check" , myPageService.getCheckRatingMentor(bno,userId)); // applicationMentor 테이블에서 checkRatingMentor를 확인하기 위해 전달
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
        myPageService.updateRating(rating);
        myPageService.ratingOk(rating);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('평가가 완료되었습니다.')");
        out.println("location.replace('/myPage/menteeRate?bno="+rating.getBno()+"')");
        out.println("</script>");
        out.close();
        return null;
    }

    @PostMapping("/updateRatingMentor") // 멘토 평가 완료 tbl_user테이블에 점수가 합산되고, tbl_applicationMentor테이블의 checkRating 값을 1로 변경(평가여부 확인 1 ok / 0 no)
    @Transactional
    public String updateRatingMentor(Rating rating,String userId, Long bno, HttpServletResponse resp) throws Exception{
        rating.setSumRating(rating.getRating()+ rating.getRating2()+ rating.getRating3());
        myPageService.updateRatingMentor(rating);
        myPageService.endRatingMentor(bno,userId);
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
        myPageService.endMentoring(bno);
        myPageService.endMentoringAccept(bno);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('멘토링이 종료되었습니다.')");
        out.println("opener.location.reload()");
        out.println("window.close()");
        out.println("</script>");
        out.close();
        return null;
    }

    /*멘토현황 > 멘토 평가 완료 후 평가 종료를 누를 시 나옴 / 평가 종료를 누르면 다시 멘토링에 대한 멘토 평가 불가*/
    @GetMapping("/endRatingMentor")
    public String endRatingMentor(Long bno, HttpServletResponse resp) throws Exception{
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
    @GetMapping("/modifyProfile")
    public String modifyProfile(HttpServletRequest req, Model model, HttpSession session){
        model.addAttribute("user", userService.getUser((String) session.getAttribute("sessionId")));
        return "/myPage/modifyProfile";
    }

    private final MyPageMapper myPageMapper;
    //프로필 사진 설정
    @PostMapping("/profileImg")
    public String profileImgUpload(MultipartFile img, HttpServletResponse resp, HttpSession session ,User user, HttpServletRequest req) throws Exception {
    user.setImgName(userService.getUser((String)session.getAttribute("sessionId")).getImgName());
        if((img.getSize() >0)) {
            String imgName = upload.FileUpload(img, req);
            user.setImgName(imgName);
        }
        String userId = (String)session.getAttribute("sessionId");
        //*파일 이름을 user에 컬럼에 update로 추가
        user.setUserId(userId);
        myPageMapper.modifyProfile(user);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('프로필이 수정되었습니다.')");
        out.println("window.close()");
        out.println("opener.location.reload()");
        out.println("</script>");
        out.close();
        return null;
    }
    @GetMapping("/imgReset")
    public void imgReset(HttpSession session , HttpServletResponse resp) throws Exception{
        String userId = (String)session.getAttribute("sessionId");
        myPageMapper.resetImg(userId);
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('프로필이 사진이 초기화 되었습니다.')");
        out.println("window.close()");
        out.println("opener.location.reload()");
        out.println("</script>");
        out.close();
    }

}
