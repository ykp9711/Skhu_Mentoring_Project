<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>SKHU MENTORING DELETE</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />

    <script>
        function mypage_check() {
            window.opener.location.href="../";
            window.close();

        }

    </script>
</head>
<body>
<c:if test="${not empty sessionId}">
    <form method="post" action="deleteUser">
        <div class="row gtr-uniform" style="text-align: center; width: 90%;   float: right;">
            <div class="col-10" style="text-align: center;">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" value="${sessionId}" readonly/>
            </div>

            <div class="col-10" style="text-align: center;">
                <label for="userPw">비밀번호</label>
                <input type="password" id="userPw" name="userPw" />
            </div>

            <div class="col-10">
                <button class="btn btn-success" type="submit" value="회원탈퇴" id="submit">회원탈퇴</button>
                <button class="cancel btn btn-danger" type="button" onclick="window.close()">취소</button>
            </div>
            <div class="col-10" style="color:blue">${msg}</div>
        </div>

    </form>
</c:if>

<c:if test="${empty sessionId}">
    <form action="#">
        <div class="row gtr-uniform" style="text-align: center; width: 90%;   float: right;">
            <div class="col-10" style="color:blue">${msg}</div>
            <br>
            <div class="col-10">
                <button class="cancel btn btn-danger" type="button" onclick="mypage_check();">닫기</button>
            </div>
        </div>
    </form>

</c:if>
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
