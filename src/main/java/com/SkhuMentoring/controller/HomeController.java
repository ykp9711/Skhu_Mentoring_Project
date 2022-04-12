package com.SkhuMentoring.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class HomeController {

    @GetMapping("/")
    public String main() {
        return "index";
    }

    @GetMapping("/menteeStatus")
    public String menteeStatus() {return  "menteeStatus";}

    @GetMapping("/mentorStatus")
    public String mentorStatus() {return  "mentorStatus";}

    @GetMapping("/myPage")
    public String myPage() {return  "myPage";}

    @GetMapping("/login")
    public String login() {return  "login";}

    @GetMapping("/test")
    public String test() {return  "menteeRegister";}

}
