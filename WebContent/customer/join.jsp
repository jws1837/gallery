<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>사진미술관</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />		
		<script type="text/javascript" src="assets/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="assets/js/join.js"></script>
	</head>
	<body>
		<section id="main">
				<div class="inner">
					<header>
						<h2>회원가입</h2>
					</header>
					
					<form method="post" action="register.cu">	
					
						<h4>이용약관</h4>
						<pre><code>어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고</code></pre>
						<input type="radio" id="priority" name="priority" value="agree">
						<label for="priority">동의합니다</label>
						<input type="radio" id="priority-no" name="priority" value="disagree">
						<label for="priority-no">동의하지 않습니다</label>
				
					
							<label for="cus_id">ID</label>
							<input type="text" name="cus_id" id="cus_id" />
							<br>
							<a class="button small" onclick="idchk(cus_id.value)">중복체크</a>
							<label for="cus_pw">PW</label>
							<input type="password" name="cus_pw" id="cus_pw" />
							<span></span>
							<br>
							<label for="cus_pw_re">PW 확인</label>
							<input type="password" name="cus_pw_re" id="cus_pw_re" />
							<span></span>
							<br>
							<label for="cus_name">이름</label>
							<input type="text" name="cus_name" id="cus_name" />
							<span></span>
							<br>
							<label for="cus_tel">전화번호</label>
							<input type="text" name="cus_tel" id="cus_tel" />
							<br>
							<label for="cus_email">이메일</label>
							<input type="text" name="cus_email" id="cus_email" />
							<br>
						<ul class="actions">
							<li><input type="submit" value="회원가입" class="alt" /></li>
							<li><input type="reset" value="초기화 " class="alt" /></li>
						</ul>
						
					</form>
					
				</div>
		</section>
	</body>
</html>