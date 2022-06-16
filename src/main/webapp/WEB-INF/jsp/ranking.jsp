<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>SKHU MENTORING RANKING</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/assets/css/main.css"/>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <%@include file="header.jsp" %>

    <!-- Section -->
    <section id="one" class="main">
        <header class="accent1">
            <h2>SKHU Mentoring Ranking</h2>

        </header>
        <ul class="tabs">
            <li>
                <h3><span class="extra">1위</span></h3>
                <div class="spotlight">
                    <ul>
                        <li>
                            <h4>이름/닉네임</h4>
                            <p>${one.nickName}</p>
                        </li>
                        <li>
                            <h4>자신있는 멘토링</h4>
                            <p>${one.mainSubject}</p>
                        </li>
                    </ul>
                    <span class="image"><img src="/images/${one.imgName}" alt="" />
                        <br>
                    <span><p style="text-align: center">이름 : ${one.userName}</p>
                    <p style="text-align: center">학번 : ${one.userStudentNum}</p>
                    </span>

                    </span>
                    <ul>
                        <li>
                            <h4>멘토의 한마디</h4>
                            <p>${one.oneWord}</p>
                        </li>
                        <li>
                            <h4>멘토와 연락할 수 있는 방법</h4>
                            <p>${one.sns}</p>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <h3><span class="extra">2위</span></h3>
                <div class="spotlight">
                    <ul>
                        <li>
                            <h4>이름/닉네임</h4>
                            <p>${two.nickName}</p>
                        </li>
                        <li>
                            <h4>자신있는 멘토링</h4>
                            <p>${two.mainSubject}</p>
                        </li>
                    </ul>
                    <span class="image"><img src="/images/${two.imgName}" alt="" />
                    <br>
                    <span><p style="text-align: center">이름 : ${two.userName}</p>
                    <p style="text-align: center">학번 : ${two.userStudentNum}</p>
                    </span>
                        </span>
                    <ul>
                        <li>
                            <h4>멘토의 한마디</h4>
                            <p>${two.oneWord}</p>
                        </li>
                        <li>
                            <h4>멘토와 연락할 수 있는 방법</h4>
                            <p>${two.sns}</p>
                        </li>
                    </ul>
                </div>
            </li>            <li>
            <h3><span class="extra">3위</span></h3>
            <div class="spotlight">
                <ul>
                    <li>
                        <h4>이름/닉네임</h4>
                        <p>${three.nickName}</p>
                    </li>
                    <li>
                        <h4>자신있는 멘토링</h4>
                        <p>${three.mainSubject}</p>
                    </li>
                </ul>
                <span class="image"><img src="/images/${three.imgName}" alt="" />
                <br>
                <span><p style="text-align: center">이름 : ${three.userName}</p>
                    <p style="text-align: center">학번 : ${three.userStudentNum}</p>
                    </span>
                    </span>
                <ul>
                    <li>
                        <h4>멘토의 한마디</h4>
                        <p>${three.oneWord}</p>
                    </li>
                    <li>
                        <h4>멘토와 연락할 수 있는 방법</h4>
                        <p>${three.sns}</p>
                    </li>
                </ul>
            </div>
        </li>
        </ul>


        <div class="inner">
            <div class="col-12">
                <!-- Table -->
                <div class="table-wrapper">
                    <table style="border: 1px;  text-align: center;">
                        <tr class="thead">
                            <th style="text-align: center;">순위</th>
                            <th style="text-align: center;">이름</th>
                            <th style="text-align: center;">학번</th>
                            <th style="text-align: center;">학부/학과</th>
                        </tr>
                        <c:forEach var="all" items="${all}" varStatus="status">
                        <tr style="height: 70px;">
                            <td><c:out value="${status.count +3}"/></td>
                            <td>${all.userName}</td>
                            <td>${all.userStudentNum}</td>
                            <td>${all.department}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>

    </section>


<!-- Footer -->
    <%@include file ="footer.jsp" %>

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