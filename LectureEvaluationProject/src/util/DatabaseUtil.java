package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
			try {
				String dbURL = "jdbc:mysql://localhost:3306/LectureEvaluation?serverTimezone=UTC";
				String dbID = "root";
				String dbPasswd = "kimyeeun";
				Class.forName("com.mysql.jdbc.Driver");
				return DriverManager.getConnection(dbURL, dbID, dbPasswd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	}
}
