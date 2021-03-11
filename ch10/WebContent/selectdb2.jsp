<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제 selectdb2.jsp</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	
	<h2> 데이터베이스 univdb의 테이블 department 조회 프로그램 </h2>
	<hr>
	<center>
	<h2> 학과정보 조회 </h2>
	<%
		Connection con = null;
		Statement stmt = null;
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost/univdb";
		
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, "root", "kimyeeun");
			stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("select * from department;");
	%>
	
	<table width=100% border=2 cellpadding=1>
	<tr>
		<td align=center> <b> 학과번호 </b> </td>
		<td align=center> <b> 학과이름 </b> </td>
		<td align=center> <b> 정원 </b> </td>
		<td align=center> <b> 홈페이지 </b> </td>
	</tr>
	<%
			while (result.next()) {
	%>
	<tr>
		<td align=center> <%= result.getString(1) %> </td>
		<td align=center> <%= result.getString(2) %> </td>
		<td align=center> <%= result.getString(3) %> </td>
		<td align=center> <%= result.getString(4) %> </td>
	</tr>
	<%
			}
			result.close();
		} catch (Exception e) {
			out.println("MySql 데이터베이스 univdb의 department 조회에 문제가 있습니다. <hr>");
			out.println(e.toString());
			e.printStackTrace();
		} finally {
			if (con != null)
				con.close();
			if (stmt != null)
				stmt.close();
		}
	%>
	</table>
	</center>
</body>
</html>