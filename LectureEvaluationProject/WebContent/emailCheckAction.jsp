<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");

	String code = null;
	if (session.getAttribute("code") != null) {
		code = (String) session.getAttribute("code");
	}
	String userID = null;
	UserDAO userDAO = new UserDAO();
	
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href='userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String userEmail = userDAO.getUserEmail(userID);
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if (isRight == true) {
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 코드입니다.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
	}
	
	
%>

</body>
</html>