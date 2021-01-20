<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>사진미술관</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="index.jsp" class="logo">Sajin Gallery</a>
					<nav id="nav">
						<a href="index.jsp?page=now.html">전시정보</a>
						<a href="index.jsp?page=gallery.jsp">갤러리</a>
						<a href="index.jsp?page=GestbookForm.jsp">방명록</a>
						<a href="#">문의</a>
						<%if(session.getAttribute("cus_id")==null){
							out.print("<a href='index.jsp?page=customer/login.jsp'>로그인</a>");
						}else{
							out.print("<a href='index.jsp?page=customer/mypageAcc.jsp'>마이페이지</a>");
						}%>
						
					</nav>
				</div>
			</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>