package com.skhuMentoring.controller;
import com.skhuMentoring.mapper.UserMapper;
import com.skhuMentoring.service.MailService;
import com.skhuMentoring.service.MentoringBoardService;
import com.skhuMentoring.service.MyPageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/ranking/*")
public class RankingController {
    private final MailService mailService;
    private final MentoringBoardService  mentoringBoardService;
    private final UserMapper userService;
    private final MyPageService myPageService;


}
