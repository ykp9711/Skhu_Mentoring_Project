<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>SKHU MENTORING DETAIL MENTOR</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>멘토 상세보기</h1>
        </header>
        <div class="inner3"><br><br>

            <div class="table-wrapper">
                <table style="border: 1px; margin:0; text-align: center;  ">
                    <tr style="background: transparent">

                        <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘토 이름</td>
                        <td style="text-align: center; vertical-align : middle;" >${user.userName}</td>


                    </tr>
                    <tr style="height: 70px;">
                        <td style="vertical-align: middle; background: #eeeeee;" >멘토 학번</td>
                        <td style="vertical-align: middle;" >${user.userStudentNum}</td>
                    </tr>

<c:if test="${mentorId ne null}">
                    <tr style="height: 70px;">
                        <td style="vertical-align: middle; background: #eeeeee;" >멘토 평점</td>
                        <td style="vertical-align: middle;" >
                            <c:if test="${mentorMentoringCount eq 0}">
                                멘토 내역 없음
                            </c:if>
                            <c:if test="${mentorMentoringCount ne 0}">
                                <c:set var="num1" value="${((user.mentorRating/3.0)/mentorMentoringCount/getMentoringCount)}" />
                                <fmt:formatNumber type="number"  pattern="0.0" value="${ ((num1*10) - ((num1*10)%1)) * (1/10)} " /> / 5.0
                            </c:if>
                        </td>
                    </tr>
</c:if>
                </table>
                <div class="col-12">
                    <textarea name="demo-message" id="demo-message" disabled style="background: white" rows="6">${detailMentor.introduce}</textarea>
                </div>
                <br>
                <div class="col-12" style="text-align: center;">
<c:if test="${mentorId ne null}">
    <c:choose>
    <c:when test="${user.userId eq sessionId}">
                    <a href="/register/menteeRegister?bno=${detailMentor.bno}" class="button primary disabled" style="margin-right: 3%;">&nbsp;신청&nbsp;</a>
</c:when>
        <c:otherwise>
            <a href="/register/menteeRegister?bno=${detailMentor.bno}&pathIndex=true" class="button primary" style="margin-right: 3%;">&nbsp;신청&nbsp;</a>
        </c:otherwise>
    </c:choose>
</c:if>
                    <a href='javascript:self.close();' class="button">&nbsp;닫기&nbsp;</a>

                </div>
            </div>

            <br><br>
        </div>
    </section>


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

</body>
</html>
