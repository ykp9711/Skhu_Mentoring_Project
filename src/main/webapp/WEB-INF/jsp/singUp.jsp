<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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

				<%@include file ="header.jsp" %>

				<!-- Section -->
					<section id="one" class="main alt">
						<header class="accent1">
							<h1>회원가입</h1>
						</header>
						<div class="inner2"><br><br>
							
						<form method="post" action="#" >
							<div class="row gtr-uniform">
								<div class="col-12">
									<input type="text" name="ID" id="iD" value="" placeholder="ID" />
								</div>
                                <div class="col-12">
									<input type="password" name="password" id="password" value="" placeholder="비밀번호" />
								</div>
								<div class="col-12">
									<input type="password" name="conPassword" id="conPassword" value="" placeholder="비밀번호 확인"/>
								</div>
                                <div class="col-12">
									<input type="text" name="name" id="name" value="" placeholder="이름" />
								</div>
                                <div class="col-12">
									<input type="email" name="email" id="email" value="" placeholder="이메일" />
								</div>
                                <div class="col-8 col-12-small">
                                    <input type="text" name="num" id="num" value="" placeholder="이메일 인증번호">
                                </div>
                                <div class="col-4 col-12-small">
                                    <input type="button" value="인증" class="button primary fit" >
                                </div>
                                <div class="col-12">
									<select name="department">
                                        <option value=" " selected>학부를 선택하세요.</option>
                                        <option value="IT융합자율학부">IT융합자율학부</option>
                                        <option value="사회융합자율학부">사회융합자율학부</option>
                                        <option value="인문융합자율학부">인문융합자율학부</option>
										<option value="미디어콘텐츠융합자율학부">미디어콘텐츠융합자율학부</option>
                                    </select>
								</div>
                                <div class="col-12">
									<input type="text" name="studentID" id="studentID" value="" placeholder="학번" />
								</div>

								<form method="post" action="#">
									<div class="col-6" style="text-align: center;">

										<a href="login.html" class="button primary fit">가입하기</a>

									</div>
								</form>
								<div class="col-6" style="text-align: center;">

										<a href="singUp.html" class="button fit">취소하기</a>

							    </div>
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