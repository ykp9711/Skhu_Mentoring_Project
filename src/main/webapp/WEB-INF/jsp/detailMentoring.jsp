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
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>Mentoring Status</h1>
        </header>
        <div class="inner3"><br><br>

                <div class="table-wrapper">
                    <table style="border: 1px;  text-align: center;  ">
                        <tr class="tHead" >

                            <th style="text-align: center; vertical-align : middle;" >멘티 학번</th>
                            <th style="text-align: center; vertical-align : middle;" >멘토링 시작 일</th>



                        </tr>
                        <c:forEach var="list2" items="${list2}">
                            <tr style="height: 70px;">

                                <td style="vertical-align: middle;" >${list2.userStudentNum}</td>
                                <td style="vertical-align : middle" class="title">${list2.startDate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="col-12" style="text-align: center;">

                        <a href='javascript:self.close();' class="button primary">닫기</a>

                    </div>
                </div>

            <br><br>
        </div>
    </section>


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
