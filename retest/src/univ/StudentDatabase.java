package univ;

import java.sql.*;
import java.util.ArrayList;

public class StudentDatabase {

	private static final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/univdb";
	private static final String USER = "root";
	private static final String PASSWD = "kimyeeun";
	
	private Connection con = null;
	private Statement stmt = null;
	
	public StudentDatabase() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void connect() {
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if (stmt != null) {
			try {
				stmt.close();
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
		
		ArrayList<StudentEntity> list = new ArrayList<StudentEntity>();
		
		String SQL = "select * from student";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
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
