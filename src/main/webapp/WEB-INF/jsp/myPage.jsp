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
<style>
    .tab {
        list-style: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    /* Float the list items side by side */
    .tab li {
        float: left;
    }
    /* Style the links inside the list items */
    .tab li a {
        display: inline-block;
        color: #000;
        text-align: center;
        text-decoration: none;
        padding: 14px 16px;
        font-size: 17px;
        transition: 0.3s;
        text-decoration-line : none;
    }
    /* Style the tab content */
    .tabcontent {
        display: none;
        background-color: #f7f7f7;
        padding: 6px 12px;
        color: #fff;
    }
    ul.tab li.current {
        background-color: rgb(0, 154, 200);
        color: #222;
    }
    .tabcontent.current {
        display: block;
    }

    #id, #rank ,#rate {
        background-color: #f6f6f6;
    }
</style>
<head>
    <title>마이페이지</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="header.jsp" %>

    <section id="one" class="main">
        <header class="accent1">
            <h2>My Page</h2>
        </header>
        <ul class="tabs">
            <li>
                <h3><span style="font-size: 0.8em;">내 정보</span></h3>
                <div class="spotlight" style="text-align: center;">
                    <div class="inner2" style="text-align: center;">
                        <form method="post" action="/modifyUserInfo">
                            <div class="row gtr-uniform" style="text-align: center; width: 74%;  float: right;">
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="이름" name="userName" value="${user.userName}" id="name" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="아이디" name="userId" value="${user.userId}" id="id" readonly/>
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <select name="department">
                                        <option label="학과를 선택하세요."></option>
                                        <c:forEach var="d" items="${ departments }">
                                            <option value="${ d.department }" ${ user.department == d.department ? "selected" : "" }>
                                                    ${ d.department }
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="학번" name="userStudentNum" value="${user.userStudentNum}"/>
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="전화번호"name="userPhoneNum" value="${user.userPhoneNum}"/>

                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="이메일" name="userEmail" value="${user.userEmail}"/>
                                </div>

                                <div class="col-7" style="text-align: center;">
                                    <input type="password" placeholder="비밀번호" name="userPw" value="${user.userPw}" />
                                </div>

                                <div class="col-7" style="text-align: center;">
                                    <input type="password" placeholder="비밀번호 확인" value="${user.userPw}"/>
                                </div>

                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="내 멘티 평점" id="rate" readonly/>
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="내 멘토 횟수(순위)" id="rank" readonly/>
                                </div>
                                <br><br>
                                <div class="col-7" style="text-align: center;">
                                    <button type="submit">수정하기</button>
                                </div>

                                <!-- Break -->

                            </div>
                        </form>
                        <br><br>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">멘토 현황</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" >멘티 인원 수</th>
                                <th style="text-align: center; vertical-align : middle;" >멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" >상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" >멘토링 종료</th>

                            </tr>

                            <c:forEach var="list" items="${list}">
                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">${list.bno}</td>
                                <td style="vertical-align : middle">${list.subjectName}</td>
                                <td style="vertical-align: middle;" >${list.menteeCount}</td>
                                <td style="vertical-align : middle" class="title">${list.startDate}</td>
                                <td style="vertical-align : middle" class="area" ><a href="/detailMentoring" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="/endMentoring?subjectName=${list.subjectName}" class="button small">종료</a></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <br>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">멘티 현황</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 시작 일</th>


                            </tr>
                            <c:forEach var="list2" items="${list2}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${list2.bno}</td>
                                    <td style="vertical-align : middle">${list2.subjectName}</td>
                                    <td style="vertical-align: middle;" >${list2.mentorWho}</td>
                                    <td style="vertical-align : middle" class="title">${list2.startDate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">종료된 멘토</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 종료 일</th>


                            </tr>
                            <c:forEach var="list" items="${list}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${list.bno}</td>
                                    <td style="vertical-align : middle">${list.subjectName}</td>
                                    <td style="vertical-align : middle" class="title">${list.startDate}</td>
                                    <td style="vertical-align : middle" class="title">${list.endDate}</td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">종료된 멘티</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 종료 일</th>


                            </tr>

                            <c:forEach var="list2" items="${list2}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${list2.bno}</td>
                                    <td style="vertical-align : middle">${list2.subjectName}</td>
                                    <td style="vertical-align: middle;" >${list2.mentorWho}</td>
                                    <td style="vertical-align : middle" class="title">${list2.startDate}</td>
                                    <td style="vertical-align : middle" class="title">${list2.endDate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;" >멘티에게 받은 요청</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">학번</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">학부</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘티 상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">수락/거절</th>

                            </tr>
                            <c:forEach var="list2" items="${list2}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${list2.bno}</td>
                                    <td style="vertical-align : middle">${list2.userStudentNum}</td>
                                    <td style="vertical-align : middle">${list2.department}</td>
                                    <td style="vertical-align : middle">${list2.subjectName}</td>
                                    <td style="vertical-align : middle" class="area" ><a href="/detailMentee?userStudentNum=${list2.userStudentNum}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>
                                    <td style="vertical-align : middle" class="area" ><a href="/requestAccept?userStudentNum=${list2.userStudentNum}" class="button small">수락</a>
                                        <a href="/requestRefusal?userStudentNum=${list2.userStudentNum}" class="button small">거절</a></td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;" >멘토에게 보낸 신청</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">승인여부</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">신청취소</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘토정보</th>

                            </tr>

                            <c:forEach var="list" items="${list}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${list.bno}</td>
                                    <td style="vertical-align : middle">${list.subjectName}</td>
                                    <td style="vertical-align : middle">대기중</td>
                                    <td style="vertical-align : middle"><a href="멘티등록링크" class="button small">신청취소</a></td>
                                    <td style="vertical-align : middle"><a href="멘티등록링크" class="button small">상세보기</a></td>
                                </tr>
                            </c:forEach>


                        </table>
                    </div>
    </section>

    <!-- Footer -->
    <%@include file ="footer.jsp" %>

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