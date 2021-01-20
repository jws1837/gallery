<%@page import="java.util.List"%>
<%@page import="model.GalleryDTO"%>
<%@page import="model.GalleryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Small Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../assets/css/small-business.css" rel="stylesheet">

</head>

<body>
	<%
		GalleryDAO galleryDAO = new GalleryDAO();
		GalleryDTO galleryDTO = new GalleryDTO();
		List galleryList = galleryDAO.listGallery(galleryDTO);
	%>
	<%
		for (int i = 0; i < 1; i++) {
			GalleryDTO galleryDTO2 = (GalleryDTO) galleryList.get(i);
			String fileName = galleryDTO2.getFileName();
			String title = galleryDTO2.getTitle();
			String author = galleryDTO2.getAuthor();
			String content = galleryDTO2.getContent();
	%>

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-0"
					src="../images/9004001.jpg" alt="">
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<h1 class="font-weight-light"><%=title%></h1>
				<br>


				<p><%=author%></p>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

		<!-- Call to Action Well -->
		<div class="card text-white bg-secondary my-5 py-4 text-left">
			<div class="card-body">
				<p class="text-white m-0" text-align>
					<%=content%>
				</p>
				<%
					}
				%>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">#4 Particlefield</h2>
						<p class="card-text">입자필드(Particlefield)는 디지털 크리에이티브 스튜디오로
							뮤직비디오, 모션 그래픽, 모션 포스터, VFX, 3D 애니메이션, 2D 그래픽을 포함해 모든 스크린의 이미지와
							움직임을 제작합니다. 입자필드의 작업은 K-pop, 밈(meme) ...</p>
					</div>
					<div class="card-footer">
						<a href="gallery4.html" class="btn btn-primary btn-sm">More
							Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">#5 Doron Sadja</h2>
						<p class="card-text">이번 디스토리에서는 사운드와 라이트 아티스트인 도론 사제(Doron
							Sadja)를 만나보겠습니다. 《SOUNDMUSEUM: 너의 감정과 기억》 전시 참여 작가로서키네틱 사운드
							인스톨레이션 작업 ...</p>
					</div>
					<div class="card-footer">
						<a href="gallery5.html" class="btn btn-primary btn-sm">More
							Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">#6 Flora and Fauna</h2>
						<p class="card-text">전시장은 그 시도의 중심에 있는데요, 이번
							디스토리에서는《SOUNDMUSEUM: 너의 감정과 기억》의 공간 디자인을 담당해주신 플로라앤파우나(Flora and
							Fauna)의 이다미 건축가와의 협업 스토리를 담은 인터뷰를 ...</p>
					</div>
					<div class="card-footer">
						<a href="gallery6.html" class="btn btn-primary btn-sm">More
							Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

			<h3 class="my-4">
				<a href="../maingallery.jsp"> &nbsp;&nbsp;&nbsp; >> main gallery</a>
			</h3>

		</div>
		<br> <br> <br>

		<!-- /.row -->


		<!-- /.container -->

		<!-- Footer -->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">
					Copyright &copy;2021 InputStream4 <br>권은혜 김민종 이동엽 안소영 박민정 박창휘
					전원식
				</p>

			</div>
			<!-- /.container -->
		</footer>

		<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
