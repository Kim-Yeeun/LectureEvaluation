<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제</title>
</head>
<body>
	<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
	
	<h2> Jakarta DBCP를 이용한 DB univdb 연결 점검 프로그램 </h2>
	<%
	try {
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		Connection con = ds.getConnection();
		
		out.println("MySql 데이터베이스 univdb에 성공적으로 접속했습니다.");
		con.close();
	} catch (Exception e) {
		out.println("MySql 데이터베이스 univdb 접속에 문제가 있습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	%>
</body>
</html>