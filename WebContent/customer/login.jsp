<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>사진미술관</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>
		<section id="main">
				<div class="inner">
					<header>
						<h2>로그인</h2>
					</header>
					<form method="post" action="login.cu">
			
							<label for="cus_id">ID</label>
							<input type="text" name="cus_id" id="cus_id" required="required" /><br>
						
						
							<label for="cus_pw">PW</label>
							<input type="password" name="cus_pw" id="cus_pw" required="required"/><br>
						
						<ul class="actions">
							<li><input type="submit" value="로그인" class="button special big" /></li>
							<li><a href="">아이디/비밀번호 찾기</a></li>
							<li><a href="index.jsp?page=customer/join.jsp" class="button alt small">회원가입</a></li>
						</ul>
					</form>
				</div>
		</section>
	</body>
</html>