

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>멘토 현황</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="../header.jsp" %>

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>Mentor Status</h1>
        </header>
        <div class="inner4"><br><br>



            <div class="table-wrapper">
                <table style="border: 1px;  text-align: center;  ">
                    <tr class="tHead" >
                        <th  style="text-align: center; vertical-align : middle;">멘토<br>이름</th>
                        <th style="text-align: center; vertical-align : middle;" >학&nbsp;번</th>
                        <th style="text-align: center; vertical-align : middle;" >학부/학과</th>
                        <th style="text-align: center; vertical-align : middle;" >과&nbsp;목</th>
                        <th style="text-align: center; vertical-align : middle;" >시&nbsp;간</th>
                        <th style="text-align: center; vertical-align : middle;" >정&nbsp;&nbsp;원</th>
                        <th style="text-align: center; vertical-align : middle;" >등록날짜</th>
                        <th style="text-align: center; vertical-align : middle;" >상세보기</th>
                        <th style="text-align: center; vertical-align : middle;" >신&nbsp;청</th>
                        <th style="text-align: center; vertical-align : middle;" >게시글<br>삭제</th>
                        <th style="text-align: center; vertical-align : middle;" >모집 종료</th>
                        <th style="text-align: center; vertical-align : middle;" >멘티 정보</th>
                        <th style="text-align: center; vertical-align : middle;" >모집 현황</th>

                    </tr>

                    <c:forEach var="list" items="${list}">
                        <tr style="height: 70px;">
                            <td style="vertical-align : middle">${list.userName}</td>
                            <td style="vertical-align: middle;" >${list.userStudentNum}</td>
                            <td style="vertical-align : middle" class="title">${list.department}</td>
                            <td style="vertical-align : middle" class="title">${list.subjectName}</td>
                            <td style="vertical-align : middle" class="title">${list.hopeDay}</td>
                            <td style="vertical-align : middle" class="title">${list.personnel}/<span style="color: #23b1ec">${list.maxPersonnel}</span></td>
                            <td style="vertical-align : middle" class="title">
                                <fmt:formatDate var="regDate" value="${list.regDate}" pattern="yyyy-MM-dd"/>
                                    ${regDate}</td>
                            <td style="vertical-align : middle" class="area" ><a href="/status/detailMentor?bno=${list.bno}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">상세보기</a></td>

                            <td style="vertical-align : middle" class="area" >
                                <c:choose>
                                    <c:when test="${sessionId eq list.userId}">
                                        <a href="/register/menteeRegister?bno=${list.bno}" class="button small disabled ">신청</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:void(0)" onclick="checkApplication(this)" data-bno="${list.bno}" class="button small">신청</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>


                            <td style="vertical-align : middle" class="area" >
                                <c:choose>
                                    <c:when test="${sessionId eq list.userId}">
                                        <a href="/status/deleteMentorBoard?bno=${list.bno}" class="button small ">삭제</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/deleteMentorBoard?bno=${list.bno}" class="button small disabled">삭제</a>
                                    </c:otherwise>
                                </c:choose>

                            </td>

                            <td style="vertical-align : middle" class="area" >
                                <c:choose>
                                    <c:when test="${sessionId eq list.userId}">
                                        <a href="/status/endMentorBoard?bno=${list.bno}" class="button small ">종료</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/status/endMentorBoard?bno=${list.bno}" class="button small disabled">종료</a>
                                    </c:otherwise>
                                </c:choose>

                            </td>

                            <td style="vertical-align : middle" class="area" >
                                <c:choose>
                                    <c:when test="${sessionId eq list.userId}">

                                        <a href="/status/detailMentees?bno=${list.bno}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">멘티목록보기</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/deleteMentorBoard?bno=${list.bno}" class="button small disabled">상세보기</a>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td style="vertical-align : middle">${list.recruiting}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
    function checkApplication(obj){
        console.log($(obj).attr("data-bno"));
        const id = '<%=(String)session.getAttribute("sessionId")%>';
        var data = {bno : $(obj).attr("data-bno"), menteeId: id}
        $.ajax({ type : "POST",
            url : "/status/checkApplicationStatus",
            data : data,
            async:false,
            success : function(data){
                console.log(data)
                if(data == 'success'){
                    location.href="/register/menteeRegister?bno="+$(obj).attr('data-bno');
                }else
                    alert("이미 신청되어있습니다.")
            }// success 종료
        }); // ajax 종료
    }
</script>

</body>
</html>
