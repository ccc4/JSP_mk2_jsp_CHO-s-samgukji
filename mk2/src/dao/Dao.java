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
	
	// �� �������� ������ �Խñ��� ��
	private static final int onePage = 5;
	// �ѹ��� ������ ������ ���� (1~10,11~20)
	private static final int oneSection = 10;
	
	
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
	
//	ȸ������ DAO
	
	public int uJoin(String id, String pw, String name, String nickname, int gender, int phone1, int phone2,
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
				re = 0; // ����
			} else {
				re = 1; // ����
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
	
	public int uLogin(String id, String pw) {

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
					re = 1; // �α��� ����
				} else {
					re = 0; // ��й�ȣ ����
				}
			} else {
				re = -1; // ���̵� ����
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
	
	public UDto getSession(String id) {

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
				String userNickname = rs.getString("userNickname");
				
				dto = new UDto(userIDX, userNickname);
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
	
	public UDto getUser(int sessionIDX) {

		UDto dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM user WHERE userIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sessionIDX);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String userID = rs.getString("userID");
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
				
				dto = new UDto(userID, userPassword, userName, userNickname, userGender, userPhone1, userPhone2, userEmail1, userEmail2, userAddress, userDate);
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
	
	public int uModify(int sessionIDX, String pw, String name, String nickname, int gender, int phone1, int phone2,
			String email1, String email2, String address) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE user SET userPassword = ?, userName = ?, userNickname = ?, userGender = ?, userPhone1 = ?, userPhone2 = ?, userEmail1 = ?, userEmail2 = ?, userAddress = ? WHERE userIDX = ?";
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
			pstmt.setInt(10, sessionIDX);
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
	
	public int uJoinCheckID(String id) {
		
		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT userID FROM user WHERE userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1; // �ߺ� ID ����
			} else {
				re = 0; // �ߺ� ID ���� x ȭ������ ����
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
	
	public int uJoinCheckNickname(String nickname) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT userNickname FROM user WHERE userNickname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1; // �ߺ� Nickname ����
			} else {
				re = 0; // �ߺ� Nickname ���� x ȭ������ ����
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
	
//	�Խ��� DAO
	
	public String bPaging(int pageNum) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// ����¡ ������ ����
		String paging = "";
		
		int page = pageNum;
		// �� �������� ������ �Խñ��� ��
		int onePage = Dao.onePage;
		// �ѹ��� ������ ������ ���� (1~10,11~20)
		int oneSection = Dao.oneSection;
		
		try {
			// ��ü �Խñ� ��
			conn = datasource.getConnection();
			String sql = "SELECT count(*) AS cnt FROM board WHERE bAvailable = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			rs = pstmt.executeQuery();
			
			int allPost = 0;
			while(rs.next()) {
				allPost = rs.getInt("cnt");				
			}
			// ��ü ������ ��
			int allPage = (int) Math.ceil((double)allPost / (double)onePage);
			
			if(page < 1 || page > allPage) {
				return "false";
			}
			
			// ���� ����
			int currentSection = (int) Math.ceil((double)page / (double)oneSection);
			// ��ü ���� ��
			int allSection = (int) Math.ceil((double)allPage / (double)oneSection);
			
			//���� ���� ù ������
			int firstPage = (currentSection * oneSection) - (oneSection -1);
			//���� ���� ������ ������
			int lastPage = 0;
			
			if(currentSection == allSection) {
				//���� ������ ������ �����̸� allPage�� ������ ������
				lastPage = allPage;
			} else {
				//���� ������ ������ ������
				lastPage = currentSection * oneSection;
			}
			
			//���� ������
			int prevPage = ((currentSection - 1) * oneSection);
			//���� ������
			int nextPage = ((currentSection + 1) * oneSection) - (oneSection -1);
			
// paging �ڵ�
			// ù �������� �ƴ϶�� ó�� ��ư ����
			if(page != 1) {
				paging += "<a href='board.do?page=1'>ó��</a>";
			} 
			
			// ù ������ �ƴ϶�� ���� ��ư ����
			if(currentSection != 1) {
				paging += "<a href='board.do?page=" + prevPage + "'>����</a>";
			}
			
			// ���� �� ������ ��ư ����
			for(int i = firstPage;i <= lastPage; i++) {
				if(i == page) {
					paging += "<strong>" + i + "</strong>";
				} else {
					paging += "<a href='board.do?page=" + i + "'>" + i + "</a>";
				}
			}
			
			// ������ ������ �ƴ϶�� ���� ��ư ����
			if(currentSection != allSection) {
				paging += "<a href='board.do?page=" + nextPage + "'>����</a>";
			}
			
			// ������ �������� �ƴ϶�� �� ��ư ����
			if(page != allPage) {
				paging += "<a href='board.do?page=" + allPage + "'>��</a>";
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
		
		return paging;
		
	}
	
	public ArrayList<BDto> bList(int pageNum) {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int page = pageNum;
		int onePage = Dao.onePage;	// �� �������� ������ �Խñ��� ��
		int currentLimit = (onePage * page) - onePage;	// �� ��° �ۺ��� ����������
		String sqlLimit = " LIMIT " + currentLimit + ", " + onePage;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM board WHERE bAvailable = ? ORDER BY bIDX DESC" + sqlLimit;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bIDX = rs.getInt("bIDX");
				int bUserIDX = rs.getInt("bUserIDX");
				String bNickname = rs.getString("bNickname");
				String bTitle = rs.getString("bTitle").replaceAll(" ", "&nbsp;").replaceAll("<",  "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
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
	
	public int bWrite(int sessionIDX, String nickname, String title, String content) {
		
		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "INSERT INTO board (bUserIDX, bNickname, bTitle, bContent) VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sessionIDX);;
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
			String sql = "SELECT * FROM board WHERE bIDX = ? AND bAvailable = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setInt(2, 1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bIDX = rs.getInt("bIDX");
				int bUserIDX = rs.getInt("bUserIDX");
				String bNickname = rs.getString("bNickname");
				String bTitle = rs.getString("bTitle").replaceAll(" ", "&nbsp;").replaceAll("<",  "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
				String bContent = rs.getString("bContent").replaceAll(" ", "&nbsp;").replaceAll("<",  "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
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
			String sql = "UPDATE board SET bHit = bHit + 1 WHERE bIDX = ? AND bAvailable = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setInt(2, 1);
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
	
	public BDto bGetContent(String idx) {
		
		BDto dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM board WHERE bIDX = ? AND bAvailable = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setInt(2, 1);
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
	
	public int bModify(String idx, int sessionIDX, String title, String content) {

		int re = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE board SET bTitle = ?, bContent = ? WHERE bIDX = ? AND bUserIDX = ? AND bAvailable = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, idx);
			pstmt.setInt(4, sessionIDX);
			pstmt.setInt(5, 1);
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
			String sql = "UPDATE board SET bAvailable = ? WHERE bIDX = ? AND bUserIDX = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, idx);
			pstmt.setString(3, userIDX);
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
