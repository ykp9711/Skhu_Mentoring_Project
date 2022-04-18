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
    <title>멘토 현황</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="header.jsp" %>

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>Mento Status</h1>
        </header>
        <div class="inner3"><br><br>



            <div class="table-wrapper">
                <table style="border: 1px;  text-align: center;  ">
                    <tr class="tHead" >
                        <th style="text-align: center; vertical-align : middle;" >글 번호</th>
                        <th  style="text-align: center; vertical-align : middle;">멘토 이름</th>
                        <th style="text-align: center; vertical-align : middle;" class="mentorNumber">학번</th>
                        <th style="text-align: center; vertical-align : middle;" class="department">학부/학과</th>
                        <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                        <th style="text-align: center; vertical-align : middle;" class="time">멘토링 시간</th>
                        <th style="text-align: center; vertical-align : middle;" class="time"></th>

                    </tr>

                    <tr style="height: 70px;">
                        <td style="vertical-align : middle">1</td>
                        <td style="vertical-align : middle">양경필</td>
                        <td style="vertical-align: middle;" >201632013</td>
                        <td style="vertical-align : middle" class="title">IT융합자율학부</td>
                        <td style="vertical-align : middle" class="kind">토익</td>
                        <td style="vertical-align : middle" class="area" >목,금</td>
                        <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청</a></td>
                    </tr>

                    <tr style="height: 70px;">
                        <td style="vertical-align : middle">2</td>
                        <td style="vertical-align : middle">안대성</td>
                        <td style="vertical-align: middle;" >201911031</td>
                        <td style="vertical-align : middle" class="title">IT융합자율학부</td>
                        <td style="vertical-align : middle" class="kind">자바</td>
                        <td style="vertical-align : middle" class="area" >주 2회</td>
                        <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청</a></td>
                    </tr>

                    <tr style="height: 70px;">
                        <td style="vertical-align : middle">3</td>
                        <td style="vertical-align : middle">육정근</td>
                        <td style="vertical-align: middle;" >201632015</td>
                        <td style="vertical-align : middle" class="title">IT융합자율학부</td>
                        <td style="vertical-align : middle" class="kind">알고리즘</td>
                        <td style="vertical-align : middle" class="area" >주 1회</td>
                        <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청</a></td>
                    </tr>

                    <tr style="height: 70px;">
                        <td style="vertical-align : middle">4</td>
                        <td style="vertical-align : middle">김윤진</td>
                        <td style="vertical-align: middle;" >201914030</td>
                        <td style="vertical-align : middle" class="title">IT융합자율학부</td>
                        <td style="vertical-align : middle" class="kind">파이썬</td>
                        <td style="vertical-align : middle" class="area" >주 4시간</td>
                        <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청</a></td>
                    </tr>



                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="big-width" style="text-align: center">
                <a class="button small">&lt</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="button small">&gt;</a>
            </div>
            <br>



            <form id="searchForm">
                <div style="width: 100%; float: left;">

                    <select name="type" style="width: 18%; float: left;">
                        <option>검색 종류</option>
                        <option>전체</option>
                        <option>과목</option>
                        <option>멘토 이름</option>
                        <option>태그</option>
                    </select><a class="button primary" style="width: 15%; float: right;">검색</a>
                    <input type="text" id="keyword" name="keyword" placeholder="검색 종류를 선택 후 검색해주세요" style="width: 66%; float: center;" />


                </div>
            </form>
            <br><br>

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