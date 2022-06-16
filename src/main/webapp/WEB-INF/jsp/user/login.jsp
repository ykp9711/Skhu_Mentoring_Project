
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>SKHU MENTORING LOGIN</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />

    <script type="text/javascript">

        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.userId.value)
            {
                alert("아이디를 입력하세요");
                inputForm.userId.focus();
                return false;
            }
            if(!inputForm.userPw.value)
            {
                alert("비밀번호를 입력하세요");
                inputForm.userPw.focus();
                return false;
            }
        }

        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="signUp.jsp";
        }
    </script>

</head>
<body class="is-preload">
<c:if test="${not empty sessionId}">
    <script>
        alert("이미 로그인 되어있습니다.");
        location.href="/";
    </script>
</c:if>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="../header.jsp" %>

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>Login</h1>
        </header>
        <div class="inner2"><br><br>

            <form name="loginInfo" method="post" onsubmit="return checkValue()" >

            <form method="post" action="">
                <div class="row gtr-uniform">
                    <div class="col-12">
                        <input type="text" name="userId" id="userId" value="" placeholder="ID" />
                    </div>
                    <div class="col-12">
                        <input type="password" name="userPw" id="userPw" value="" placeholder="PASSWORD" />
                    </div>
                    <div class="col-12" style="text-align: center;">
                        <input type="submit" value="로그인" class="button primary fit" id="login_btn"/>
                    </div>
                    <div class="col-12" style="text-align: center;">
                        <ul class="actions fit small">
                            <li> <a href="signUp" class="button fit small">회원가입</a></li>
                            <li><a href="findPwId" class="button fit small">ID/PW 찾기</a></li>
                        </ul>
                    </div>
                    <div class="col-12"style="text-align: center; color: #575757">${msg}</div>

                </div>
            </form>
                <br><br>
        </div>
    </section>
    <!-- Footer -->
    <%@include file ="../footer.jsp" %>
</div>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.selectorr.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
