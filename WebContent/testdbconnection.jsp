<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.GalleryDTO"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="galleryDTO" class="model.GalleryDTO"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<h1>관리자 디비연결test </h1>


<%    
    ArrayList<GalleryDTO> galleryList=(ArrayList<GalleryDTO>)request.getAttribute("galleryList");
    for(int i=0;i<galleryList.size();i++){
       GalleryDTO galleryDTO = galleryList.get(i);    	
%>

</body>
</html>