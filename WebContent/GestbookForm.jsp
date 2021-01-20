<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GESTBOOK</title>
<style type="text/css">
#wrap {
	width: 700px;
	margin: 0 auto 0 auto;
}

#comment {
	text-align: left;
}

#writeGestFrom, #listGestFrom {
	text-align: center;
}
</style>

<script type="text/javascript">
        // 입력값 체크
        function checkValue()
        {
            if(!document.gestbookInfo.guestbook_id.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            if(!document.gestbookInfo.guestbook_password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(!document.gestbookInfo.guestbook_content.value){
                alert("내용을 입력하세요.");
                return false;
            }
        }
    
    </script>

</head>
<body>
<section id="main">
<div class="inner">
	<header>
		<h2>방명록</h2>
	</header>
</div>
</section>

<!-- 	<b><font size="6" color="gray">방명록</font></b>
	<hr size="1" width="700">
	<br> -->

	<div id="wrap">

		<!-- 글 등록 부분 시작-->
		<div id="writeGestFrom">
			<form name="gestbookInfo" method="post"
				onsubmit="return checkValue()">
				<table >
					<tr>
						<td>이름</td>
						<td><input type="text" name="guestbook_id"></td>
						<td>비밀번호</td>
						<td><input type="password" name="guestbook_password"></td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="7" cols="80"
								name="guestbook_content"></textarea></td>
					</tr>
				</table>
				<br> <input type="submit" value="등록">
			</form>
		</div>
		<!-- 글 등록 부분 끝-->

		<br>
		<br>
		<!-- 글 목록 부분 시작 -->
		<div id="listGestFrom">
			<form method="post" name="listform">
				<input type="hidden" name="pro">
				<div id="comment">
					<hr size="1" width="700">
					<label>이름</label>&nbsp;&nbsp;&nbsp; <label>날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">[답변]</a>&nbsp; <a href="#">[수정]</a>&nbsp; <a href="#">[삭제]</a><br>
					내용 <br>
					<hr size="1" width="700">
				</div>
			</form>
		</div>
		<!-- 글 목록 부분 끝 -->

	</div>

</body>
</html>