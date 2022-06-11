

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
<style>
    .big-width {display:block;}
    .small-width {display:none; text-align:center;}
    @media (max-width: 900px){
        .writer {display: none;}
        .regDate	 {display: none;}
        .updateDate {display: none;}
        .big-width {display:none;}
        .small-width {display:block;}
        select{width:100%;}
        #keyword{width:100%;}
        .search{width:100%;}
    }
</style>
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
                        <th  style="text-align: center; vertical-align : middle; width: 8%;">멘토 이름</th>
                        <th style="text-align: center; vertical-align : middle;" >학&nbsp;번</th>
                        <th style="text-align: center; vertical-align : middle;" >학부/학과</th>
                        <th style="text-align: center; vertical-align : middle;" >과&nbsp;목</th>
                        <th style="text-align: center; vertical-align : middle;" >시&nbsp;간</th>
                        <th style="text-align: center; vertical-align : middle;" >정&nbsp;&nbsp;원</th>
                        <th style="text-align: center; vertical-align : middle;" >등록날짜</th>
                        <th style="text-align: center; vertical-align : middle;" >상세보기</th>
                        <th style="text-align: center; vertical-align : middle;" >신&nbsp;청</th>
                        <th style="text-align: center; vertical-align : middle;" >멘티 정보</th>
                        <th style="text-align: center; vertical-align : middle;" >모집 종료</th>
                        <th style="text-align: center; vertical-align : middle;" >게시글<br>삭제</th>

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

                                        <a href="/status/detailMentees?bno=${list.bno}" onclick="window.open(this.href,'Detail','width=400px, height=400px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">멘티목록보기</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/deleteMentorBoard?bno=${list.bno}" class="button small disabled">상세보기</a>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td style="vertical-align : middle" class="area" >
                                <c:choose>
                                    <c:when test="${sessionId eq list.userId}">
                                        <a href="javascript:void(0)" onclick="end(${list.bno})" class="button small">종료</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:void(0)" onclick="end(${list.bno})" class="button small disabled">종료</a>

                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td style="vertical-align : middle" class="area" >
                                <c:choose>
                                    <c:when test="${sessionId eq list.userId}">
                                        <a href="javascript:void(0)" onclick="deleteMentoring(${list.bno})" class="button small">삭제</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:void(0)" onclick="deleteMentoring(${list.bno})" class="button small disabled">삭제</a>
                                    </c:otherwise>
                                </c:choose>

                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div  style="text-align:center">

            </div>
            <div class="big-width" style="text-align:center">
                <%-- 이전버튼 --%>
                <c:if test="${pageMaker.prev}">
                    <a class="button small changePage" href="${pageMaker.startPage - 1}"><code>&lt;</code></a>
                </c:if>

                <%-- 페이지 구현 --%>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <c:choose>
                        <c:when test="${pageMaker.cri.pageNum eq num}">
                            <%-- 현재 페이지일 때 --%>
                            <code><span style="color: #23b1ec">${num}</span></code>
                        </c:when>
                        <c:otherwise>
                            <a class="changePage" href="${num}"><code>${num}</code></a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 다음버튼 --%>
                <c:if test="${pageMaker.next}">
                    <a class="button small changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
                </c:if>

            </div>
        <%--반응형--%>
            <div class="small-width">
                <%-- 이전버튼 --%>
                <c:if test="${pageMaker.cri.pageNum > 1}">
                    <a class="button small changePage" href="${pageMaker.cri.pageNum - 1}"><code>&lt;</code></a>
                </c:if>

                <%-- 페이지 구현 --%>
                <code>${pageMaker.cri.pageNum}</code>

                <%-- 다음버튼 --%>
                <c:if test="${pageMaker.cri.pageNum < pageMaker.realEnd}">
                    <a class="button small changePage" href="${pageMaker.cri.pageNum + 1}"><code>&gt;</code></a>
                </c:if>
            </div>

            <form id="pageForm">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <input type="hidden" name="type" value="${pageMaker.cri.type}">
                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
            </form>

            <form id="searchForm">
                <div style="width: 100%; float: left;">

                    <select name="type" style="width: 18%; float: left;">
                        <option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
                        <option value="S" ${pageMaker.cri.type == 'S' ? 'selected' : ''}>과목</option>
                        <option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>멘토이름</option>
                        <option value="SW" ${pageMaker.cri.type == 'SW' ? 'selected' : ''}>과목 또는 멘토이름</option>
                    </select>
                    <a href="javascript:void(0)" class="button primary icon solid fa-search" style="width: 15%; float: right;">검색</a>
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
    // 모집 종료

    function end(bno){
        if(confirm("모집을 종료하시겠습니까?") == true){
            location.href="/status/endMentorBoard?bno="+bno
        }else{
            alert("취소되었습니다.")
        }
    }
</script>
<script>
    // 멘토링 삭제
    function deleteMentoring(bno){
        if(confirm("멘토링을 삭제하시겠습니까?") == true){
            location.href="/status/deleteMentorBoard?bno="+bno
        }else{
            alert("취소되었습니다.")
        }
    }
</script>
<script>
    var searchForm = $("#searchForm");

    $("#searchForm a").on("click", function(e){
        e.preventDefault();

        //val()은 해당 값이 있으면 true, 없으면 false
        if(!searchForm.find("option:selected").val()){
            alert("검색 종류를 선택하세요");
            return false;
        }

        if(!searchForm.find("input[name='keyword']").val()){
            alert("키워드를 입력하세요")
            return false;
        }

        searchForm.find("input[name='pageNum']").val("1");
        searchForm.submit();
    })
</script>
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
<script>
    var pageForm = $("#pageForm");

    $(".changePage").on("click", function(e){
        e.preventDefault();
        pageForm.find("input[name='pageNum']").val($(this).attr("href"));
        pageForm.submit();
    })

</script>
</body>
</html>
