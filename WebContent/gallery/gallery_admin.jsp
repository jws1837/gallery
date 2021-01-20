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
<title>갤러리 게시글 관리목록</title>
<style>
a:link, a:visited {
  background-color: #f22336;
  color: white;
  padding: 10px 10px ;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: red;
}
.link{ /* 수정삭제버튼 너무 왼쪽에 있어서 */
margin-left: 20px;
   
}
#abcd{
		height: 100px;
       width       : 100px;
       text-overflow: ellipsis; 
       overflow     : hidden; 
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
		<h1>갤러리 관리</h1>
	
		<table border="1" cellpadding="0" cellspacing="0" width="700"  >
			<tr>
				<th bgcolor="gray" width="200">사진</th>
				<th bgcolor="gray" width="150">제목</th>
				<th bgcolor="gray" width="150">저자</th>
				<th bgcolor="gray" width="100">소개글</th>
				<th bgcolor="gray" width="100">수정</th>
				<th bgcolor="gray" width="100">삭제</th>
			</tr>
			
			
			<%
			for(int i = 0; i<galleryList.size();i++){
				GalleryDTO galleryDTO2 = (GalleryDTO)galleryList.get(i);
				String fileName=galleryDTO2.getFileName();
				String title =galleryDTO2.getTitle();
				String author =galleryDTO2.getAuthor();
				String contentSrc =galleryDTO2.getContent();
				String content=null;
				if(contentSrc.length()<10){
					content = galleryDTO2.getContent();
				}else{
					content = galleryDTO2.getContent().substring(1,10)+"...";
				}
				
			%>
			
			
			<tr nowrap width="20" height="20"  >
			<td nowrap><img src="../gallery/uploadImage/<%=fileName %>"  width="100px" height="100px"></td>
			<td nowrap><%=title%></td>
			<td nowrap><%=author%></td>
			<td id="abcd" nowrap><%=content %></td>
			<td><a class="link" href="../modify.gl?title=<%=title%>">수정</a></td>
			<td><a class="link" href="../delete.gl?title=<%=title%>">삭제</a></td>
			
			</tr>
			<%} %>
			

		</table>
		<br>
		<a href="galleryRegisterForm.jsp">새 글 등록</a>
	</center>
</body>
</html>