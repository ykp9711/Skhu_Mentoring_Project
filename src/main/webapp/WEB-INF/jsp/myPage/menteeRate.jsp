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
    <title>Untitled</title>
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

                <input type="text" style="display:none" name="bno" value="${bno}"></input>

               <c:choose>
                    <c:when test="${not empty getMentee}">
                        <table style="border: 1px; margin:0; text-align: center;  ">

                            <tr style="background: transparent">
                                <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 ID</td>
                                <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >멘티 평가</td>
                            </tr>

                                <tr style="height: 70px;">
                                    <td style="vertical-align: middle;" name="menteeId">mentee</td>

                                    <td style="vertical-align : middle" class="area" ><a href="/myPage/menteeRateGo" onclick="window.open(this.href,'Detail','width=600px, height=600px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">평가하러가기</a></td>
                                </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align: middle;" name="menteeId">mentee2</td>

                                <td style="vertical-align : middle" class="area" ><a href="/myPage/menteeRateGo" onclick="window.open(this.href,'Detail','width=600px, height=600px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">평가하러가기</a></td>
                            </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align: middle;" name="menteeId">mentee3</td>

                                <td style="vertical-align : middle" class="area" ><a href="/myPage/menteeRateGo onclick="window.open(this.href,'Detail','width=600px, height=600px, top=200, left=570, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button small">평가하러가기</a></td>
                            </tr>

                        </table>
                    </c:when>
                    <c:otherwise>
                        <p style="text-align: center">신청한 멘티가 없습니다.</p>
                    </c:otherwise>
                </c:choose>

                    <br>
                    <div class="col-12" style="text-align: center;">
                        <input type="submit" value="종료" class="primary">
                        <%--<a href="javascript:void(0)" onclick="endMentoring(${Mentoring.bno})" class="button small">종료</a>--%>

                    </div>
            </div>

                <br><br></form>
        </div>
    </section>


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
    // 진행중인 멘토링 종료
    function endMentoring(bno, menteeId){
        if(confirm("멘토링을 종료하시겠습니까?") == true){
            location.href="/myPage/endMentoring?bno="+bno+"&menteeId=" + menteeId
        }else{
            alert("취소되었습니다.")
        }
    }

</script>

</body>
</html>
