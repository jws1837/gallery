<%@page import="model.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cusDTO" class="model.CustomerDTO" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<title>사진미술관</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
	<script type="text/javascript" src="assets/js/join.js"></script>
</head>
<body>
<%cusDTO = (CustomerDTO)request.getAttribute("cusDTO");
String cus_id = cusDTO.getCus_id();
String cus_name = cusDTO.getCus_name();
String cus_tel = cusDTO.getCus_tel();
String cus_email = cusDTO.getCus_email();
%>


		<section id="main">
				<div class="inner">
					<header>
						<h2>마이페이지</h2>
					</header>
					
					<form method="post" action="update.cu">	
						<div id="priorityHidden">
							<input type="radio" name="priority" value="agree" checked>
						</div>
							<label for="cus_id">ID</label>
							<input type="text" name="cus_id" id="cus_id" value="<%=cus_id %>" readonly="readonly" />
							<br>
							<label for="cus_pw">PW</label>
							<input type="password" name="cus_pw" id="cus_pw" />
							<span></span>
							<br>
							<label for="cus_pw_re">PW 확인</label>
							<input type="password" name="cus_pw_re" id="cus_pw_re" />
							<span></span>
							<br>
							<label for="cus_name">이름</label>
							<input type="text" name="cus_name" id="cus_name" value="<%=cus_name %>" readonly="readonly" />
							<!-- <span></span> -->
							<br>
							<label for="cus_tel">전화번호</label>
							<input type="text" name="cus_tel" id="cus_tel" value="<%=cus_tel %>" />
							<br>
							<label for="cus_email">이메일</label>
							<input type="text" name="cus_email" id="cus_email" value="<%=cus_email %>" />
							<br>
						<ul class="actions">
							<li><input type="submit" value="회원수정" class="alt" /></li>
							<li><a href="index.jsp?page=customer/delete.jsp" class="button alt">회원탈퇴</a></li>
						</ul>
					</form>

				</div>
		</section>
</body>
</html>