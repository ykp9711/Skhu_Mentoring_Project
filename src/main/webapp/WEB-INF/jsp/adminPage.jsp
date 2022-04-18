<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    <title>관리자 페이지</title>
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
            <h2>관리자 페이지</h2>
        </header>
        <ul class="tabs">
            <li>
                <h3><span style="font-size: 0.8em;">진행중인 멘토링 현황</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘티 인원 수</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">상세보기</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘티 확인</th>
                                <th style="text-align: center; vertical-align : middle;" class="time">멘토링 종료</th>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align : middle">양경필</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align : middle">육정근</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align : middle">김윤진</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align : middle">안대성</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">종료</a></td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티등록링크" class="button small">상세보기</a></td>
                            </tr>


                            </tbody>
                        </table>
                    </div>

                    <br>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">종료된 멘토링</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토링 과목</th>
                                <th  style="text-align: center; vertical-align : middle;">멘토</th>
                                <th style="text-align: center; vertical-align : middle;" class="mentorNumber">멘티 인원 수</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 시작 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="department">멘토링 종료 일</th>
                                <th style="text-align: center; vertical-align : middle;" class="subject">멘티 확인</th>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >양경필</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="title">2022-05-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티 목록" class="button small">확인</a></td>
                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">알고리즘</td>
                                <td style="vertical-align: middle;" >육정근</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle" class="title">2022-04-07</td>
                                <td style="vertical-align : middle" class="title">2022-06-07</td>
                                <td style="vertical-align : middle" class="area" ><a href="멘티 목록" class="button small">종료</a></td>
                            </tr>



                            </tbody>
                        </table>
                    </div>

                    <br>
                </div>
            </li>
            <li>
                <h3><span style="font-size: 0.8em;">가입된 학생 현황</span></h3>
                <div class="spotlight">
                    <div class="table-wrapper">
                        <table style="border: 1px;  text-align: center;  ">
                            <tr class="tHead" >
                                <th style="text-align: center; vertical-align : middle;" >No</th>
                                <th  style="text-align: center; vertical-align : middle;">이름</th>
                                <th  style="text-align: center; vertical-align : middle;">학번</th>
                                <th  style="text-align: center; vertical-align : middle;">학년</th>
                                <th style="text-align: center; vertical-align : middle;"> 이메일</th>
                                <th style="text-align: center; vertical-align : middle;" >전화번호</th>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">홍길동</td>
                                <td style="vertical-align: middle;" >201632013</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle">abc@office.skhu.ac.kr</td>
                                <td style="vertical-align : middle">010-1234-5678</td>

                            </tr>

                            <tr style="height: 70px;">
                                <td style="vertical-align : middle">1</td>
                                <td style="vertical-align : middle">김길동</td>
                                <td style="vertical-align: middle;" >201932022</td>
                                <td style="vertical-align: middle;" >3</td>
                                <td style="vertical-align : middle">abc@office.skhu.ac.kr</td>
                                <td style="vertical-align : middle">010-1234-9876</td>
                            </tr>



                            </tbody>
                        </table>
                    </div>
            </li>
        </ul>
    </section>

    <!-- Footer -->
    <%@include file ="footer.jsp" %>

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