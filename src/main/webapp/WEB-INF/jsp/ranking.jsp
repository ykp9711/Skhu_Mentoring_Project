<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>Untitled</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <%@include file="header.jsp" %>

    <!-- Section -->
    <section id="one" class="main">
        <header class="accent1">
            <h2>SKHU Mentoring Ranking</h2>
            <form method="post" action="#">
                <div class="row gtr-uniform">
                    <div class="col-6 off-3">
                        <select name="MentoCategory" id="MentoCategory">
                            <option value="0">전체</option>
                            <option value="1">JAVA</option>
                            <option value="2">알고리즘</option>
                            <option value="3">C언어</option>
                            <option value="4">Python</option>
                        </select>
                    </div>
                </div>
            </form>
        </header>
        <ul class="tabs">
            <li>
                <h3><span class="extra">1위</span></h3>
                <div class="spotlight">
                    <ul>
                        <li>
                            <h4>경력</h4>
                            <p>자바멘토링 N회 토익멘토링 N회</p>
                        </li>
                        <li>
                            <h4>소개</h4>
                            <p>A+밖에 모르는 사나이 양경필</p>
                        </li>
                    </ul>
                    <span class="image"><img src="images/pic01.jpg" alt="" /></span>
                    <ul>
                        <li>
                            <h4>멘토의 한마디</h4>
                            <p>공부를 잘 하고 싶으면 나에게 오라</p>
                        </li>
                        <li>
                            <h4>멘토와 연락할 수 있는 방법</h4>
                            <p>카카오톡 ID : qwe123 <br> 인스타그램 ID : qwe_11</p>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <h3><span class="extra">2위</span></h3>
                <div class="spotlight">
                    <ul>
                        <li>
                            <h4>경력</h4>
                            <p>Praesent dapibus, neque id cursus fauci quam erat volutpat nam dui mitin.</p>
                        </li>
                        <li>
                            <h4>소개</h4>
                            <p>Sed adipiscing ornare risus. Morbi lorem lentesque egestas sem consequat.</p>
                        </li>
                    </ul>
                    <span class="image"><img src="images/pic02.jpg" alt="" /></span>
                    <ul>
                        <li>
                            <h4>멘토의 한마디</h4>
                            <p>Donec nec justo eget felis facilisis ferme Aenean dignissim pellen.</p>
                        </li>
                        <li>
                            <h4>멘토와 연락할 수 있는 방법</h4>
                            <p>Lorem in sem quis dui placerat ornare tra sed etiam veroeros consequat.</p>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <h3><span class="extra">3위</span></h3>
                <div class="spotlight">
                    <ul>
                        <li>
                            <h4>경력</h4>
                            <p>Sed adipiscing ornare risus. Morbi lorem lentesque egestas sem consequat.</p>
                        </li>
                        <li>
                            <h4>소개</h4>
                            <p>Donec nec justo eget felis facilisis ferme Aenean dignissim pellen.</p>
                        </li>
                    </ul>
                    <span class="image"><img src="images/pic03.jpg" alt="" /></span>
                    <ul>
                        <li>
                            <h4>맨토의 한마디</h4>
                            <p>Lorem in sem quis dui placerat ornare tra sed etiam veroeros consequat.</p>
                        </li>
                        <li>
                            <h4>멘토와 연락할 수 있는 방법</h4>
                            <p>Praesent dapibus, neque id cursus fauci quam erat volutpat nam dui mitin.</p>
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
                            <th style="text-align: center;">멘토링 횟수</th>
                        </tr>
                        <tr style="height: 70px;">
                            <td>4</td>
                            <td>양경필</td>
                            <td>201632013</td>
                            <td>IT융합자율학부</td>
                            <td>3</td>
                        </tr>
                        <tr style="height: 70px;">
                            <td>5</td>
                            <td>안대성</td>
                            <td>201911031</td>
                            <td>IT융합자율학부</td>
                            <td>2</td>
                        </tr>
                        <tr style="height: 70px;">
                            <td>6</td>
                            <td>육정근</td>
                            <td>201632015</td>
                            <td>IT융합자율학부</td>
                            <td>1</td>
                        </tr>
                    </table>
                </div>
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
            </div>
    </section>


<!-- Footer -->
<footer id="footer">
    <div class="inner">
        <section>
            <h3>Nullam sed gravida</h3>
            <p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem
                tristique cursus sed magna gravida non.</p>
            <ul class="icons">
                <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
            </ul>
        </section>
        <section class="narrow">
            <h4>Lorem aliquam</h4>
            <ul class="links">
                <li><a href="#">Ultrices nulla</a></li>
                <li><a href="#">Quis lectus donec</a></li>
                <li><a href="#">Magna ligula</a></li>
                <li><a href="#">Sed etiam tristique</a></li>
                <li><a href="#">Cursus magna</a></li>
                <li><a href="#">Gravida dolore</a></li>
            </ul>
        </section>
        <section class="narrow">
            <h4>Magna tempus</h4>
            <ul class="links">
                <li><a href="#">Feugiat ligula</a></li>
                <li><a href="#">Vulputate tristique</a></li>
                <li><a href="#">Ultrices nulla</a></li>
                <li><a href="#">Cursus sed magna</a></li>
                <li><a href="#">Sed lectus donec</a></li>
            </ul>
        </section>
        <section>
            <h3>Morbi sed volutpat</h3>
            <p>Sed vulputate sem tristique cursus sed magna gravida non lorem ipsum dolor sit amet.
            <p>
            <p><a href="#" class="major">(000) 000-0000</a></p>
        </section>
    </div>
    <div class="copyright">
        <p>&copy; Untitled. All rights reserved.</p>
    </div>
</footer>

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