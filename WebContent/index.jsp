<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String pagefile=request.getParameter("page");
if(pagefile==null){
	pagefile="main.jsp";
} 
%>
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
		<jsp:include page="top.jsp"></jsp:include>
		<jsp:include page="<%=pagefile %>"></jsp:include>
		
	</body>
</html>