<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>SKHU MENTORING MODIFY</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />
</head>
<style>
    .boxx {
        width: 130px;
        height: 130px;
        border-radius: 50%;
        overflow: hidden;
    }
    .profile {
        width: 120%;
        height: 120%;
        object-fit: cover;
    }
</style>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent3">
            <h1>프로필 수정</h1>
        </header>
        <form name="form" method="post" action="/myPage/profileImg" enctype="multipart/form-data">
            <div class="spotlight">

                <ul>
                    <li>
                        <h4>이름/닉네임</h4>
                        <div class="col-12">
                        <input type="textarea" name="nickName" placeholder="닉네임" value="${user.nickName}">
                        </div>
                    </li>
                    <li>
                        <h4>자신있는 멘토링</h4>
                        <div class="col-12">
                            <input type="textarea" name="mainSubject" placeholder="자바,파이썬" value="${user.mainSubject}">
                        </div>
                    </li>
                </ul>
                <div class="boxx" style="margin:0 auto; width: 50%; height: 200px;">
                    <img src="/images/${user.imgName}" alt="" class="profile"/>
                </div><br>
                <ul>
                    <li>
                        <h4>멘토의 한마디</h4>
                        <div class="col-12">
                            <input type="textarea" name="oneWord" placeholder="화이팅" value="${user.oneWord}">
                        </div>
                    </li>
                    <li>
                        <h4>멘토와 연락할 수 있는 방법</h4>
                        <div class="col-12">
                            <input type="textarea" name="sns" placeholder="SNS,카카오톡ID" value="${user.sns}">
                        </div>
                    </li>
                </ul>
            </div>

                <div class="col-12" style="text-align: center;">
                    <a href="/myPage/imgReset">프로필 사진 초기화</a>
                    <p style="margin-left: 10%"><input type="file" id="img" name="img" accept="image/*" onchange="loadFile(this)"></p>
                    <input type="submit" value="변경하기">
                    <a href='javascript:self.close();' class="button primary">닫기</a>
                    <%--<a href="javascript:void(0)" onclick="endMentoring(${Mentoring.bno})" class="button small">종료</a>--%>

                </div>

                <br><br></form>

    </section>


</div>

<!-- Scripts -->
<script>
</script>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.dropotron.min.js"></script>
<script src="/assets/js/jquery.selectorr.min.js"></script>
<script src="/assets/js/jquery.scrollex.min.js"></script>
<script src="/assets/js/jquery.scrolly.min.js"></script>
<script src="/assets/js/browser.min.js"></script>
<script src="/assets/js/breakpoints.min.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/js/main.js"></script>
<script>
    // 진행중인 멘토링 종료
    function modify(bno, menteeId){

        if(confirm("변경이 완료되었습니까?") == true){
            location.href="/myPage/modifyProfile?bno="+bno
        }else{
            alert("취소되었습니다.")
        }
    }

</script>
<script>
    function loadFile(input) {
        var file = input.files[0];	//선택된 파일 가져오기

        //미리 만들어 놓은 div에 text(파일 이름) 추가
        var name = document.getElementById('fileName');
        name.textContent = file.name;

        //새로운 이미지 div 추가
        var newImage = document.createElement("img");
        newImage.setAttribute("class", 'img');

        //이미지 source 가져오기
        newImage.src = URL.createObjectURL(file);

        newImage.style.width = "70%";
        newImage.style.height = "70%";
        newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
        newImage.style.objectFit = "contain";

        //이미지를 image-show div에 추가
        var container = document.getElementById('image-show');
        container.appendChild(newImage);
    };
</script>

</body>
</html>