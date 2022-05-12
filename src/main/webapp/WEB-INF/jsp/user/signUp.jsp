<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
				<%@include file ="../header.jsp" %>

				<!-- Section -->
					<section id="one" class="main alt">
						<header class="accent1">
							<h1>회원가입</h1>
						</header>
						<div class="inner2"><br><br>

                            <%--@elvariable id="user" type="com.skhuMentoring.dto.User"--%>
						<form:form method="post" action="/signUp" modelAttribute="user" id="signUpForm">
							<div class="row gtr-uniform">
								<div class="col-12">
									<form:input type="text" path="userId" id="id_input" value="" placeholder="ID" />
								</div>
							</div>
							<p id="Check_id" style="height: 1px; color: #13a2dd; text-align: center;"></p>
							<div class="row gtr-uniform">
                                <div class="col-12">
									<form:input type="password" path="userPw" id="userPw" value="" placeholder="비밀번호" />
									<p id="Check_pw" style="height: 1px; color: #13a2dd; text-align: center;"></p>
								</div>

								<div class="col-12">
									<input type="password" name="conPw" id="conPw" value="" placeholder="비밀번호 확인"/>
								</div>
							</div>
							<p id="Check_conPw" style="height: 1px; color: #13a2dd; text-align: center;"></p>
							<div class="row gtr-uniform">
                                <div class="col-12">
									<form:input type="text" path="userName" id="name" value="" placeholder="이름" />
								</div>
								<div class="col-12">
									<form:select path="department" name="department">
										<form:option value="0" label="학과를 선택하세요" />
										<form:options items="${ departments }" itemLabel="department" itemValue="department" />
									</form:select>
								</div>
								<div class="col-12">
									<form:input type="text" path="userStudentNum" id="userStudentNum" value="" placeholder="학번" />
								</div>
								<div class="col-12">
									<form:input type="text" path="userPhoneNum" id="phone" value="" placeholder="휴대폰 번호" />
								</div>
								<div class="col-6">
									<form:input type="email" path="userEmail" id="userEmail" value="" placeholder="이메일" />
								</div>
								<div class="col-6">
									<input type="email" id="userEmail" value="@naver.com" readonly />
								</div>
								<div class="col-12">
									<input type="button" value="이메일 인증" class="button primary fit" id="auth_btn">
									<p id="sendEmail_msg" style="height: 2px; color: #13a2dd; text-align: center;" ></p>
								</div>
								<div class="col-12">
                                    <input type="text" name="num" id="auth_input" value="" placeholder="인증번호">
									<p id="check_auth" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
                                </div>
								&nbsp;
								<div class="col-12" style="text-align: center;">
									<ul class="actions fit">
										<li><input type="button" value="가입하기" class="button primary fit" id="signUp_btn" ></li>
									    <li><input type="reset" value="취소하기" class="button fit"></li>
									</ul>
									<p id="checking" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
								</div>


								<!-- Break -->
								
							</div>
						</form:form>
						<br><br>
					</div>
					</section>

				<!-- Footer -->
				<%@include file ="../footer.jsp" %>

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



		<script>

			$('#id_input').on("property-change change keyup paste input", function(){
				console.log("들어옴")
				var id = $('#id_input').val(); // #id_input에 입력되는 값
				var data = {id : id} // '컨트롤에 넘길 데이터 이름' : '데이터(#id_input에 입력되는 값)'
				$.ajax({ type : "get",
					url : "/checkId",
					data : data,
					success : function(result){
						$("#Check_id").text("사용 가능한 아이디입니다." );
						$("#signUp_btn").attr('disabled', false);

						if(result == 'fail'){
							$("#Check_id").text("이미 사용 중인 아이디입니다.");
							$("#signUp_btn").attr('disabled', true);
						}
					}
				});// success 종료
			}); // ajax 종료


			//비밀번호와 비밀번호 확인 일치 여부
			$('#conPw').on("property-change change keyup paste input", function(){
				var userPw = $("#userPw").val();
				var conPw = $("#conPw").val();

					if(userPw != conPw){
						$("#Check_conPw").text("비밀번호가 다릅니다.");
						$("#signUp_btn").attr('disabled', true);
					}
					else if(userPw != " " || conPw != " "){
						$("#signUp_btn").attr('disabled', false);
						$("#Check_conPw").text(" ");
						}
						else {
						$("#signUp_btn").attr('disabled', false);
						$("#Check_conPw").text(" ");

				}
			})

			//비밀번호 양식
			$("#userPw").on("property-change change keyup paste input", function(){
				var userPw = $("#userPw").val();

				function isPassword(asValue) {
					var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

					return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
				}

				if(!isPassword(userPw) ||userPw.length < 8 || userPw.length > 16 ){
					$("#Check_pw").text("*특수문자/영문/숫자를 포함하여 8~16자");
					$("#signUp_btn").attr('disabled', true);
				} else{
					$("#Check_pw").text("비밀번호가 적합합니다.");
					$("#signUp_btn").attr('disabled', false);
				}

			})




			// 빈 칸이 있는지 확인
			$(document).ready(function (e) {

				$("#signUp_btn").click(function () {

					const name = $("#name").val().replaceAll(" ", "");
					const email = $("#userEmail").val().replaceAll(" ", "");
					const phone = $("#phone").val().replaceAll(" ", "");
					const studentNum = $("#userStudentNum").val().replaceAll(" ", "");
					const userPw = $("#userPw").val().replaceAll(" ", "");
					const conPw = $("#conPw").val().replaceAll(" ", "");
					const id_input = $("#id_input").val().replaceAll(" ", "");
					const auth_input = $("#auth_input").val().replaceAll(" ", "");

					if (!id_input) {
						$("#checking").text("ID를 입력하세요.");
					} else if (!userPw) {
						$("#checking").text("비밀번호를 입력하세요.");
					} else if (!conPw) {
						$("#checking").text("비밀번호 확인을 입력하세요.");
					} else if (!name) {
						$("#checking").text("이름을 입력하세요.");
					} else if (!phone) {
						$("#checking").text("휴대폰 번호를 입력하세요.");
					} else if (!email) {
						$("#checking").text("이메일을 입력하세요.");
					} else if (!studentNum) {
						$("#checking").text("학번을 입력하세요.");
					} else if (!auth_input) {
						$("#checking").text("이메일 인증이 필요합니다.");
					} else {
						$("#signUpForm").submit();
					}

				})
			})


			// 이메일로 인증번호 전송, 인증번호 일치 확인
			$("#auth_btn").click(function (){
				var email = $("#userEmail").val();
				var data = {email : email};
				var authKey;

				$("#sendEmail_msg").text("이메일을 전송하였습니다.");

				$.ajax({ type : "get",
					url : "/sendMail",
					data : data,
					async : false,
					success : function (data){
					console.log(data);
						authKey = data;
					}
				});

				$('#auth_input').on("property-change change keyup paste input", function(){
					console.log("들어옴");
					if(authKey == $('#auth_input').val()){
						$("#check_auth").text("인증 확인");
						$("#signUp_btn").attr('disabled', false);
					} else {
						$("#check_auth").text("인증번호가 일치하지 않습니다.");
						$("#signUp_btn").attr('disabled', true);
					}
				})

			})



		</script>

	</body>
</html>
