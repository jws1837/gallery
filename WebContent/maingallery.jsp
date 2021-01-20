<%@page import="java.util.List"%>
<%@page import="model.GalleryDTO"%>
<%@page import="model.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <style>
        .card-title{
            color: red;
        }
        .my-4{
        color:red;
        }
       #abcd{
       height       : 100px;
       text-overflow: ellipsis; 
       overflow     : hidden; 
       }
       
    </style>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="assets/css/shop-homepage.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">artwork list</h1>
      

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src= "images/9003501.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src= "images/9003502.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="images/9003503.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
        <% 
		GalleryDAO galleryDAO = new GalleryDAO();
		GalleryDTO galleryDTO = new GalleryDTO();
		List  galleryList = galleryDAO.listGallery(galleryDTO);
		 
		%>

			<%
			for(int i = 0; i<galleryList.size();i++){
				GalleryDTO galleryDTO2 = (GalleryDTO)galleryList.get(i);
				String fileName=galleryDTO2.getFileName();
				String title =galleryDTO2.getTitle();
				String author =galleryDTO2.getAuthor();
				String content =galleryDTO2.getContent();
			%>
			


			 <div  class="col-lg-4 col-md-6 mb-4" >
            <div  class="card h-100">
              <a href="gallery/galleryDetatil<%=i+1%>.jsp"><img class="card-img-top" src="gallery/uploadImage/<%=fileName %>" width="200" height="200" alt="/gallery/uploadImage/7004001.jpg" width="300px" height="100px"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="gallery/galleryDetatil<%=i+1%>.jsp">#<%=i+1 %></a>
                </h4>
                <h5 style="color:#c8daf7"><%=title%></h5>
                <p id="abcd" class="card-text"><%=content %></p>
              </div>
              
            </div>
          </div>

        
        <%} %>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy;2021 InputStream4 <br>권은혜 김민종 이동엽 안소영 박민정 박창휘 전원식</p>
      
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
