<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%@ page import="user.UserDTO" %>
	<%@ page import="user.UserDAO" %>
	<%@ page import="java.io.PrintWriter" %>
	
	<%
		request.setCharacterEncoding("euc-kr");
		String userID = null;
		String userPasswd = null;
		if (request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
		}
		if (request.getParameter("userPasswd") != null) {
			userPasswd = (String) request.getParameter("userPasswd");
		}
		if (userID == null || userPasswd == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(userID, userPasswd);
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입에 성공했습니다.');");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
	%>
</body>
</html>