<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
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
    .boxx {
        width: 130px;
        height: 130px;
        border-radius: 50%;
        overflow: hidden;
    }
    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
</style>
<head>
    <title>404</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">
    <!-- Header -->

    <section id="one" class="main">
        <header class="accent1">
            <h2> PageError</h2>
            <p>새로고침을 시도하거나 관리자에게 문의해주세요</p>
            <a href="/"><p style="color: black">>메인으로 돌아가기<</p></a>
        </header>


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



</body>
</html>