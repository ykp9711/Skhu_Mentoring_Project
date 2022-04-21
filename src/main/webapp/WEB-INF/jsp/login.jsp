
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

    <script type="text/javascript">

        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.userId.value)
            {
                alert("아이디를 입력하세요");
                inputForm.userId.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");
                inputForm.password.focus();
                return false;
            }
        }

        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="signUp.jsp";
        }
    </script>

</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="header.jsp" %>

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>Login</h1>
        </header>
        <div class="inner2"><br><br>

            <form name="loginInfo" method="post" onsubmit="return checkValue()" >

                <div class="row gtr-uniform">


                    <div class="col-12">
                        <input type="text" name="userId" id="userId" value="" placeholder="ID" />
                    </div>
                    <div class="col-12">
                        <input type="password" name="password" id="password" value="" placeholder="password" />
                    </div>
                    <div class="col-12" style="text-align: center;">

                        <input type="submit" class="button primary" value="로그인">


                    </div>
                    <div class="col-12">${msg}</div>
                    <!-- Break -->

                </div>
            </form>
            <br><br>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
            <section>
                <h3>Nullam sed gravida</h3>
                <p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus sed magna gravida non.</p>
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
                <p>Sed vulputate sem tristique cursus sed magna gravida non lorem ipsum dolor sit amet.<p>
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
