
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Section -->
    <section id="one" class="main alt">
        <header class="accent1">
            <h1>거절사유 작성</h1>
        </header>
        <div class="inner3"><br><br>
            <form name="applicationRefusal" method="post" >
                <div class="table-wrapper">
                    <div class="col-12" style="text-align: center;">

                        <textarea style="resize: none;" name="refusalReason" placeholder="거절사유를 작성해주세요"></textarea>

                    </div><br>
                    <div class="col-12" style="text-align: center;">
                        <input type="submit" value="거절" onclick="refusal(${bno}, ${menteeId})"></input>&nbsp;
                        <a href='javascript:self.close();' class="button primary">닫기</a>

                    </div>
                </div>

                <br><br>
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

</body>

<script>
    // 진행중인 멘토링 종료
    function refusal(bno, menteeId){
        if(confirm("거절하시겠습니까?") == true){
            location.href="/myPage/endMentoring?bno="+bno+"&menteeId=" + menteeId
            window.close()
        }else{
            alert("취소되었습니다.")
            window.close()
        }
    }
</script>
</html>