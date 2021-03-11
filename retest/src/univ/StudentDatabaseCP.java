package univ;

import java.sql.*;
import javax.sql.DataSource;
import java.util.ArrayList;
import javax.naming.InitialContext;

public class StudentDatabaseCP {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public StudentDatabaseCP() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void connect() {
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<StudentEntity> getStudentList() {
		connect();
		ArrayList<StudentEntity> list = new ArrayList<StudentEntity> ();
		
		String SQL = "select * from student";
		
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StudentEntity stu = new StudentEntity();
				
				stu.setId(rs.getString("id"));
				stu.setPasswd(rs.getString("passwd"));
				stu.setName(rs.getString("name"));
				stu.setYear(rs.getInt("year"));
				stu.setSnum(rs.getString("snum"));
				stu.setDepart(rs.getString("depart"));
				stu.setMobile1(rs.getString("mobile1"));
				stu.setMobile2(rs.getString("mobile2"));
				stu.setAddress(rs.getString("address"));
				stu.setEmail(rs.getString("email"));
				
				list.add(stu);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
}
