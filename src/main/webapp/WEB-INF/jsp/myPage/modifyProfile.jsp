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
        width: 100%;
        height: 100%;
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
        <form name="modifyProfile" method="post" action="/myPage/modifyProfile" >
            <div class="spotlight">

                <ul>
                    <li>
                        <h4>이름/닉네임</h4>
                        <div class="col-12">
                        <input type="textarea" name="nickName" placeholder="닉네임">
                        </div>
                    </li>
                    <li>
                        <h4>자신있는 멘토링</h4>
                        <div class="col-12">
                            <input type="textarea" name="career" placeholder="자바,파이썬">
                        </div>
                    </li>
                </ul>
                <span class="image"><img src="/images/pic01.jpg" alt="" /></span>
                <ul>
                    <li>
                        <h4>멘토의 한마디</h4>
                        <div class="col-12">
                            <input type="textarea" name="word" placeholder="화이팅">
                        </div>
                    </li>
                    <li>
                        <h4>멘토와 연락할 수 있는 방법</h4>
                        <div class="col-12">
                            <input type="textarea" name="sns" placeholder="SNS,카카오톡ID">
                        </div>
                    </li>
                </ul>
            </div>

                <div class="col-12" style="text-align: center;">
                    <a href="javascript:void(0)" onclick="modify(${bno})" class="button ">변경 </a>
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

</body>
</html>