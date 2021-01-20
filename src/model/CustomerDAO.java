package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CustomerDAO {
	DataSource data;
	Connection conn;
	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	int cnt;
	
//	public CustomerDAO() {
//		try {
//			Context ctx = new InitialContext();
//			data = (DataSource)ctx.lookup("java:comp/env/inputstream");
//		} catch (NamingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	public CustomerDAO() {
		String url ="jdbc:mysql://inputstream.cafe24.com:3306/inputstream";
		String dbid = "inputstream";
		String dbpw = "outputStream1";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, dbid,dbpw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int cusResigter(CustomerDTO cusDTO)throws SQLException {			//회원가입
//		conn = data.getConnection();
		sql = "insert into customer value(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cusDTO.getCus_id());
		pstmt.setString(2, cusDTO.getCus_pw());
		pstmt.setString(3, cusDTO.getCus_name());
		pstmt.setString(4, cusDTO.getCus_tel());
		pstmt.setString(5, cusDTO.getCus_email());
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	

	public ResultSet cusLogin(String cus_id, String cus_pw)throws SQLException {		//로그인
//		conn = data.getConnection();
		sql = "select cus_id,cus_pw,cus_name,cus_tel,cus_email from customer where cus_id=? and cus_pw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cus_id);
		pstmt.setString(2, cus_pw);
		rs = pstmt.executeQuery();
		return rs;
	}
	
	public boolean idchk(String cus_id)throws SQLException {	//아이디 중복체크
//		conn = data.getConnection();
		sql = "select cus_id from customer where cus_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, cus_id);
		rs = pstmt.executeQuery();
		boolean chk = rs.next();
		return chk;
	}
	
	public int cusDelete(String cus_id, String cus_pw)throws SQLException {
		sql = "delete from customer where cus_id=? and cus_pw=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, cus_id);
		pstmt.setString(2, cus_pw);
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	
	public int cusUpdate (CustomerDTO cusDTO)throws SQLException {
		sql = "update customer set cus_pw=?,cus_tel=?,cus_email=? where cus_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, cusDTO.getCus_pw());
		pstmt.setString(2, cusDTO.getCus_tel());
		pstmt.setString(3, cusDTO.getCus_email());
		pstmt.setString(4, cusDTO.getCus_id());
		cnt = pstmt.executeUpdate();
		return cnt;
	}
}
