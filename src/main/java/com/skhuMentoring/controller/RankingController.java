package com.skhuMentoring.controller;
import com.skhuMentoring.service.RankingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/ranking/*")
public class RankingController {
    private final RankingService rankingService;
    @GetMapping("/ranking")
    public String ranking(Model model) {
        model.addAttribute("all", rankingService.getMentorRankAll());
        model.addAttribute("one", rankingService.getMentorRankOne());
        model.addAttribute("two", rankingService.getMentorRankTwo());
        model.addAttribute("three", rankingService.getMentorRankThree());
        return  "ranking";
    }


}
