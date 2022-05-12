<%@ page language="java" contentType="text/html; charset=UTF-8"	 pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Hypothesis by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>MenteeRegister</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
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
							<c:choose>
<c:when test="${empty list}">
	<h1>멘티 등록</h1>
</c:when>
							<c:otherwise>
								<h1>멘토링 신청</h1>
							</c:otherwise>
							</c:choose>
						</header>
						<div class="inner2"><br><br>

							<div class="row gtr-uniform">

<c:choose>
	<c:when test="${empty list}">
        <%--@elvariable id="mentee" type="com.skhuMentoring.dto.Mentee"--%>
								<form:form modelAttribute="mentee" method="post" action="#">

									<div class="row gtr-uniform">
										<div class="col-12">
											<form:input path="userName" value="${user.userName}" placeholder="이름" readonly="true"/>
										</div>
										<div class="col-12">
											<form:input path="userStudentNum" value="${user.userStudentNum}" readonly="true" />
										</div>
										<div class="col-12">
											<input type="text" name ="department" readonly value="${user.department}">
										</div>
										<div class="col-12">
											<form:input path="subjectName" id="subjectInput" list="subject" placeholder="희망 강의 과목" value="${list.subjectName}"/>
											<datalist name="subject" id="subject">
												<form:select path="subject" >
												<form:option value="기타" label="0" />
												<form:options  itemValue="subjectName" itemLabel="sno" items="${ subject }"  />
											</datalist>
											</form:select>
										</div>
										<c:if test="${empty list}">
										<div class="col-12">
											<form:input path="addSubject" id="addSubject" placeholder="강의를 입력해주세요."/>
											<p id="Check_Subject" style="height: 1px; display: none;"></p>
										</div>
										</c:if>
										<c:if test="${empty list}">
										<div class="col-12" style="text-align: center;">
											<label>희망 시작 날짜 &nbsp;
											<input type="date" name="startDate" id="startDate"  placeholder="예정시작일">
										</label>
										</div>
										<div class="col-12" style="text-align: center;">
											<label>희망 종료 날짜 &nbsp;
											<input type="date" name="endDate" id="endDate">
										</label>
										</div>
										<div class="col-12">
											<form:input path="hopeDay" placeholder="진행가능한 요일을 적어주세요 ex)월, 화"/>
										</div>
										</c:if>
										<div class="col-12">
											<form:textarea path="introduce" placeholder="간단한 자기소개를 작성해주세요." rows="6"></form:textarea>
										</div>
										<!-- Break -->
										<div class="col-12" style="text-align: center;">
											<ul class="actions">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<li><input type="submit" value="등록" class="primary"></li>
												<li><input type="reset" value="초기화"></li>


											</ul>
										</div>
									</div>


								</div>
								<!-- Break -->

							</div>
						</section>
				</form:form>
						<br><br>
					</div>
					</section>
	</c:when>
	<c:otherwise><%--멘토링 신청 시 보여주는 form--%>
        <%--@elvariable id="mentee" type="com.skhuMentoring.dto.Mentee"--%>
		<form:form modelAttribute="mentee" method="post" action="/appilcation">

			<div class="row gtr-uniform">
				<input type="hidden"  value="${list.bno}" name="bno"/>
				<div class="col-12">
					<form:input path="userName" value="${user.userName}" placeholder="이름" readonly="true"/>
				</div>
				<div class="col-12">
					<form:input path="userStudentNum" value="${user.userStudentNum}" readonly="true" />
				</div>
				<div class="col-12">
					<div class="col-12">
						<input type="text" name ="department" readonly value="${user.department}">
					</div>
				</div>
				<div class="col-12">
					<form:input path="subjectName" id="subjectInput" list="subject" placeholder="희망 강의 과목" value="${list.subjectName}"/>
					<datalist name="subject" id="subject">
						<form:select path="subject" >
						<form:option value="기타" label="0" />
						<form:options  itemValue="subjectName" itemLabel="sno" items="${ subject }"  />
					</datalist>
					</form:select>
				</div>
				<c:if test="${empty list}">
					<div class="col-12">
						<form:input path="addSubject" id="addSubject" placeholder="강의를 입력해주세요."/>
						<p id="Check_Subject" style="height: 1px; display: none;"></p>
					</div>
				</c:if>
				<c:if test="${empty list}">
					<div class="col-12" style="text-align: center;">
						<label>희망 시작 날짜 &nbsp;
							<input type="date" name="startDate" id="startDate"  placeholder="예정시작일">
						</label>
					</div>
					<div class="col-12" style="text-align: center;">
						<label>희망 종료 날짜 &nbsp;
							<input type="date" name="endDate" id="endDate">
						</label>
					</div>
					<div class="col-12">
						<form:input path="hopeDay" placeholder="진행가능한 요일을 적어주세요 ex)월, 화"/>
					</div>
				</c:if>
				<div class="col-12">
					<form:textarea path="introduce" placeholder="간단한 자기소개를 작성해주세요." rows="6"></form:textarea>
				</div>
				<!-- Break -->
				<div class="col-12" style="text-align: center;">
					<ul class="actions">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<li><input type="submit" value="신청" class="primary"></li>
								<li><input type="reset" value="초기화"></li>



					</ul>
				</div>
			</div>


			</div>
			<!-- Break -->

			</div>
			</section>
		</form:form>
		<br><br>
		</div>

		</section>
	</c:otherwise>
	</c:choose>

				<!-- Footer -->
		<%@include file ="../footer.jsp" %>

			</div>
	</body>
</html>
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
			}
		});// success 종료
	}); // ajax 종료
</script>


	</body>
</html>