
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
    <title>Login</title>
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
            <h1>SKHU Mentoring</h1>
        </header>
        <div class="inner2"><br><br>

            <form method="post" action="">
                <div class="row gtr-uniform">
                    <div class="col-12">
                        <input type="text" name="userId" id="userId" value="" placeholder="ID" />
                    </div>
                    <div class="col-12">
                        <input type="password" name="userPw" id="userPw" value="" placeholder="PASSWORD" />
                    </div>
                    <div class="col-12" style="text-align: center;">
                        <button type="submit">로그인</button>&nbsp;
                        <a href="singUp" class="button">회원가입</a>
                    </div>

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