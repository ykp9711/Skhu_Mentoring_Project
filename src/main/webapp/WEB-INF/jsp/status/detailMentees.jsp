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
    <title>Untitled</title>
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
            <h1>현재 신청한 멘티 현황</h1>
        </header>
        <div class="inner3"><br><br>

            <div class="table-wrapper">
                <c:choose>
                    <c:when test="${not empty detailMentees}">
                <table style="border: 1px; margin:0; text-align: center;  ">

                    <tr style="background: transparent">

                        <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 이름</td>
                        <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 학번</td>


                    </tr>
                    <c:forEach var="detailMentee" items="${detailMentees}">
                    <tr style="height: 70px;">
                        <td style="vertical-align: middle;" >${detailMentee.userName}</td>
                        <td style="vertical-align: middle;" >${detailMentee.userStudentNum}</td>
                    </tr>
                    </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p style="text-align: center">신청한 멘티가 없습니다.</p>
                    </c:otherwise>
                    </c:choose>

                <br>
                <div class="col-12" style="text-align: center;">

                    <a href='javascript:self.close();' class="button primary">닫기</a>

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
