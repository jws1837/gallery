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
 
	<form action="register.gl" method="post" enctype="multipart/form-data">
	
	  <h1> 파일업로드 양식<br></h1> 
	   사진: <input type="file" name="file"><br><br>  
	   제목: <input type="text" name="title"><br>
	   저자: <input type="text" name="author" ><br>
	   소개글: <input type="text" name="content" style="width:1000px;height:500px;font-size:15px;"><br> <!-- 이부분은 텍스트편집기로 또 추가해야할듯. --> 
	 <input type="submit" value="업로드"> 
	 
	</form>
</html>
