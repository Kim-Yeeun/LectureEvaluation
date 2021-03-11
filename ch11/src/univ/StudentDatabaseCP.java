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
	
	public ArrayList<StudentEntity> getStudentList() {
		connect();
		ArrayList<StudentEntity> list = new ArrayList<StudentEntity>();
		
		String SQL = "select * from student";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet result = pstmt.executeQuery();
			
			while (result.next()) {
				StudentEntity stu = new StudentEntity();
				
				stu.setId(result.getString("id"));
				stu.setPasswd(result.getString("passwd"));
				stu.setName(result.getString("name"));
				stu.setYear(result.getInt("year"));
				stu.setSnum(result.getString("snum"));
				stu.setDepart(result.getString("depart"));
				stu.setMobile1(result.getString("mobile1"));
				stu.setMobile2(result.getString("mobile2"));
				stu.setAddress(result.getString("address"));
				stu.setEmail(result.getString("email"));
				
				list.add(stu);
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
}
