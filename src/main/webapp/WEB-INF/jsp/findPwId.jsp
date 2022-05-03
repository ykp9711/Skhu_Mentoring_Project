
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">


<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <!-- Header -->
    <%@include file ="header.jsp" %>

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>ID PW 찾기</h1>
        </header>
        <div class="inner3"><br><br>
            <section id="one" class="main alt">
                <header style="text-align: center">
                    <button class="button" onclick="show_id()">아이디 찾기 </button>
                    <button class="button" onclick="show_password()">비밀번호 찾기</button>
                </header>

                <div class="fields" id="id_box" style="display:none;">
                    <form method="post" action="#">
                        <hr />
                        <h3 style="text-align: center">아이디 찾기</h3>
                        <div style="margin:0 auto;">
                            <div class="field">

                                <input type="email" placeholder="가입 시 사용한 이메일을 입력해주세요." style="margin: 0 auto; width:500px;">
                                <br>
                                <div style="position: relative; bottom: 20px"></div>
                                <ul class="actions special">
                                    <button onclick="emailSend()" type="button">찾기</button>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>

                <form method="post" action="#">
                    <div class="fields" id="pw_box" style="display:none;">
                        <hr />
                        <h3 style="text-align: center">비밀번호 찾기</h3>
                        <div class="col-6 col-12-medium" style="margin:0 auto;" >


                            <div class="field" style="margin-bottom: 2%">
                                <label style="margin-left: 20%;">아이디를 입력해주세요.
                                    <input type="text" placeholder="ID" id="userId" style="width:500px;">
                                </label>
                                <div style="margin-left: -20%; margin-top: -2%; margin-bottom: -2%;"></div>
                            </div>

                            <div class="field" style="height: 2.5em; margin-top: 5%">
                                <input type="email" placeholder="EMAIL" id="userEmail" style="display: inline-block; width:500px; float: left; margin-left: 20%;">
                                <div style="display: inline-block; margin: 2%; font-size: 90%; margin-top: 1%;"><button type="button" id="sendMail" style="cursor: pointer" >인증메일 발송</button></div>
                            </div>
                            <div style="margin-right: 45%; margin-top: 2%; margin-bottom: -2%; max-height: 25px; display: inline-block; overflow:hidden; white-space:nowrap;" ></div>

                            <div class="field" >
                                <input type="text" placeholder="AUTORNUM" id="auth_input" style="display: inline-block; width:500px; float: left; margin-left: 20%;">
                                <div style="display: inline-block; margin: 2%; font-size: 90%; margin-top: 1%;"><button type="button" id="auth_btn" style="cursor:pointer">인증</button></div>
                            </div>
                            <div style="margin-left: -52%; margin-top: -1%; margin-bottom: -5%; max-height: 25px; display: inline-block; display: none; overflow:hiddlen; white-space:nowrap;">확인되었습니다.</div>

                            <p id="msg" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
                            <ul class="actions special" style="margin-top: 1%;">
                                <li class="area"><a href="/modifyPw" id="modify_btn" onclick="window.open(this.href,'Detail','width=800px, height=600px, top=600, left=970, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button">확인</a></li>
                            </ul>

                    </div>
                    <br>

                    </div>
                </form>
            </section>

        </div>
    </section>


    <!-- Footer -->
    <footer id="footer">
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


<script>
    let display = document.getElementById("id_box");
    let display2 = document.getElementById("pw_box");
    function show_id(){

        display.style.display = "block";
        display2.style.display = "none";
    }
    function show_password(){

        display.style.display = "none";
        display2.style.display = "block";
    }

</script>

<script>
    // 이메일 인증 세션
    $("#auth_btn").click(function () {
        var email = $('#userEmail').val();
        var data = { email : email };

        $.ajax({ type : "post",
            url : "/emailsession",
            data : data
        });
    })

    // 이메일 인증
    $("#sendMail").click(function (){
        var email = $("#userEmail").val();
        var data = {email : email};
        var authKey;

        if(!email){
            $("#msg").text("이메일을 입력하세요.");
        } else{
            $("#msg").text("이메일을 전송하였습니다.");
        }

        $.ajax({ type : "get",
            url : "/sendMail",
            data : data,
            async : false,
            success : function (data){
                authKey = data;
            }
        });

        $('#auth_input').on("property-change change keyup paste input", function(){
            if(authKey == $('#auth_input').val()){
                $("#msg").text("인증 확인");
                $("#modify_btn").css({ 'pointer-events': 'auto' });
            } else {
                $("#msg").text("인증번호가 일치하지 않습니다.");
                $("#modify_btn").css({ 'pointer-events': 'none' });
            }
        })

    })

    $(document).ready(function (){

        var id = $('#userId').val();
        var email = $('#userEmail').val();
        var auth = $('#auth_input').val();


        if(!id || !email || !auth){
            $("#modify_btn").css({ 'pointer-events': 'none' });
        }
        else{
            $("#modify_btn").css({ 'pointer-events': 'auto' });
        }

    })
    $('#userId').on("property-change change keyup paste input", function(){
        console.log("들어옴")
        var id = $('#userId').val();
        var data = {id : id}

        $.ajax({ type : "get",
            url : "/checkId",
            data : data,
            success : function(result){
                $("#msg").text("존재하지 않은 ID입니다" );
                $("#modify_btn").css({ 'pointer-events': 'none' });

                if(result == 'fail'){
                    $("#msg").text(" ");
                }
            }
        });// success 종료
    }); // ajax 종료




</script>

</body>
</html>
