package com.skhuMentoring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.concurrent.ThreadLocalRandom;

@Service
public class MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public String sendMail(String userEmail){

        String to = userEmail;

        SimpleMailMessage message = new SimpleMailMessage();

        String authKey = Integer.toString( ThreadLocalRandom.current().nextInt(100000, 1000000) );

        message.setTo(to);
        message.setSubject("Skhu Mentoring 이메일 인증 안내");
        message.setText("안녕하세요! SKhu Mentoring 입니다. \n" + "인증번호: " + authKey );
        javaMailSender.send(message);

        return authKey;
    }

}
