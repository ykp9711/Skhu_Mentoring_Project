<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>

<head>
    <title>SKHU MENTORING</title>
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
    <section id="banner">
        <div class="content primary" style="background-color: #23b1ec;">

            <div >
                <header>
                    <h1 style="color:white">성공회대학교 멘토링 시스템<br />
                    </h1>
                    <p>멘토와 멘티를 찾아보세요</p>
                </header>
            </div>

        </div>

        <!--slide-->
        <div class="content secondary">
            <div class="slick-slider">
                <c:forEach var="mentor" items="${mentor}">
                    <div>
                        <blockquote style="padding: 0.5rem 2rem 0.5rem 2rem;">
                            <a href="/status/detailMentor?bno=${mentor.bno}&mentorId=${mentor.userId}&pathIndex=true" onclick="window.open(this.href,'Detail','width=500px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank">
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