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
						<h2>회원정보 수정</h2>
					</header>
					<form method="post" action="inform.cu">

							<label for="cus_pw">비밀번호</label>
							<input type="password" name="cus_pw" id="cus_pw" required="required"/><br>
						
						<ul class="actions">
							<li><input type="submit" value="확인" class="button special" /></li>
							<li><a class="button special" onclick="location.href='customer/logout.jsp'">로그아웃</a></li>
						</ul>
					</form>
				</div>
		</section>
	</body>
</html>