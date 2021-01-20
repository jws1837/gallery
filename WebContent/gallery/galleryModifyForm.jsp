<%@page import="model.GalleryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
 <head>
 <style>
 
  

 </style>
 </head>
 <!--
    1. 전송하고자 하는 입력 폼을 <form>과 </form>사이에 위치해놓는다.
    2. action 값을 데이터를 전송받아서 처리할 곳으로 설정한다.
    3. method를 반드시 post로 설정해준다.
    4. enctype을 multipart/form-data로 설정한다.
    5. <form>과 </form>사이에 input type submit버튼을 위치시킨다.
 -->
 <%
 	ArrayList list =(ArrayList)request.getAttribute("list");
 	GalleryDTO dto =  (GalleryDTO) list.get(0);
 	String  fileName  =dto.getFileName();
 	String title = dto.getTitle();
 	String author= dto.getAuthor();
 	String content = dto.getContent();
 
 	String Path = request.getServletContext().getRealPath("gallery/uploadImage/");
 	String fullPath= Path+fileName;
 	String titleSearch = (String)request.getAttribute("title"); 
%>
 
 	
 
	<form action="update.gl" method="post" enctype="multipart/form-data">
		  <h1> 파일업로드 양식<br></h1> 
			   사진: <input type="file" required="required" name="file" ><img src=<%=fullPath %> width="20" height="20"><br><br>  
			   제목: <input type="text" name="title" value=<%=title %>><br>
			   저자: <input type="text" name="author"  value=<%=author %>><br>
			소개글   <textarea  name="content" rows="4" cols="50"><%=content %></textarea> 
		  
		  	     <input type="hidden" name= titlesearch value=<%=titleSearch%> >
			     <input type="submit" value="수정하기">
			     <button type="button" onclick="location.href='gallery/gallery_admin.jsp' ">뒤로가기</button>
			 
	</form>
</html>
