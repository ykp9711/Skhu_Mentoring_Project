<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>SKHU MENTORING MENTEE</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />
</head>
<style>

</style>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>멘티 평가</h1>
        </header>
        <div class="inner3"><br><br>
            <form name="rating" method="post" action="/myPage/updateRating" >
                <div class="table-wrapper">

                    <input type="hidden" name="bno" value="${bno}">


                    <table style="border: 1px; margin:0; text-align: center;  ">
                        <tr style="background: transparent">
                            <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 이름</td>
                            <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 학번</td>
                            <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 평가</td>
                        </tr>
                        <c:forEach var="mentee" items="${mentee}">
                            <tr style="height: 70px;">
                                <td style="vertical-align: middle;" name="menteeId">${mentee.userName}</td>
                                <td style="vertical-align: middle;" name="menteeId">${mentee.userStudentNum}</td>
                                <c:if test="${mentee.checkRating eq 0}">
                                    <td style="vertical-align : middle" class="area" ><a href="/myPage/menteeRateGo?bno=${bno}&menteeId=${mentee.menteeId}&userName=${mentee.userName}" onclick="window.open(this.href,'Detail','width=600px, height=600px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">평가하러가기</a></td>
                                </c:if>
                                <c:if test="${mentee.checkRating eq 1}">
                                    <td style="vertical-align : middle" class="area" ><a href=""  class="button small disabled" >평가완료</a></td>
                                </c:if>
                            </tr>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <div class="col-12" style="text-align: center;">
                        <a href="javascript:void(0)" onclick="endMentoring(${bno})" class="button ">멘토링 종료</a>
                        <a href='javascript:self.close();' class="button primary">닫기</a>
                        <%--<a href="javascript:void(0)" onclick="endMentoring(${Mentoring.bno})" class="button small">종료</a>--%>

                    </div>
                </div>

                <br><br></form>
        </div>
    </section>


</div>

<!-- Scripts -->
<script>
</script>
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
    // 진행중인 멘토링 종료
    function endMentoring(bno, menteeId){
        if(${noRating eq 'noRating'}){
            alert("멘티평가를 먼저 진행해주세요")
            return false;
        }
        if(confirm("멘토링을 종료하시겠습니까?") == true){
            location.href="/myPage/endMentoring?bno="+bno
        }else{
            alert("취소되었습니다.")
        }
    }

</script>

</body>
</html>