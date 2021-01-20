<%@page import="model.GalleryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
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
 
 
 
 	
 %>
	<form action="modify.gl" method="post" enctype="multipart/form-data">
	
	  <h1> 파일업로드 양식<br></h1> 
	   사진: <input type="file" name="file" value=<%=fileName %> ><br><br>  
	   제목: <input type="text" name="title" value=<%=title %>><br>
	   저자: <input type="text" name="author"  value=<%=author %>><br>
	   소개글: <input type="text" name="content" value=<%=content %> style="width:1000px;height:500px;font-size:15px;"><br> <!-- 이부분은 텍스트편집기로 또 추가해야할듯. --> 
	 <input type="submit" value="업로드"> 
	 
	</form>
</html>
