<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<<<<<<< HEAD
<head>
	<title>MentorRegister</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/assets/css/main.css" />
</head>
<body class="is-preload">
<c:if test="${empty sessionId}">
	<script>
		alert("잘못된 접근경로 입니다.로그인해주세요");
		location.href="/login";
	</script>
</c:if>

<!-- Wrapper -->
<div id="wrapper">

	<!-- Header -->
	<%@include file ="../header.jsp" %>


	<!-- Section -->
	<section id="one" class="main alt">
		<header class="accent1">
			<h1>멘토 등록</h1>
		</header>
		<div class="inner2"><br><br>


			<%--@elvariable id="mentor" type="com.skhuMentoring.dto.Mentor"--%>
			<form:form modelAttribute="mentor" method="post" name="form">
			<div class="row gtr-uniform">
				<div class="row gtr-uniform">
					<div class="col-12">
						<form:input path="userName" value="${user.userName}" placeholder="이름" readonly="true" />
					</div>
					<div class="col-12">
						<form:input path="userStudentNum" value="${user.userStudentNum}"  readonly="true"/>
					</div>
					<div class="col-12">
						<input type="text" name ="department" readonly value="${user.department}">
					</div>
					<div class="col-12">

						<form:input path="subjectName" id="subjectInput" list="subject" placeholder="희망 강의 과목" value="${list.subjectName}"/>
						<datalist name="subject" id="subject">
							<form:select path="subject" >
							<form:option value="기타" label="0" />
							<form:options  itemValue="subjectName" itemLabel="sno"  items="${ subject }"  />
						</datalist>
						</form:select>
=======
	<head>
		<title>MentorRegister</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
	</head>
	<body class="is-preload">
	<c:if test="${empty sessionId}">
		<script>
			alert("잘못된 접근경로 입니다.로그인해주세요");
			location.href="/login";
		</script>
	</c:if>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
				<%@include file ="../header.jsp" %>


				<!-- Section -->
					<section id="one" class="main alt">
						<header class="accent1">
							<h1>멘토 등록</h1>
						</header>
						<div class="inner2"><br><br>


                            <%--@elvariable id="mentor" type="com.skhuMentoring.dto.Mentor"--%>
							<form:form modelAttribute="mentor" method="post">
							<div class="row gtr-uniform">
									<div class="row gtr-uniform">
										<div class="col-12">
											<form:input path="userName" value="${user.userName}" placeholder="이름" readonly="true" />
										</div>
										<div class="col-12">
											<form:input path="userStudentNum" value="${user.userStudentNum}"  readonly="true"/>
										</div>
										<div class="col-12">
											<input type="text" name ="department" readonly value="${user.department}">
										</div>
										<div class="col-12">

											<form:input path="subjectName" id="subjectInput" list="subject" placeholder="희망 강의 과목" value="${list.subjectName}"/>
											<datalist name="subject" id="subject">
												<form:select path="subject" >
													<form:option value="기타" label="0" />
												<form:options  itemValue="subjectName" itemLabel="sno"  items="${ subject }"  />
											</datalist>
												</form:select>
										</div>

										<c:if test="${empty list}">
										<div class="col-12">
											<form:input path="addSubject" id="addSubject" placeholder="강의를 입력해주세요."/>
											<p id="Check_Subject" style="height: 1px; display: none;"></p>
										</div>
										</c:if>
										<div class="col-12">
											<select name="MaxPersonnel">
												<option value="0" label="정원을 선택해주세요" />
												<option value="1" label="1명" />
												<option value="2" label="2명" />
												<option value="3" label="3명" />
												<option value="4" label="4명" />
												<option value="5" label="5명" />
												<option value="6" label="6명" />
												<option value="7" label="7명" />
												<option value="8" label="8명" />
												<option value="9" label="9명" />
												<option value="10" label="10명" />
											</select>

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
											<form:input path="hopeDay" id="hopeDay" placeholder="진행가능한 요일을 적어주세요 ex)월, 화"/>
										</div>
										</div>
										<div class="col-12">
											<form:textarea path="introduce" id="introduce" placeholder="간단한 자기소개 및 수업 진행 세부계획을 작성해주세요." rows="6"/>
											<div id="introduce_cnt">(0 / 1000)</div>
										</div>
										<c:if test="${not empty menteeStudentNum}">
										<div class="col-12">
											<p>신청한 멘티</p>
											<form:input path="menteeStudentNum" id="menteeStudentNum" value="${menteeStudentNum}"/>
										</div>
										</c:if>

										<!-- Break -->
										<div class="col-12" style="text-align: center;">
											<ul class="actions">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<li><input type="submit" value="등록" class="primary" id="btn"></li>
												<li><input type="reset" value="초기화" id="btnn"></li>
											</ul>
										</div>
									</div>
								</form:form><br>

							</div>
								<!-- Break -->
								
							</div>
						</section>
						<br><br>
>>>>>>> 4971ca8f2b72bffaa4f3009f98422990d3317934
					</div>

					<c:if test="${empty list}">
						<div class="col-12">
							<form:input path="addSubject" id="addSubject" placeholder="강의를 입력해주세요."/>
							<p id="Check_Subject" style="height: 1px; display: none;"></p>
						</div>
					</c:if>
					<div class="col-12">
						<select name="MaxPersonnel" id ="MaxPersonnel">
							<option value="0" label="정원을 선택해주세요" />
							<option value="1" label="1명" />
							<option value="2" label="2명" />
							<option value="3" label="3명" />
							<option value="4" label="4명" />
							<option value="5" label="5명" />
							<option value="6" label="6명" />
							<option value="7" label="7명" />
							<option value="8" label="8명" />
							<option value="9" label="9명" />
							<option value="10" label="10명" />
						</select>

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
							<form:input path="hopeDay" id="hopeDay" placeholder="진행가능한 요일을 적어주세요 ex)월, 화"/>
						</div>
					</div>
					<div class="col-12">
						<form:textarea path="introduce" id="introduce" placeholder="간단한 자기소개 및 수업 진행 세부계획을 작성해주세요." rows="6"/>
						<div id="introduce_cnt">(0 / 1000)</div>
					</div>
					<c:if test="${not empty menteeStudentNum}">
						<div class="col-12">
							<p>신청한 멘티</p>
							<form:input path="menteeStudentNum" id="menteeStudentNum" value="${menteeStudentNum}"/>
						</div>
					</c:if>

					<!-- Break -->
					<div class="col-12" style="text-align: center;">
						<ul class="actions">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<li><a href="javascript:void(0)" class="primary button" id="btn" onclick="checkValue()">등록</a></li>
							<li><input type="reset" value="초기화" id="btnn"></li>
						</ul>
					</div>
				</div>
				</form:form><br>

			</div>
			<!-- Break -->

		</div>
	</section>
	<br><br>
</div>
</section>

<!-- Footer -->
<%@include file ="../footer.jsp" %>

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

<script>
	$('#subjectInput').on('input', function(){
		if ($("#subjectInput").val() == '기타') {
			$("#addSubject").css("display", "block")
		}else {
			$("#addSubject").css("display", "none")
		}
	});
</script>

<script>
	$('#addSubject').on("propertychange change keyup paste input", function(){
		var subject = $('#addSubject').val(); // .id_input에 입력되는 값
		var data = {subject : subject} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		$.ajax({ type : "get",
			url : "/checkSubject",
			data : data,
			success : function(result){
				$('#Check_Subject').css('display', 'block');
				if(result == 'fail'){
					$("#Check_Subject").css("color","red");
					$("#Check_Subject").text(subject + " 과목은 이미 등록되어있는 과목입니다.");
					$('#addSubject').val("");
				}
<<<<<<< HEAD
			}
		});// success 종료
	}); // ajax 종료

	// 글자 수 제한
	$(document).ready(function() {
		$('#addSubject').on('keyup', function() {

			if($(this).val().length > 10) {
				$(this).val($(this).val().substring(0, 10));
			}
		});
	});

	$(document).ready(function() {
		$('#hopeDay').on('keyup', function() {

			if($(this).val().length > 10) {
				$(this).val($(this).val().substring(0, 10));
			}
		});
	});

	$(document).ready(function() {
		$('#introduce').on('keyup', function() {
			$('#introduce_cnt').html("("+$(this).val().length+" / 1000)");

			if($(this).val().length > 1000) {
				$(this).val($(this).val().substring(0, 1000));
				$('#introduce_cnt').html("(1000 / 1000)");
			}
		});
	});

</script>
<script>
	function checkValue()
	{
		person = $("#MaxPersonnel option:selected").val();
		if(person==0)
		{
			alert("정원1명이상 등록가능합니다");
			$("#MaxPersonnel").focus();
			return false;
		}
		else
			document.form.submit();
	}

</script>
</body>
=======
			});
		</script>

		<script>
			$('#addSubject').on("propertychange change keyup paste input", function(){
				var subject = $('#addSubject').val(); // .id_input에 입력되는 값
				var data = {subject : subject} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				$.ajax({ type : "get",
					url : "/checkSubject",
					data : data,
					success : function(result){
						$('#Check_Subject').css('display', 'block');
						if(result == 'fail'){
							$("#Check_Subject").css("color","red");
							$("#Check_Subject").text(subject + " 과목은 이미 등록되어있는 과목입니다.");
							$('#addSubject').val("");
						}
						}
					});// success 종료
				}); // ajax 종료

			// 글자 수 제한
			$(document).ready(function() {
				$('#addSubject').on('keyup', function() {

					if($(this).val().length > 10) {
						$(this).val($(this).val().substring(0, 10));
					}
				});
			});

			$(document).ready(function() {
				$('#hopeDay').on('keyup', function() {

					if($(this).val().length > 10) {
						$(this).val($(this).val().substring(0, 10));
					}
				});
			});

			$(document).ready(function() {
				$('#introduce').on('keyup', function() {
					$('#introduce_cnt').html("("+$(this).val().length+" / 1000)");

					if($(this).val().length > 1000) {
						$(this).val($(this).val().substring(0, 1000));
						$('#introduce_cnt').html("(1000 / 1000)");
					}
				});
			});

		</script>
	</body>
>>>>>>> 4971ca8f2b72bffaa4f3009f98422990d3317934
</html>