package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DatabaseUtil;

public class UserDAO {
	
	public int join(String userID, String userPasswd) {
		String SQL = "insert into USER values (?, ?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userID);
			pstmt.setString(2, userPasswd);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

}
