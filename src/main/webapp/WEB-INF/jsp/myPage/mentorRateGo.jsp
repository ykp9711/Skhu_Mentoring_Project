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
            <h1>멘토 평가</h1>
        </header>
        <div class="inner3"><br><br>
            <form name="rating" method="post" action="/myPage/updateRating" >
            <div class="table-wrapper">

                        <table style="border: 1px; margin:0; text-align: center;  ">
                            <tr style="background: transparent">
                                <th></th>

                                <td style="text-align: center; vertical-align : middle; background: #eeeeee;" >mentor</td>




                            </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align: middle; background: #eeeeee;" >
                                    수업평가
                                </td>
                                <td style="vertical-align: middle;" >
                                    <div class="row gtr-uniform">
                                        <!-- Break -->
                                        <div class="col-4 col-12-small">
                                            <input type="radio" id="rating1" name="rating" />
                                            <label for="rating1"><span></span>1점</label>
                                            <input type="radio" id="rating2" name="rating" />
                                            <label for="rating2"><span></span>2점</label>
                                            <input type="radio" id="rating3" name="rating" />
                                            <label for="rating3"><span></span>3점</label>
                                            <input type="radio" id="rating4" name="rating" />
                                            <label for="rating4"><span></span>4점</label>
                                            <input type="radio" id="rating5" name="rating" />
                                            <label for="rating5"><span></span>5점</label>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align: middle; background: #eeeeee;" >
                                    시간준수
                                </td>
                                <td style="vertical-align: middle;" >
                                    <div class="row gtr-uniform">
                                        <!-- Break -->
                                        <div class="col-4 col-12-small">
                                            <input type="radio" id="rating6" name="rating2" />
                                            <label for="rating6"><span></span>1점</label>
                                            <input type="radio" id="rating7" name="rating2" />
                                            <label for="rating7"><span></span>2점</label>
                                            <input type="radio" id="rating8" name="rating2" />
                                            <label for="rating8"><span></span>3점</label>
                                            <input type="radio" id="rating9" name="rating2" />
                                            <label for="rating9"><span></span>4점</label>
                                            <input type="radio" id="rating10" name="rating2" />
                                            <label for="rating10"><span></span>5점</label>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align: middle; background: #eeeeee;" >
                                    준비물
                                </td>
                                <td style="vertical-align: middle;" >
                                    <div class="row gtr-uniform">
                                        <!-- Break -->
                                        <div class="col-4 col-12-small">
                                            <input type="radio" id="rating11" name="rating3" />
                                            <label for="rating11"><span></span>1점</label>
                                            <input type="radio" id="rating12" name="rating3" />
                                            <label for="rating12"><span></span>2점</label>
                                            <input type="radio" id="rating13" name="rating3" />
                                            <label for="rating13"><span></span>3점</label>
                                            <input type="radio" id="rating14" name="rating3" />
                                            <label for="rating14"><span></span>4점</label>
                                            <input type="radio" id="rating15" name="rating3" />
                                            <label for="rating15"><span></span>5점</label>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                        </table>


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
