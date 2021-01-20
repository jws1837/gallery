<%@page import="java.util.List"%>
<%@page import="model.GalleryDTO"%>
<%@page import="model.GalleryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 게시글 관리목록</title>
</head>

<body>
<% 
GalleryDAO galleryDAO = new GalleryDAO();
GalleryDTO galleryDTO = new GalleryDTO();
List  galleryList = galleryDAO.listGallery(galleryDTO);

%>
	<center>
		<h1>글 목록</h1>
	
		<!--  검색 시작  -->
		<form action="getBoardList.jsp" method="get">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
						<select id="searchCondition" name="searchCondition">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
						</select>
						<input id="searchKeyword" name="searchKeyword" type="text">
						<input type="submit" value="검색 ">
					</td>
				</tr>		
			</table>
		</form>
		<!-- 검색 종료  -->
	
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="gray" width="200">사진</th>
				<th bgcolor="gray" width="150">제목</th>
				<th bgcolor="gray" width="150">저자</th>
				<th bgcolor="gray" width="100">소개글</th>
			</tr>
			
			<%
			for(int i = 0; i<galleryList.size();i++){
				GalleryDTO galleryDTO2 = (GalleryDTO)galleryList.get(i);
				String fileName=galleryDTO2.getFileName();
				String title =galleryDTO2.getTitle();
				String author =galleryDTO2.getAuthor();
				String content =galleryDTO2.getContent();
			%>
			
			<tr>
			<td><img src="../gallery/uploadImage/<%=fileName %>"  width="100px" height="100px"></td>
			<td><%=title%></td>
			<td><%=author%></td>
			<td><%=content %></td>
			</tr>
			<%} %>
			

		</table>
		<br>
		<a href="galleryRegisterForm.jsp">새 글 등록</a>
	</center>
</body>
</html>