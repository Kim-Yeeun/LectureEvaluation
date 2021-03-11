package univ;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class BoardDBCP {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public BoardDBCP() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void connect() {
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<BoardEntity> getBoardList() {
		connect();
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
		
		String SQL = "select * from board";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet result = pstmt.executeQuery();
			
			while (result.next()) {
				BoardEntity brd = new BoardEntity();
				brd.setId(result.getInt("id"));
				brd.setName(result.getString("name"));
				brd.setPasswd(result.getString("passwd"));
				brd.setTitle(result.getString("title"));
				brd.setEmail(result.getString("email"));
				brd.setRegdate(result.getTimestamp("regdate"));
				brd.setContent(result.getString("content"));
				
				list.add(brd);
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public BoardEntity getBoard(int id) {
		connect();
		
		String SQL = "select * from board where id = ?";
		BoardEntity brd = new BoardEntity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, id);
			ResultSet result = pstmt.executeQuery();
			result.next();
			brd.setId(result.getInt("id"));
			brd.setName(result.getString("name"));
			brd.setPasswd(result.getString("passwd"));
			brd.setTitle(result.getString("title"));
			brd.setEmail(result.getString("email"));
			brd.setRegdate(result.getTimestamp("regdate"));
			brd.setContent(result.getString("content"));
			
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return brd;
	}
	
	public boolean insertDB (BoardEntity board) {
		boolean success = false;
		connect();
		String sql = "insert into board values(0, ?, ?, ?, ?, sysdate(), ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getPasswd());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getContent());
			pstmt.executeUpdate();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}
	
	public boolean updateDB (BoardEntity board) {
		boolean success = false;
		connect();
		
		String sql = "update board set name=?, title=?, email=?, content=?, where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getId());
			
			int rowUdt = pstmt.executeUpdate();
			
			if (rowUdt == 1)
				success = true;
		} catch (Exception e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}
	
	public boolean deleteDB (int id) {
		boolean success = false;
		connect();
		
		String sql = "delete from board where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}
	
	public boolean isPasswd (int id, String passwd) {
		boolean success = false;
		connect();
		
		String sql = "select passwd from board where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet result = pstmt.executeQuery();
			result.next();
			String orgPasswd = result.getString(1);
			if (passwd.equals(orgPasswd))
				success = true;
			System.out.println(success);
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}

}
