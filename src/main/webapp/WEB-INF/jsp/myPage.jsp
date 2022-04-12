<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<style>
    .tab {
        list-style: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    /* Float the list items side by side */
    .tab li {
        float: left;
    }
    /* Style the links inside the list items */
    .tab li a {
        display: inline-block;
        color: #000;
        text-align: center;
        text-decoration: none;
        padding: 14px 16px;
        font-size: 17px;
        transition: 0.3s;
        text-decoration-line : none;
    }
    /* Style the tab content */
    .tabcontent {
        display: none;
        background-color: #f7f7f7;
        padding: 6px 12px;
        color: #fff;
    }
    ul.tab li.current {
        background-color: rgb(0, 154, 200);
        color: #222;
    }
    .tabcontent.current {
        display: block;
    }
</style>
<head>
    <title>마이페이지</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <%@include file ="header.jsp" %>

    <section id="one" class="main">
        <header class="accent1">
            <h2>My Page</h2>
        </header>
        <ul class="tabs">
            <li>
                <h3><span style="font-size: 0.8em;">내 정보</span></h3>
                <div class="spotlight" style="text-align: center;">
                    <div class="inner2" style="text-align: center;">
                        <form method="post" action="#">
                            <div class="row gtr-uniform" style="text-align: center; width: 74%;  float: right;">
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="아이디" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <select>
                                        <option>학부/학과</option>
                                        <option>IT융합자율학부</option>
                                        <option>인문융합자율학부</option>
                                        <option>사회융합자율학부</option>
                                        <option>미디어콘텐츠융합자율학부</option>
                                    </select>
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="학번" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="이메일" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="password" placeholder="비밀번호" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="password" placeholder="비밀번호 확인" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="내 멘티 평점" />
                                </div>
                                <div class="col-7" style="text-align: center;">
                                    <input type="text" placeholder="내 멘토 횟수(순위)" />
                                </div>

                                <!-- Break -->

                            </div>
                        </form>
                        <br><br>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">멘토 현황</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘티 인원 수</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘토링 종료</th>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                            </tr>


                            </tbody>
                        </table>
                    </div>

                    <br>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">멘티 현황</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 시작 일</th>


                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >육정근</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">2</td>
                                <td style="vertical-align : middle">C언어</td>
                                <td style="vertical-align: middle;" >양경필</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >안대성</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >김윤진</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">종료된 멘토</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 종료 일</th>


                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >2022-03-03</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >2022-03-03</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >2022-03-03</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >2022-03-03</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">종료된 멘티</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 종료 일</th>


                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align : middle">육정근</td>
                                <td style="vertical-align: middle;" >2022-03-03</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align : middle">육정근</td>
                                <td style="vertical-align: middle;" >2022-03-03</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>

                            </tr><tr style="height: 70px;">
                            <td style="vertical-align : middle">1</td>
                            <td style="vertical-align : middle">알고리즘</td>
                            <td style="vertical-align : middle">육정근</td>
                            <td style="vertical-align: middle;" >2022-03-03</td>
                            <td style="vertical-align : middle" class="title">2022-04-07</td>

                        </tr><tr style="height: 70px;">
                            <td style="vertical-align : middle">1</td>
                            <td style="vertical-align : middle">알고리즘</td>
                            <td style="vertical-align : middle">육정근</td>
                            <td style="vertical-align: middle;" >2022-03-03</td>
                            <td style="vertical-align : middle" class="title">2022-04-07</td>

                        </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;" >멘티에게 받은 요청</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">이름</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">학번</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">학부</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘티 상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">수락/거절</th>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">육정근</td>
                                <td style="vertical-align: middle;" >201632015</td>
                                <td style="vertical-align: middle;" >IT융합자율학부</td>
                                <td style="vertical-align: middle;" >알고리즘</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">수락</a><a href="멘티등록링크" class="button primary small">거절</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">육정근</td>
                                <td style="vertical-align: middle;" >201632015</td>
                                <td style="vertical-align: middle;" >IT융합자율학부</td>
                                <td style="vertical-align: middle;" >알고리즘</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">수락</a><a href="멘티등록링크" class="button primary small">거절</a></td>
                            </tr><tr style="height: 70px;">
                            <td style="vertical-align : middle">1</td>
                            <td style="vertical-align : middle">육정근</td>
                            <td style="vertical-align: middle;" >201632015</td>
                            <td style="vertical-align: middle;" >IT융합자율학부</td>
                            <td style="vertical-align: middle;" >알고리즘</td>
                            <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                            <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">수락</a><a href="멘티등록링크" class="button primary small">거절</a></td>
                        </tr><tr style="height: 70px;">
                            <td style="vertical-align : middle">1</td>
                            <td style="vertical-align : middle">육정근</td>
                            <td style="vertical-align: middle;" >201632015</td>
                            <td style="vertical-align: middle;" >IT융합자율학부</td>
                            <td style="vertical-align: middle;" >알고리즘</td>
                            <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                            <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">수락</a><a href="멘티등록링크" class="button primary small">거절</a></td>
                        </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;" >멘토에게 보낸 신청</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>

                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토링 과목</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">승인여부</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">신청취소</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘토정보</th>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >육정근</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">대기중</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청취소</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >육정근</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">대기중</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청취소</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>

                            </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >육정근</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">대기중</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청취소</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>

                            </tr>
                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >육정근</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">대기중</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">신청취소</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>

                            </tr>


                            </tbody>
                        </table>
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