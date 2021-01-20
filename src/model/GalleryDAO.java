package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


public class GalleryDAO {
	DataSource data;
	Connection conn;
	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	int cnt;
	private model.GalleryDTO GalleryDTO;
	

	public GalleryDAO() {
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
	
	
	public int galResigter(GalleryDTO galDTO)throws SQLException {			//갤러리 게시글 등록. 
//		conn = data.getConnection();
		sql = "insert into gallery value(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, galDTO.getFileName());
		pstmt.setString(2, galDTO.getTitle());
		pstmt.setString(3, galDTO.getAuthor());
		pstmt.setString(4, galDTO.getContent());
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	

	
	

	public int galDelete(String title)throws SQLException {    ////갤러리 게시글  삭제
		sql = "delete from gallery where title=? ";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		cnt = pstmt.executeUpdate();
		
		
//		sql = "select filename from gallery where title=?";
//		pstmt=conn.prepareStatement(sql);
//		pstmt.setString(1, title);
//		ResultSet rs = pstmt.executeQuery();
//		String fileName=null;
//		while(rs.next()){
//			fileName = rs.getString(1);
//		}
//		GalleryDTO galleryDTO = new GalleryDTO();
//		galleryDTO.setFileName(fileName);
		return cnt;
	}
//	
	public int galUpdate (GalleryDTO galDTO)throws SQLException {			////갤러리 게시글  수정
		sql = "update gallery set cus_pw=?,cus_tel=?,cus_email=? where cus_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, galDTO.getFileName());
		pstmt.setString(2, galDTO.getTitle());
		pstmt.setString(3, galDTO.getAuthor());
		pstmt.setString(4, galDTO.getContent());
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	public List listGallery(GalleryDTO galleryDTO) {
		
		List<GalleryDTO> galleryList= new ArrayList();
		sql = "select * from gallery";
		try {
			pstmt=conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				galleryDTO = new GalleryDTO();
				String fileName = rs.getString("filename");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String content = rs.getString("content");
				galleryDTO.setFileName(fileName);
				galleryDTO.setTitle(title);
				galleryDTO.setAuthor(author);
				galleryDTO.setContent(content);
				galleryList.add(galleryDTO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return galleryList;
		
	}


	public GalleryDTO getrealdata() {
		
		return null;
	}
	public ArrayList<GalleryDTO> galleryModifySearch(String title) throws SQLException {
		ArrayList<GalleryDTO> list = new ArrayList<GalleryDTO>(); 
		GalleryDTO galleryDTO= new model.GalleryDTO();
		sql = "select * from gallery where title=? ";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		ResultSet rs =  pstmt.executeQuery();
		while(rs.next()) {
			galleryDTO.setFileName(rs.getString("filename"));
			galleryDTO.setTitle(rs.getString("title"));
			galleryDTO.setAuthor(rs.getString("author"));
			galleryDTO.setContent(rs.getString("content"));
			list.add(galleryDTO);
		}
		return list;
		
	}
	

}
