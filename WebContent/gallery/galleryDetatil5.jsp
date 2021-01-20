<%@page import="java.util.List"%>
<%@page import="model.GalleryDTO"%>
<%@page import="model.GalleryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
<style>
div{margin:40px;

}
</style>

</head>

<body>
<% 
GalleryDAO galleryDAO = new GalleryDAO();
GalleryDTO galleryDTO = new GalleryDTO();
List  galleryList = galleryDAO.listGallery(galleryDTO);

%>
	<center>
	
			
			
			<%
			for(int i = 4; i<5;i++){
				GalleryDTO galleryDTO2 = (GalleryDTO)galleryList.get(i);
				String fileName=galleryDTO2.getFileName();
				String title =galleryDTO2.getTitle();
				String author =galleryDTO2.getAuthor();
				String content =galleryDTO2.getContent();
			%>
			
			
			<div id=img>
			<img src="../gallery/uploadImage/<%=fileName %>"  width="700px" height="300px">
			</div>
			<div id=title>
			<h1>제목</h1><%=title%>
			</div>
			<div id=author>
			<h1>저자</h2><%=author%>
			</div>
		
			<div id=content>
				<h1><center>내용</center></h3>
			<%=content %>
			</div>
			
			
			<%} %>
			

		<br>
		<button><a href="../maingallery.jsp">뒤로가기</a></button>
	</center>
</body>
</html>