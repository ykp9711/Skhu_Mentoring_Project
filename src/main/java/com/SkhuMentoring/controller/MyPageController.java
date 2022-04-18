package com.SkhuMentoring.controller;


import com.SkhuMentoring.dto.Mentor;
import com.SkhuMentoring.mapper.MyPageMapper;
import lombok.extern.log4j.Log4j2;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/myPage/*")
public class MyPageController {

    private final MyPageMapper myPageMapper;

    @GetMapping("/go")
    public String myPageGo(@ModelAttribute Mentor mentor, Model model){
        model.addAttribute("list",myPageMapper.getMentorStatus());
        //model.addAttribute("list2",myPageMapper.getMenteeStatus());
        return "myPage";
    }

    //페이징 할 때 사용

    /*@Autowired
    MyPageMapper mapper;

    @GetMapping("/")
    public String myPage(@ModelAttribute Mentor mentor, Model mo, Criteria cri, HttpSession session) throws Exception{

        mo.addAttribute("list", mapper.getList(cri));
        mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal(cri)));
        mo.addAttribute("total", mapper.getTotal(cri));
        return "myPage"*/;


    }
