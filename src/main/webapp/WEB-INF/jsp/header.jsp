<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta charset="UTF-8">
    <title>HelloMyPage</title>
</head>
<body>
<!-- Header -->
<header id="header">

    <!-- Logo -->
    <div class="logo">
        <a href="index.jsp"><strong>멘토링</strong> <span class="extra">by SKHU</span></a>
    </div>

    <!-- Nav -->
    <nav id="nav">
        <ul>
            <li>
                <a href="#" class="icon solid fa-angle-down">매칭신청</a>
                <ul>
                    <li><a href="#">멘토 등록</a></li>
                    <li><a href="#">멘티 등록</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="icon solid fa-angle-down">멘토/멘티현황</a>
                <ul>
                    <li><a href="#">멘토 목록</a></li>
                    <li><a href="#">멘티 목록</a></li>
                </ul>
            </li>
            <li><a href="generic.html">공지사항</a></li>
            <li><a href="elements.html">마이페이지</a></li>
            <li><a href="login.html">로그인</a></li>
        </ul>
    </nav>

</header>
</body>
</html>