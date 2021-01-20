<%@page import="model.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/main.css" />
<script type="text/javascript" src="assets/js/join.js"></script>
</head>
<body>

<header>
	<h2>아이디 중복확인</h2>
</header>
	<%
	String cus_id = request.getParameter("cus_id");
	CustomerDAO cusDAO = new CustomerDAO();
	boolean chk = cusDAO.idchk(cus_id);
	
	if(chk){
		out.print(cus_id + " 는 이미 존재하는 아이디입니다.");
	}else{
		out.print(cus_id + " 는 사용 가능한 아이디입니다.");
	}
	%>
	<p><a class="button small" onclick="window.close()">닫기</a></p>

</body>
</html>