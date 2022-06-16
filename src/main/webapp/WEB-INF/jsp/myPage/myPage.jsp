<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
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
    #rate, #email, #studentNum, #id {
        background-color: #f8f8f8;
    }
</style>
<head>
    <title>SKHU MENTORING MYPAGE</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />
    <script language="javascript">
        function showPopup() {
            window.open("deleteUser", "회원탈퇴",	"width=400, height=400, left=100, top=50");
        }
    </script>
</head>
<body class="is-preload">
<c:if test="${empty sessionId}">
    <script>
        alert("잘못된 접근경로 입니다.로그인해주세요");
        location.href="/login";
    </script>
</c:if>
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="../header.jsp" %>

    <section id="one" class="main">
        <header class="accent1">
            <h2>My Page</h2>
        </header>
        <ul class="tabs">
            <li>
                <h3><span style="font-size: 0.8em;">내 정보</span></h3>
                <div class="spotlight" style="text-align: center;">
                    <div class="inner2" style="text-align: center;">
                        <form method="post" action="/myPage/modifyUserInfo">
                            <div class="row gtr-uniform" style="text-align: center; width: 74%;  float: right;">
                                <div class="col-7" style="text-align: center;">
                                    <div class="boxx" style="margin:0 auto;">
                                        <img src="/images/${user.imgName}" alt="" class="profile"/>
                                    </div><br>

                                    <a href="/myPage/modifyProfile?bno=${user.userId}" onclick="window.open(this.href,'Detail','width=1100px, height=700px, top=100, left=210, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">랭킹 프로필 수정</a>

                                <div class="col-7" style="text-align: center;"><br>
                                    <label style="text-align: left; color:cornflowerblue">이름</label>
                                    <input type="text" placeholder="이름" name="userName" value="${user.userName}" id="name" />
                                </div><br>
                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left; color:cornflowerblue">아이디</label>
                                    <input type="text" placeholder="아이디" name="userId" value="${user.userId}" id="id" readonly/>
                                </div><br>
                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left; color:cornflowerblue">학부(학과)</label>
                                    <select name="department">
                                        <option label="학과를 선택하세요."></option>
                                        <c:forEach var="d" items="${ departments }">
                                            <option value="${ d.department }" ${ user.department == d.department ? "selected" : "" }>
                                                    ${ d.department }
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div><br>
                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left; color:cornflowerblue">학번</label>
                                    <input type="text" placeholder="학번" id="studentNum" name="userStudentNum" value="${user.userStudentNum}" readonly/>
                                </div><br>
                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left; color:cornflowerblue">전화번호</label>
                                    <input type="text" placeholder="전화번호" name="userPhoneNum" value="${user.userPhoneNum}"/>

                                </div><br>
                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left; color:cornflowerblue">이메일</label>
                                    <input type="text" placeholder="이메일" id="email" name="userEmail" value="${user.userEmail}" id="email" readonly/>
                                </div><br>

                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left; color:cornflowerblue">비밀번호</label>
                                    <input type="password" placeholder="비밀번호" name="userPw" id="userPw" value="${user.userPw}" />
                                    <p id="Check_pw" style="height: 1px; color: #13a2dd; text-align: center;"></p>
                                </div><br>

                                <div class="col-7" style="text-align: center;">
                                    <input type="password" placeholder="비밀번호 확인" id="conPw" value="${user.userPw}"/>
                                    <p id="Check_conPw" style="height: 1px; color: #13a2dd; text-align: center;"></p>
                                </div><br>

                                <div class="col-7" style="text-align: center; ">
                                    <label style="text-align: left;color: cornflowerblue">내 멘티 평점</label>
                                    내가 들은 멘토링 : ${menteeMentoringCount} 회
                                    <c:if test="${menteeMentoringCount eq 0}">
                                        <input type="text"  id="rate" value="${(user.menteeRating /3.0)}" readonly/>
                                    </c:if>
                                    <c:if test="${menteeMentoringCount ne 0}">
                                        <c:set var="num1" value="${((user.menteeRating/3.0)/menteeMentoringCount)}" />
                                        <input type="text" placeholder="내 멘토 횟수(순위)" value="<fmt:formatNumber type="number"  pattern="0.0" value="${ ((num1*10) - ((num1*10)%1)) * (1/10)} " /> / 5.0"  id="rank" readonly/>
                                    </c:if>
                                </div><br>
                                <div class="col-7" style="text-align: center;">
                                    <label style="text-align: left;color: cornflowerblue">내 멘토 평점(5점 만점)</label>
                                    내가 진행한 멘토링 수업 ${mentorMentoringCount} 회
                                    <c:if test="${mentorMentoringCount eq 0}">
                                        <input type="text"  id="rate" value="0.0 / 5.0" readonly/>
                                    </c:if>
                                    <c:if test="${mentorMentoringCount ne 0}">
                                    <c:set var="num1" value="${((user.mentorRating/3.0)/mentorMentoringCount/getMentoringCount)}" />
                                    <input type="text" placeholder="내 멘토 횟수(순위)" value="<fmt:formatNumber type="number"  pattern="0.0" value="${ ((num1*10) - ((num1*10)%1)) * (1/10)} " /> / 5.0"  id="rank" readonly/>
                                    </c:if>
                                </div><br>
                                <br><br>
                                <div class="col-7" style="text-align: center;">
                                    <input type="submit" class="button primary" id="btn" value="수정하기" style="margin-right: 5%"> </input>
                                    <input type="button" value="회원탈퇴" onclick="showPopup();"/>
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
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 인원</th>

                                <th style="text-align: center; vertical-align : middle;" >진행현황</th>
                                <th style="text-align: center; vertical-align : middle;" >멘티 정보</th>
                                <th style="text-align: center; vertical-align : middle;" >멘토링 종료</th>
                                <th style="text-align: center; vertical-align : middle;" >멘토링 시작일</th>
                                <th style="text-align: center; vertical-align : middle;" >멘토링 종료일</th>


                            </tr>

                            <c:forEach var="Mentoring" items="${Mentoring}">
                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">${Mentoring.subjectName}</td>
                                <td style="vertical-align : middle">${Mentoring.personnel}</td>
                                <td style="vertical-align : middle">${Mentoring.recruiting}</td>
                                <td style="vertical-align : middle" class="area" ><a href="/status/detailMentees?bno=${Mentoring.bno}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>
                                <c:if test="${Mentoring.recruiting == '진행중'}">
                                    <td style="vertical-align : middle" class="area" ><a href="/myPage/menteeRate?bno=${Mentoring.bno}" onclick="window.open(this.href,'Detail','width=700px, height=600px, top=200, left=570, toolbar=no, scrollbars=no, resizable=0');return false;" target="_blank" class="button small">종료</a></td>
                                </c:if>
                                <c:if test="${Mentoring.recruiting == '종료됨'}">
                                    <td style="vertical-align : middle" class="area" ><a href="" class="button small disabled">종료되었습니다</a></td>
                                </c:if>
                                <td style="vertical-align : middle" class="title">
                                    <fmt:formatDate var="realStartDate" value="${Mentoring.realStartDate}" pattern="yyyy-MM-dd"/>
                                        ${realStartDate}</td>
                                <td style="vertical-align : middle" class="title">
                                    <fmt:formatDate var="realEndDate" value="${Mentoring.realEndDate}" pattern="yyyy-MM-dd"/>

                                        ${realEndDate}</td>
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
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토링 상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">진행현황</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 시작일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 종료일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토 평가</th>



                            </tr>
                            <c:forEach var="mentee" items="${myMenteeStatus}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${mentee.subjectName}</td>
                                    <td style="vertical-align : middle">${mentee.userName}</td>
                                    <td style="vertical-align : middle"><a href="/status/detailMentor?bno=${mentee.bno}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>
                                    <td style="vertical-align: middle;" >${mentee.recruiting}</td>
                                    <td style="vertical-align : middle" class="title">
                                        <fmt:formatDate var="realStartDate" value="${mentee.realStartDate}" pattern="yyyy-MM-dd"/>
                                            ${realStartDate}</td>
                                    <td style="vertical-align : middle" class="title">
                                        <fmt:formatDate var="realEndDate" value="${mentee.realEndDate}" pattern="yyyy-MM-dd"/>
                                            ${realEndDate}</td>
                                    <c:if test="${mentee.recruiting eq '종료됨' && mentee.checkRatingMentor eq 0}">
                                        <td style="vertical-align : middle" class="area" ><a href="/myPage/mentorRate?bno=${mentee.bno}" onclick="window.open(this.href,'Detail','width=600px, height=600px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">멘토 평가</a></td>
                                    </c:if>
                                    <c:if test="${mentee.checkRatingMentor eq 1}">
                                        <td style="vertical-align : middle" class="area" ><a href="" class="button small disabled">평가 완료</a></td>
                                    </c:if>
                                    <c:if test="${mentee.recruiting == '진행중'}">
                                        <td style="vertical-align : middle" class="area" ><a href="" class="button small disabled">종료후 가능</a></td>
                                    </c:if>

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
                                <th style="text-align: center; vertical-align : middle;" class="menteeName">이름</th>
                                <th style="text-align: center; vertical-align : middle;" class="menteeNumber">학번</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">학부</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘티 상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">수락/거절</th>

                            </tr>


                            <c:forEach var="requestMentee" items="${requestMentee}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${requestMentee.userName}</td>
                                    <td style="vertical-align : middle">${requestMentee.userStudentNum}</td>
                                    <td style="vertical-align : middle">${requestMentee.department}</td>
                                    <td style="vertical-align : middle">${requestMentee.subjectName}</td>
                                    <td style="vertical-align : middle" class="area" ><a href="/status/detailMentee?bno=${requestMentee.bno}&menteeId=${requestMentee.menteeId}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>
                                    <td style="vertical-align : middle" class="area" ><a href="javascript:void(0)" onclick="del('${requestMentee.bno}', '${requestMentee.menteeId}')" class="button small">수락</a>
                                        <a href="/myPage/applicationRefusal?bno=${requestMentee.bno}&menteeId=${requestMentee.menteeId}" onclick="window.open(this.href,'Detail','width=600px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">거절</a></td></td>
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

                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">승인여부</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">신청취소</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘토정보</th>

                            </tr>

                            <c:forEach var="applicationMentor" items="${applicationMentor}">
                                <tr style="height: 70px;">
                                    <td style="vertical-align : middle">${applicationMentor.subjectName}</td>
                                    <td style="vertical-align : middle">
                                        <c:choose>
                                            <c:when test="${applicationMentor.accept eq '거절됨'}">
                                                <a href="/myPage/showRefusalReason?bno=${applicationMentor.bno}&menteeId=${applicationMentor.menteeId}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">거절 사유</a>
                                            </c:when>
                                            <c:otherwise>
                                                ${applicationMentor.accept}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="vertical-align : middle">
                                    <c:choose>
                                    <c:when test="${applicationMentor.accept eq '거절됨'}">
                                    <a href="javascript:void(0)" onclick="cancelApplication(${applicationMentor.bno})" class="button small disabled">거절됨</a>
                                    </c:when>
                                        <c:when test="${applicationMentor.accept eq '수락됨'}">
                                            <a href="javascript:void(0)" onclick="cancelApplication(${applicationMentor.bno})" class="button small disabled">신청취소</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:void(0)" onclick="cancelApplication(${applicationMentor.bno})" class="button small">신청취소</a>
                                    </c:otherwise>
                                        </c:choose>
                                    </td>


                                    <td style="vertical-align : middle" class="area" ><a href="/status/detailMentor?bno=${applicationMentor.bno}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>
                                </tr>
                            </c:forEach>


                        </table>
                    </div>
    </section>

    <!-- Footer -->
    <%@include file ="../footer.jsp" %>

</div>

<!-- Scripts -->
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

    //비밀번호 양식
    $("#userPw").on("property-change change keyup paste input", function(){
        var userPw = $("#userPw").val();
        var conPw = $("#conPw").val();

        function isPassword(asValue) {
            var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

            return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
        }

        if(!isPassword(userPw) ||userPw.length < 8 || userPw.length > 16 ){
            $("#Check_pw").text("*특수문자/영문/숫자를 포함하여 8~16자");
            $("#btn").attr('disabled', true);
        } else{
            $("#Check_pw").text("비밀번호가 적합합니다.");
        }
    })

    //비밀번호와 비밀번호 확인 일치 여부
    $('#conPw').on("property-change change keyup paste input", function(){
        var userPw = $("#userPw").val();
        var conPw = $("#conPw").val();

        if(userPw != conPw) {
            $("#Check_conPw").text("비밀번호가 다릅니다.");
            $("#btn").attr('disabled', true);
        } else {
            $("#Check_conPw").text(" ");
            $("#btn").attr('disabled', false);
        }
    })

</script>

<script type="text/javascript">
    // 멘티가 보낸 요청 수락
    function del(bno, menteeId) {
        if (confirm("수락하시겠습니까?") == true){    //확인
            window.location.href="/status/menteeAccept?bno="+bno+"&menteeId="+menteeId
        }else{   //취소
            alert("취소되었습니다.")
        }
    }
</script>
<script>
    // 멘토에게 보낸 신청 취소하기
    function cancelApplication(bno){
        if(confirm("신청을 취소하시겠습니까?") == true){
            location.href="/myPage/cancelApplication?bno="+bno
        }else{
            alert("취소되었습니다.")
        }
    }
</script>

</body>
</html>