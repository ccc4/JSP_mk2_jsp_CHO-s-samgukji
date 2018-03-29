package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.BDto;
import dto.UDto;

import javax.naming.Context;
import javax.naming.InitialContext;

public class Dao {
	
	DataSource datasource;
	
	private static Dao instance = new Dao();
	public static Dao getInstance() {
		return instance;
	}
	private Dao() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	회원정보 DAO
	
	public int ujoin(String id, String pw, String name, String nickname, int gender, int phone1, int phone2,
			String email1, String email2, String address) {
		
		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "INSERT INTO user (userID, userPassword, userName, userNickname, userGender, userPhone1, userPhone2, userEmail1, userEmail2, userAddress) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, nickname);
			pstmt.setInt(5, gender);
			pstmt.setInt(6, phone1);
			pstmt.setInt(7, phone2);
			pstmt.setString(8, email1);
			pstmt.setString(9, email2);
			pstmt.setString(10, address);
			int check = pstmt.executeUpdate();
			
			if(check == 0) {
				re = 0; // 실패
			} else {
				re = 1; // 성공
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public int ulogin(String id, String pw) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT userPassword FROM user WHERE userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("userPassword").equals(pw)) {
					re = 1; // 로그인 성공
				} else {
					re = 0; // 비밀번호 오류
				}
			} else {
				re = -1; // 아이디 오류
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public UDto getUser(String id) {

		UDto dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM user WHERE userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int userIDX = rs.getInt("userIDX");
				String userPassword = rs.getString("userPassword");
				String userName = rs.getString("userName");
				String userNickname = rs.getString("userNickname");
				int userGender = rs.getInt("userGender");
				int userPhone1 = rs.getInt("userPhone1");
				int userPhone2 = rs.getInt("userPhone2");
				String userEmail1 = rs.getString("userEmail1");
				String userEmail2 = rs.getString("userEmail2");
				String userAddress = rs.getString("userAddress");
				Timestamp userDate = rs.getTimestamp("userDate");
				
				dto = new UDto(userIDX, userPassword, userName, userNickname, userGender, userPhone1, userPhone2, userEmail1, userEmail2, userAddress, userDate);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public int uModify(String id, String pw, String name, String nickname, int gender, int phone1, int phone2,
			String email1, String email2, String address) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE user SET userPassword = ?, userName = ?, userNickname = ?, userGender = ?, userPhone1 = ?, userPhone2 = ?, userEmail1 = ?, userEmail2 = ?, userAddress = ? WHERE userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, nickname);
			pstmt.setInt(4, gender);
			pstmt.setInt(5, phone1);
			pstmt.setInt(6, phone2);
			pstmt.setString(7, email1);
			pstmt.setString(8, email2);
			pstmt.setString(9, address);
			pstmt.setString(10, id);
			int check = pstmt.executeUpdate();
			
			if(check == 0) {
				re = 0;				
			} else {
				re = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
//	게시판 DAO
	
	public ArrayList<BDto> bList() {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM board ORDER BY bIDX DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bIDX = rs.getInt("bIDX");
				int bUserIDX = rs.getInt("bUserIDX");
				String bNickname = rs.getString("bNickname");
				String bTitle = rs.getString("bTitle");
				Timestamp bDate = rs.getTimestamp("bDate");
				int bHit = rs.getInt("bHit");
				
				BDto dto = new BDto(bIDX, bUserIDX, bNickname, bTitle, bDate, bHit);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
	}
	
	public int bWrite(int userIDX, String nickname, String title, String content) {
		
		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "INSERT INTO board (bUserIDX, bNickname, bTitle, bContent) VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIDX);;
			pstmt.setString(2, nickname);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			int check = pstmt.executeUpdate();
			
			if(check == 0) {
				re = 0;
			} else {
				re = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public BDto bContentView(String idx) {
		
		upHit(idx);
		
		BDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM board WHERE bIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bIDX = rs.getInt("bIDX");
				int bUserIDX = rs.getInt("bUserIDX");
				String bNickname = rs.getString("bNickname");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Timestamp bDate = rs.getTimestamp("bDate");
				int bHit = rs.getInt("bHit");
				
				dto = new BDto(bIDX, bUserIDX, bNickname, bTitle, bContent, bDate, bHit);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
	}
	
	private void upHit(String idx) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE board SET bHit = bHit + 1 WHERE bIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			int check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	public BDto bContentModify(String idx) {
		
		BDto dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM board WHERE bIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bIDX = rs.getInt("bIDX");
				int bUserIDX = rs.getInt("bUserIDX");
				String bNickname = rs.getString("bNickname");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Timestamp bDate = rs.getTimestamp("bDate");
				int bHit = rs.getInt("bHit");
				
				dto = new BDto(bIDX, bUserIDX, bNickname, bTitle, bContent, bDate, bHit);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public int bModify(String idx, int userIDX, String title, String content) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE board SET bTitle = ?, bContent = ? WHERE bIDX = ? AND bUserIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, idx);
			pstmt.setInt(4, userIDX);
			int check = pstmt.executeUpdate();
			
			if(check == 0) {
				re = 0;
			} else {
				re = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public int bDelete(String idx, String userIDX) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "DELETE FROM board WHERE bIDX = ? AND buserIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, userIDX);
			int check = pstmt.executeUpdate();
			
			if(check == 0) {
				re = 0;
			} else {
				re = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	
}
