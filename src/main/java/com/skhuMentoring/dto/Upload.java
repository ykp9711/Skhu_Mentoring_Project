package com.skhuMentoring.dto;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpServletRequest;

@Component
@Log4j2
public class Upload {

    public String FileUpload(MultipartFile file, HttpServletRequest Request) throws IOException {



        File target = new File(Request.getSession().getServletContext().getRealPath("/images"));
        if (!target.exists()) target.mkdirs(); // 파일 경로에 폴더 없으면 새로운 폴더 생성


            String orgFileName = file.getOriginalFilename();  //파일 실제이름
            String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf(".")); // 파일 확장자 exe같은거
            String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension; // 파일 랜덤이름
            Long saveFileSize = file.getSize();


            target = new File(Request.getSession().getServletContext().getRealPath("/images"), saveFileName);
            file.transferTo(target);


        return saveFileName;
    }
}