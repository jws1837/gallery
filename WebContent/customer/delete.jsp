<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
						<h2>회원탈퇴</h2>
					</header>
					<form method="post" action="delete.cu">
							<label for="cus_pw">PW 확인</label>
							<input type="password" name="cus_pw" id="cus_pw" required="required"/><br>
						
						<ul class="actions">
							<li><input type="submit" value="탈퇴하기" class="button special" /></li>
							<li><a href="inform.cu" class="button alt small">돌아가기</a></li>
						</ul>
					</form>
				</div>
		</section>
</body>
</html>