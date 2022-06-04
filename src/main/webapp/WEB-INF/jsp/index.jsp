<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<style>
    * {margin:0;padding:0;}
    .section input[id*="slide"] {display:none;}
    .section .slidewrap {max-width:3000px;margin:0 auto;}
    .section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
    .section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
    .section .slidelist > li > a {display:block;position:relative;}
    .section .slidelist > li > a img {width:100%;}
    .section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
    .section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
    .section .slidelist .textbox h3 {font-size:36px;color:#fff;;transform:translateY(30px);transition:all .5s;}
    .section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}

    /* input에 체크되면 슬라이드 효과 */
    .section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
    .section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
    .section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
    .section input[id="slide04"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
    .section input[id="slide05"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
    .section input[id="slide06"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
    .section input[id="slide07"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
    .section input[id="slide08"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
    .section input[id="slide09"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
    .section input[id="slide10"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
    .section input[id="slide11"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
    .section input[id="slide12"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

    /* input에 체크되면 텍스트 효과 */
    .section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide04"]:checked ~ .slidewrap li:nth-child(4) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide04"]:checked ~ .slidewrap li:nth-child(4) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide05"]:checked ~ .slidewrap li:nth-child(5) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide05"]:checked ~ .slidewrap li:nth-child(5) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide06"]:checked ~ .slidewrap li:nth-child(6) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide06"]:checked ~ .slidewrap li:nth-child(6) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide07"]:checked ~ .slidewrap li:nth-child(7) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide07"]:checked ~ .slidewrap li:nth-child(7) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide08"]:checked ~ .slidewrap li:nth-child(8) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide08"]:checked ~ .slidewrap li:nth-child(8) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide09"]:checked ~ .slidewrap li:nth-child(9) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide09"]:checked ~ .slidewrap li:nth-child(9) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide10"]:checked ~ .slidewrap li:nth-child(10) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide10"]:checked ~ .slidewrap li:nth-child(10) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide11"]:checked ~ .slidewrap li:nth-child(11) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide11"]:checked ~ .slidewrap li:nth-child(11) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
    .section input[id="slide12"]:checked ~ .slidewrap li:nth-child(12) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
    .section input[id="slide12"]:checked ~ .slidewrap li:nth-child(12) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}


    /* 좌,우 슬라이드 버튼 */
    .slide-control > div {display:none;}
    .section .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
    .section .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
    .section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
    .section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
    .section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}
    .section input[id="slide04"]:checked ~ .slidewrap .slide-control > div:nth-child(4) {display:block;}
    .section input[id="slide05"]:checked ~ .slidewrap .slide-control > div:nth-child(5) {display:block;}
    .section input[id="slide06"]:checked ~ .slidewrap .slide-control > div:nth-child(6) {display:block;}
    .section input[id="slide07"]:checked ~ .slidewrap .slide-control > div:nth-child(7) {display:block;}
    .section input[id="slide08"]:checked ~ .slidewrap .slide-control > div:nth-child(8) {display:block;}
    .section input[id="slide09"]:checked ~ .slidewrap .slide-control > div:nth-child(9) {display:block;}
    .section input[id="slide10"]:checked ~ .slidewrap .slide-control > div:nth-child(10) {display:block;}
    .section input[id="slide11"]:checked ~ .slidewrap .slide-control > div:nth-child(11) {display:block;}
    .section input[id="slide12"]:checked ~ .slidewrap .slide-control > div:nth-child(12) {display:block;}


    /* 페이징 */
    .slide-pagelist {text-align:center;padding:20px;}
    .slide-pagelist > li {display:inline-block;vertical-align:middle;}
    .slide-pagelist > li > label {display:block;padding:1rem 1rem;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
    .section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
    .section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
    .section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}
    .section input[id="slide04"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(4) > label {background:#999;}
    .section input[id="slide05"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(5) > label {background:#999;}
    .section input[id="slide06"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(6) > label {background:#999;}
    .section input[id="slide07"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(7) > label {background:#999;}
    .section input[id="slide08"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(8) > label {background:#999;}
    .section input[id="slide09"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(9) > label {background:#999;}
    .section input[id="slide10"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(10) > label {background:#999;}
    .section input[id="slide11"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(11) > label {background:#999;}
    .section input[id="slide12"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(12) > label {background:#999;}
</style>
<head>
    <title>Untitled</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="header.jsp" %>

    <!-- Banner -->
    <!-- Banner -->
    <section id="banner">
        <div class="content primary" >

            <div style="width: 60%;  float: left;">
                <header>
                    <h1>성공회대학교 멘토링 시스템<br />
                    </h1>
                    <p>멘토와 멘티를 찾아보세요</p>

                </header>
            </div>
            <div style="width: 30%; float: left;">

                <div class="col-6 col-12-small">

                    <h2>멘토 순위</h2><br>
                    <label>육정근</label>
                    <label>육정근</label>
                    <label>육정근</label>
                    <label>육정근</label>




                </div>


            </div>
        </div><br><br><br><br><br><br><br><br>

        <!--slide-->
        <div class="content secondary">
            <div class="slick-slider">
                <c:forEach var="mentor" items="${mentor}">
                    <div>
                        <blockquote style="padding: 0.5rem 2rem 0.5rem 2rem;">
                            <a href="/status/mentorStatus">
                                <h3 style="color: #13a2dd">Mentor</h3> <h4>${mentor.userName}</h4>
                                <div><b>${mentor.subjectName}</b></div>
                                <div>
                                    <b><fmt:formatDate value="${mentor.startDate}" pattern="yyyy-MM-dd"/></b> / <b>${mentor.hopeDay}</b></div>
                                <div>정원: <b>${mentor.maxPersonnel}</b></div>
                            </a>
                        </blockquote>
                    </div>
                </c:forEach>
                <c:if test="${empty mentor}">
                    <blockquote>
                        <div>
                            멘토가 없습니다
                        </div>
                    </blockquote>
                    <blockquote>
                        <div>
                            멘토가 없습니다
                        </div>
                    </blockquote>
                    <blockquote>
                        <div>
                            멘토가 없습니다
                        </div>
                    </blockquote>
                    <blockquote>
                        <div>
                            멘토가 없습니다
                        </div>
                    </blockquote>
                    <blockquote>
                        <div>
                            멘토가 없습니다
                        </div>
                    </blockquote>
                </c:if>
            </div>
            <br>
        </div>
    </section>

    <!-- Section -->
    <section id="one" class="main">
        <header class="accent1">
            <h2>SKHU Mentoring Ranking</h2>
            <p>성공회대학교 멘토링을 빛내주신 멘토</p>
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
                            <h4>멘토와 연락 할 수 있는 방법</h4>
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
                            <h4>Erat aliquam</h4>
                            <p>Praesent dapibus, neque id cursus fauci quam erat volutpat nam dui mitin.</p>
                        </li>
                        <li>
                            <h4>Neque veroeros</h4>
                            <p>Sed adipiscing ornare risus. Morbi lorem lentesque egestas sem consequat.</p>
                        </li>
                    </ul>
                    <span class="image"><img src="images/pic02.jpg" alt="" /></span>
                    <ul>
                        <li>
                            <h4>Quis portitor</h4>
                            <p>Donec nec justo eget felis facilisis ferme Aenean dignissim pellen.</p>
                        </li>
                        <li>
                            <h4>Magna accumsan</h4>
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
                            <h4>Neque veroeros</h4>
                            <p>Sed adipiscing ornare risus. Morbi lorem lentesque egestas sem consequat.</p>
                        </li>
                        <li>
                            <h4>Quis portitor</h4>
                            <p>Donec nec justo eget felis facilisis ferme Aenean dignissim pellen.</p>
                        </li>
                    </ul>
                    <span class="image"><img src="images/pic03.jpg" alt="" /></span>
                    <ul>
                        <li>
                            <h4>Magna accumsan</h4>
                            <p>Lorem in sem quis dui placerat ornare tra sed etiam veroeros consequat.</p>
                        </li>
                        <li>
                            <h4>Erat aliquam</h4>
                            <p>Praesent dapibus, neque id cursus fauci quam erat volutpat nam dui mitin.</p>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
    $('.slick-slider').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 4800,
        pauseOnHover:true,
        arrows: false
        // dots: true
    });
</script>
</body>
</html>