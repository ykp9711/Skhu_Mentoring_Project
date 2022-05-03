
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
Hypothesis by Pixelarity
pixelarity.com | hello@pixelarity.com
License: pixelarity.com/license
-->
<html>
<head>
    <title>modifyPw</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">


    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>비밀번호 변경</h1>
        </header>
        <div class="inner2"><br><br>

            <form name="modifyPw" method="post">

                <form method="post" action="">
                    <div class="row gtr-uniform">
                        <div class="col-12">
                            <input type="text" name="userId" id="userPw" value="" placeholder="비밀번호" />
                        </div>
                        <div class="col-12">
                            <input type="password" name="userPw" id="conPw" value="" placeholder="비밀번호 확인" />
                        </div>
                        <div class="col-12" style="text-align: center;">
                            <ul class="actions fit">
                                <li><button type="submit"  class="button fit" id="modify_btn" >변경하기</button></li>
                                <li><a href='javascript:self.close();' class="button primary fit">닫기</a></li>
                            </ul>
                            <p id="msg" style="height: 1px; color: #13a2dd; text-align: center;" >${msg}</p>
                        </div>

                    </div>
                </form>
                <br><br>
        </div>
    </section>
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

<script>
    $("#modify_btn").click(function () {
        var pw = $('#userPw').val();
        var data = { pw : pw };

        $.ajax({ type : "post",
            url : "/modifyPw",
            data : data
        });
    })

    //비밀번호와 비밀번호 확인 일치 여부
    $('#conPw').on("property-change change keyup paste input", function(){
        var userPw = $("#userPw").val();
        var conPw = $("#conPw").val();

        if(userPw != conPw){
            $("#msg").text("비밀번호가 다릅니다.");
            $("#modify_btn").attr('disabled', true);
        }
        else if(userPw != " " || conPw != " "){
            $("#modify_btn").attr('disabled', false);
            $("#msg").text(" ");
        }
        else {
            $("#modify_btn").attr('disabled', false);
            $("#msg").text(" ");

        }
    })

</script>
</html>
