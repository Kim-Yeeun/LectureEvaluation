package univ;

import java.sql.*;
import java.util.ArrayList;

public class StudentDatabase {
	
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/univdb";
	private static final String USER = "root";
	private static final String PASSWD = "kimyeeun";
	
	private Connection con = null;
	private Statement stmt = null;
	
	public StudentDatabase() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e){
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
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<StudentEntity>getStudentList() {
		connect();
		
		ArrayList<StudentEntity>list = new ArrayList<StudentEntity> ();
		
		String SQL = "select * from student";
		try {
			stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(SQL);
			
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
}
