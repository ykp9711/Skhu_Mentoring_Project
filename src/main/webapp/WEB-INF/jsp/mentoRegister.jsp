<%@ page language="java" contentType="text/html; charset=UTF-8"	 pageEncoding="UTF-8"%>
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

				<!-- Header -->
				<%@include file ="header.jsp" %>


				<!-- Section -->
					<section id="one" class="main alt">
						<header class="accent1">
							<h1>멘토 등록</h1>
						</header>
						<div class="inner2"><br><br>
							
						<form method="post" action="#">
							<div class="row gtr-uniform">
								
								
								<form method="post" action="#">
									<div class="row gtr-uniform">
										<div class="col-12">
											<input type="text" name="name" id="name" value="" placeholder="이름">
										</div>
										<div class="col-12">
											<input type="text" name="studentId" id="studentId" value="" placeholder="학번">
										</div>
										<div class="col-12">
											<select name="department" id="department">
												<option value="">학부</option>
												<option value="1">IT융합자율학부</option>
												<option value="1">인문융합자율학부</option>
												<option value="1">사회융합자율학부</option>
												<option value="1">미디어콘텐츠융합자율학부</option>
											</select>
										</div>
										<div class="col-12">
											<input type="text" list="subject" placeholder="희망 강의 과목"/>
											<datalist name="subject" id="subject">
												<option value="">희망수강과목</option>
												<option value="java">자바</option>
												<option value="python">파이썬</option>
												<option value="algorithm">알고리즘</option>
												<option value="1">기타</option>
											</datalist>
										</div>
										<div class="col-12" style="text-align: center;">
											<label>예정 시작 날짜 &nbsp;
											<input type="date" name="startDate" id="startDate"  placeholder="예정시작일">
										</label>
										</div>
										<div class="col-12" style="text-align: center;">
											<label>예정 종료 날짜 &nbsp;
											<input type="date" name="endDate" id="endDate">
										</label>
										<div class="col-12">
											<input type="text" name="day" id="day" value="" placeholder="진행가능한 요일을 적어주세요 ex)월, 화">
										</div>
										</div>
										<div class="col-12">
											<textarea name="demo-message" id="demo-message" placeholder="간단한 자기소개 및 수업 진행 세부계획을 작성해주세요." rows="6"></textarea>
										</div>
										<!-- Break -->
										<div class="col-12" style="text-align: center;">
											<ul class="actions">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<li><input type="submit" value="등록" class="primary"></li>
												<li><input type="reset" value="초기화"></li>
											</ul>
										</div>
									</div>
								</form>

								</div>
								<!-- Break -->
								
							</div>
						</section>
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