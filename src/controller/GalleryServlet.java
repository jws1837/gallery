package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.GalleryDAO;
import model.GalleryDTO;


@WebServlet("*.gl")
public class GalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private model.GalleryDTO galleryDTO;
	private model.GalleryDAO galleryDAO;
	
	  
	    public GalleryServlet() {
	    	galleryDTO = new GalleryDTO();
	    	galleryDAO = new GalleryDAO();
	    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				doHandle(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doHandle(request,response);
		} catch (SQLException e) {
			e.printStackTrace();
		}}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String context = request.getContextPath();
		String uri = request.getRequestURI();
		String command = uri.substring(context.length());
	/**================================================갤러리 게시글 등록,수정,삭제====================**/
		/**갤러리 게시글 등록.**/
		if(command.equals("/gallery/register.gl")) {
			String savePath = request.getServletContext().getRealPath("gallery/uploadImage");
			int sizeLimit = 1024*1024*15; //1byte단위
			 
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
			String title= multi.getParameter("title");
			String author = multi.getParameter("author");
			String content = multi.getParameter("content");
			
			String fileName = multi.getFilesystemName("file"); //말그대로 파일이름만. 
//			String fileFullPath = savePath+"/"+fileName; //서버저장경로
			GalleryDTO galleryDTO = new GalleryDTO();
			GalleryDAO galleryDAO = new GalleryDAO();
			galleryDTO.setAuthor(author);
			galleryDTO.setContent(content);
			galleryDTO.setFileName(fileName);
			galleryDTO.setTitle(title);
			try {
				galleryDAO.galResigter(galleryDTO);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			out.println("db에 업로드가 완료되었습니다. ");
			
			response.sendRedirect("gallery_admin.jsp");
		}
		/**갤러리 게시글 삭제.**/
		else if(command.equals("/delete.gl")){
			String title = request.getParameter("title");
			try {
				galleryDAO.galDelete(title);
				
			} catch (SQLException e) {
			}
			//실제 이미지파일도 삭제해야함.
			galleryDTO = new GalleryDTO();
			String savePath = request.getServletContext().getRealPath("gallery/uploadImage");
			String fullPath = savePath+galleryDTO.getFileName();
			File file = new File(fullPath);
			file.delete();
			out.println("<script>location.href='gallery/gallery_admin.jsp'</script>");
		}
		/**갤러리 게시글 폼으로 이동**/
		else if(command.equals("/modify.gl")) {
			String titleSearch = request.getParameter("title"); //됨
			ArrayList list  =galleryDAO.galleryModifySearch(titleSearch);
			request.setAttribute("title", titleSearch);
			RequestDispatcher dis = request.getRequestDispatcher("gallery/galleryModifyForm.jsp");
			request.setAttribute("list", list);
			dis.forward(request, response);
			
		/**게시글폼에서 수정누르면 업데이트**/	
		}	else if(command.equals("/update.gl")) {
			String savePath = request.getServletContext().getRealPath("gallery/uploadImage");
			int sizeLimit = 1024*1024*15; //1byte단위
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		
			
			String titleSearch = multi.getParameter("titlesearch"); 
			String title= multi.getParameter("title");
			String author = multi.getParameter("author");
			String content = multi.getParameter("content");
			
			String fileName = multi.getFilesystemName("file"); //말그대로 파일이름만.
			
//			String fileFullPath = savePath+"/"+fileName; //서버저장경로
			GalleryDTO galleryDTO = new GalleryDTO();
			GalleryDAO galleryDAO = new GalleryDAO();
			galleryDTO.setAuthor(author);
			galleryDTO.setContent(content);
			galleryDTO.setFileName(fileName);
			galleryDTO.setTitle(title);
			try {
				galleryDAO.galUpdate(galleryDTO,titleSearch);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			out.println("수정되었습니다.");
			
			out.println("<script>location.href='gallery/gallery_admin.jsp'</script>");
			
//			String title = request.getParameter("title");
//			
//			ArrayList list  =galleryDAO.galleryModifySearch(title);;
//			RequestDispatcher dis = request.getRequestDispatcher("gallery/galleryModifyForm.jsp");
//			request.setAttribute("list", list);
//			dis.forward(request, response);
			
			
		}

		
	}
}

