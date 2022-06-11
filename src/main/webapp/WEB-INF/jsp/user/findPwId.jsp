<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>findPwId</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <script type="text/javascript">

        function checkValue()
        {
            inputForm = eval("document.findIdInfo");
            if(!inputForm.userEmail.value)
            {
                alert("이메일을 입력하세요");
                inputForm.userEmail.focus();
                return false;
            }

        }

    </script>

    <style>
        #email {
            background-color: #e8e8e8;
        }
    </style>
</head>
<body class="is-preload">


<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <!-- Header -->
    <%@include file ="../header.jsp" %>

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>ID PW 찾기</h1>
        </header>
        <div class="inner3"><br><br>
            <section id="one" class="main alt">
                <header style="text-align: center">
                    <input type="button" onclick="show_id()" value="아이디 찾기"></button>
                    <input type="button" onclick="show_password()" value="비밀번호 찾기"></button>
                </header>

                <div class="fields" id="id_box" style="display:none;">
                    <form name="findIdInfo" method="post" action="/findPwId" onsubmit="return checkValue()">
                        <hr />
                        <h3 style="text-align: center">아이디 찾기</h3>
                        <div style="margin:0 auto;">
                            <div align="center">가입시 사용한 이메일을 입력해주세요.</div><br>
                            <div class="field">


                                <input type="email" id="userEmail" name="userEmail" placeholder="EMAIL" style="margin: 0 auto; width:500px;">
                                <br>
                                <div style="position: relative; bottom: 20px"></div>
                                <ul class="actions special">
                                    <input type="submit" id="emailSend" value="찾기"></input>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>

                <form method="post" action="#">
                    <div class="fields" id="pw_box" style="display:none;">
                        <hr />
                        <h3 style="text-align: center">비밀번호 찾기</h3>
                        <div class="inner2">
                            <div class="row gtr-uniform" style="text-align: center;">
                                <div class="col-12">
                                    <input type="text" name="userId" id="userId" value="" placeholder="ID" />
                                </div>
                                <div class="col-6">
                                    <input type="email" placeholder="EMAIL" id="uEmail" />
                                </div>
                                <div class="col-6">
                                    <input type="email" id="email" value="@naver.com" readonly />
                                </div>
                                <div class="col-12">
                                    <input type="button" id="sendMail" value="이메일 전송" class="button primary fit">
                                </div>
                                <div class="col-12" style="width: 100%;">
                                    <input type="text" name="auth" id="auth_input" value="" placeholder="인증번호" style="width: 64%; float: left;"/>

                                    <input type="button" id="auth_btn" value="인증" class="button primary fit" style="width: 34%; float: right;">
                                </div>
                                <div class="col-12" style="text-align: center;">
                                    <p id="msg" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
                                    <a href="/modifyPw" id="modify_btn" onclick="window.open(this.href,'Detail','width=800px, height=600px, top=600, left=970, toolbar=no, scrollbars=no, resizable=yes');return false;" target="_blank" class="button">확인</a>
                                </div>
                            </div>
                            <br>
                            <br>
                        </div>

                    </div>

                </form>
            </section>
            <div> <p id="check_email" style="height: 1px; color: #13a2dd; text-align: center;">${user.userId}</p></div>
            <div> <p id="check_email2" style="height: 1px; color: #13a2dd; text-align: center;">${msg}</p></div>
        </div>
    </section>


    <!-- Footer -->
    <footer id="footer">
    </footer>

</div>

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
    $("#modify_btn").click(function () {
        var id = $('#userId').val();
        var data = { id : id };

        $.ajax({ type : "post",
            url : "/emailsession",
            data : data
        });
    })

    // 이메일 인증
    $("#sendMail").click(function (){
        var email = $("#uEmail").val();
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

        //인증번호 일치 확인
        $('#auth_btn').click(function (){
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
        var email = $('#uEmail').val();
        var auth = $('#auth_input').val();


        if(!id || !email || !auth){
            $("#modify_btn").css({ 'pointer-events': 'none' });
        }
        else{
            $("#modify_btn").css({ 'pointer-events': 'auto' });
        }

    })

    // ID 체크
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


    // email 체크
    $('#uEmail').on("property-change change keyup paste input", function(){
        console.log("들어옴")
        var id = $('#userId').val();
        var email = $('#uEmail').val() + "@naver.com";
        var data = {id : id}

        $.ajax({ type : "get",
            url : "/checkEmail",
            data : data,
            success : function(result) {
                if(result != email){
                    $("#msg").text("가입 정보와 다른 이메일입니다." );
                    $("#modify_btn").css({ 'pointer-events': 'none' });
                    $("#sendMail").attr('disabled', true);
                } else {
                    $("#msg").text(" ");
                    $("#modify_btn").css({ 'pointer-events': 'auto' });
                    $("#sendMail").attr('disabled', false);
                }
            }
        });// success 종료

    }); // ajax 종료

</script>

</body>
</html>
