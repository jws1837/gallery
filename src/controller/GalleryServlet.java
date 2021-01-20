package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			doPost(request,response);}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String context = request.getContextPath();
		String uri = request.getRequestURI();
		String command = uri.substring(context.length());
		
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
		
		else if(command.equals("gallery/delete.gl")){
			request.getParameter("delete1");
			GalleryDTO galleryDTO = galleryDAO.getrealdata();
			FileM
		}
//		String requestURI = request.getRequestURI();
//		String contextPath = request.getContextPath();
//		String command = requestURI.substring(contextPath.length());
//		HttpSession session=request.getSession();
//		if(command.equals("/GalleryRegister.gl")) {
//		}
//		MyUtil myUtil = new MyUtil();

//		String cp = request.getContextPath();
//
//		String uri = request.getRequestURI();
//
//		String url;
//
//		// 파일 업로드 위치 지정
//
//		String root = getServletContext().getRealPath("/");
//
//		String path = root + File.separator + "pds" + File.separator+ "imageFile";
//
//		File f = new File(path);
//
//		if (!f.exists()) {
//
//			f.mkdirs();
//
//		}
//
//
//
//		if (uri.indexOf("write.do") != -1) {
//
//			url = "/imageTest/write.jsp";
//
//			forward(request, response, url);
//
//
//
//		} else if (uri.indexOf("write_ok.do") != -1) {
//
//			String encType = "UTF-8";
//
//			
//
//			int maxSize = 10 * 1024 * 1024;
//
//			// 파일 업로드
//
//			MultipartRequest mr = new MultipartRequest(request, path, maxSize,encType, new DefaultFileRenamePolicy());
//
//			// DB에 파일정보 입력
//
//			// 업로드한 파일로부터 정보 추출
//
////			if (mr.getFile("uploadFile") != null) {// null이 아니면 파일이 제대로 업로드된것
////
////				GalleryDTO dto = new GalleryDTO();
////
////				int maxNum = galleryDAO.getMaxNum();
////
////				dto.setNum(maxNum + 1);
////
////				dto.setSubject(mr.getParameter("subject"));
////
////				dto.setSaveFileName(mr.getFilesystemName("uploadFile"));
////
////				dao.insertData(dto);
////
////			}
//
//			// list.do 페이지로 리다이렉트
//
//			url = cp + "/image/list.do";
//
//			response.sendRedirect(url);
//
//
//
//		} else if (uri.indexOf("list.do") != -1) {
//
//			String pageNum = req.getParameter("pageNum");
//
//			int currentPage = 1; // 처음 띄우는 리스트 페이지
//
//			if (pageNum != null) {
//
//				currentPage = Integer.parseInt(pageNum);
//
//			}
//
//			int dataCount = dao.getDataCount();
//
//			int numPerPage = 9;
//
//			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
//
//			if (currentPage > totalPage)
//
//				currentPage = totalPage;
//
//			int start = (currentPage - 1) * numPerPage + 1;
//
//			int end = currentPage * numPerPage;
//
//			String listUrl = cp + "/image/list.do";
//
//			List<imageTestDTO> lists = dao.getList(start, end);
//
//			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage,
//
//					listUrl);
//
//			// 삭제경로
//
//			String deletePath = cp + "/image/delete.do";
//
//			// 이미지파일경로
//
//			String imagePath = cp + "/pds/imageFile";
//
//			req.setAttribute("imagePath", imagePath);
//
//			
//
//			int totalArticle = dao.getDataCount();
//
//			// 파일정보 테이블을 리스트로 전달
//
//			req.setAttribute("lists", lists);
//
//			req.setAttribute("pageNum", pageNum);
//
//			req.setAttribute("currentPage", currentPage);
//
//			req.setAttribute("deletePath", deletePath);
//
//			req.setAttribute("pageIndexList", pageIndexList);
//
//			req.setAttribute("totalArticle", totalArticle);
//
//			req.setAttribute("totalPage", totalPage);
//
//			
//
//			// list.jsp 페이지로 포워드
//
//			url = "/imageTest/list.jsp";
//
//			forward(req, resp, url);
//
//
//
//		} else if (uri.indexOf("delete.do") != -1) {
//
//			int num = Integer.parseInt(req.getParameter("num"));
//
//			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
//
//					
//
//			imageTestDTO dto = dao.getReadData(num);
//
//			// 물리적 파일 삭제
//
//			FileManager.doFileDelete(dto.getSaveFileName(), path);
//
//			// 테이블 정보 삭제
//
//			dao.deleteData(num);
//
//			// 삭제 진행 후 리스트 페이지로 리다이렉트
//
//			url = cp + "/image/list.do?pageNum=" + pageNum;
//
//			resp.sendRedirect(url);

		
	}
}
