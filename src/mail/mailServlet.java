package mail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mailTest
 */
@WebServlet("/mailFunction")
public class mailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	     PrintWriter pw = response.getWriter();
		
		 Mailer mailer = new Mailer();
		 String senderEmail = "jws1837@gmail.com";
		 String senderPassword = "kcwlgompllylzaoo";
		 String receiverEmail=request.getParameter("email");//input에서 받은 이메잉 String email = .;
		 String name = request.getParameter("name");
		 String message = request.getParameter("message");
	     try {
			Mailer.send(senderEmail, senderPassword, receiverEmail, name, message);
		} catch (Exception e) {
			pw.println("<script>alert('메일전송에 실패하였습니다. 유효한 이메일을 입력해주시기 바랍니다.'); location.href='index.jsp';</script>");
			return;
		}  
	     
	
	     pw.println("<body>");
	     pw.println("<script>alert('메일전송이 완료되었습니다. '); location.href='index.jsp';</script>"); 
		 pw.close();
	     pw.println("</body>");
	     
	    

	}

}
