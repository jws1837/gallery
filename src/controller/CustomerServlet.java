package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDAO;
import model.CustomerDTO;

@WebServlet("*.cu")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDTO cusDTO;
	private CustomerDAO cusDAO;
	private ResultSet rs;
	private HttpSession session;
	private String cus_id;
	private String cus_pw;
	private int cnt;

	public CustomerServlet() {
		cusDTO = new CustomerDTO();
		cusDAO = new CustomerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		String command = uri.substring(context.length());
		
		if(command.equals("/register.cu")) {		//회원가입
			cusDTO.setCus_id(request.getParameter("cus_id"));
			cusDTO.setCus_pw(request.getParameter("cus_pw"));
			cusDTO.setCus_name(request.getParameter("cus_name"));
			cusDTO.setCus_tel(request.getParameter("cus_tel"));
			cusDTO.setCus_email(request.getParameter("cus_email"));
			cnt=0;
			try {
				cnt = cusDAO.cusResigter(cusDTO);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print("<script>");
			out.print("alert('"+cnt+"명 가입되었습니다.');");
			out.print("location.href='index.jsp?page=customer/login.jsp';");
			out.print("</script>");
			
		}else if(command.equals("/update.cu")){			//회원정보수정
			cusDTO.setCus_id((String)session.getAttribute("cus_id"));
			cusDTO.setCus_pw(request.getParameter("cus_pw"));
			cusDTO.setCus_tel(request.getParameter("cus_tel"));
			cusDTO.setCus_email(request.getParameter("cus_email"));
			try {
				cnt = cusDAO.cusUpdate(cusDTO);
				out.print("<script>");
				out.print("alert('"+cnt+"명 수정되었습니다.');");
				out.print("location.href='search.cu'");
				out.print("</script>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/delete.cu")) {		//회원탈퇴
			cus_id = (String)session.getAttribute("cus_id");
			cus_pw = request.getParameter("cus_pw");
			try {
				cnt = cusDAO.cusDelete(cus_id, cus_pw);
				if(cnt==0) {
					out.print("<script>");
					out.print("alert('비밀번호가 옳지 않습니다.');");
					out.print("history.back();");
					out.print("</script>");
				}else {
					out.print("<script>");
					out.print("alert('"+cnt+"명 탈퇴되었습니다.');");
					session.invalidate();
					out.print("location.href='index.jsp'");
					out.print("</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/inform.cu")) {		//회원정보
			cus_id = (String)session.getAttribute("cus_id");
			cus_pw = request.getParameter("cus_pw");
			try {
				rs = cusDAO.cusLogin(cus_id, cus_pw);
				if(!rs.isBeforeFirst()) {
					out.print("<script>");
					out.print("alert('비밀번호가 옳지 않습니다.');");
					out.print("history.back();");
					out.print("</script>");
				}else {
					if(rs.next()) {
						cusDTO.setCus_id(rs.getString("cus_id"));
						cusDTO.setCus_name(rs.getString("cus_name"));
						cusDTO.setCus_tel(rs.getString("cus_tel"));
						cusDTO.setCus_email(rs.getString("cus_email"));
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=customer/mypage.jsp");
			request.setAttribute("cusDTO", cusDTO);
			dis.forward(request, response);
			
		}else if(command.equals("/login.cu")) {		//회원로그인
			cus_id = request.getParameter("cus_id");
			cus_pw = request.getParameter("cus_pw");
			try {
				rs = cusDAO.cusLogin(cus_id, cus_pw);
				if(!rs.isBeforeFirst()) {
					out.print("<script>");
					out.print("alert('아이디 혹은 비밀번호가 옳지 않습니다.');");
					out.print("history.back();");
					out.print("</script>");
				}else {
					if(rs.next()) {
						cusDTO.setCus_name(rs.getString("cus_name"));
						cusDTO.setCus_tel(rs.getString("cus_tel"));
						cusDTO.setCus_email(rs.getString("cus_email"));
						session=request.getSession();
						session.setAttribute("cus_id", cus_id);
						session.setAttribute("cus_name", cusDTO.getCus_name());
					}
					out.print("<script>");
					out.print("location.href='index.jsp'");
					out.print("</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
