<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <a href="/"><strong>멘토링</strong> <span class="extra">by SKHU</span></a>
    </div>

    <!-- Nav -->
    <nav id="nav">
        <ul>
            <li>
                <a href="#" class="icon solid fa-angle-down">매칭신청</a>
                <ul>
                    <li><a href="/mentorRegister">멘토 등록</a></li>
                    <li><a href="/menteeRegister">멘티 등록</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="icon solid fa-angle-down">멘토/멘티현황</a>
                <ul>

                    <li><a href="/status/mentorStatus">멘토 목록</a></li>
                    <li><a href="/status/menteeStatus">멘티 목록</a></li>
                </ul>
            </li>
            <%--<li><a href="generic.html">공지사항</a></li>--%>
            <li><a href="/myPage/myPage">마이페이지</a></li>
            <li><a href="/ranking">랭킹</a></li>
            <c:if test="${empty sessionId }">
            <li><a href="/login">로그인</a></li>
            </c:if>
            <c:if test="${not empty sessionId}">
                <li><a href="/logout">로그아웃</a></li>
            </c:if>
        </ul>
    </nav>

</header>
</body>
</html>