<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>테스트 페이지</title>
</head>
<body>
	Hello World!
	<form action="./userJoinAction.jsp" method="post">
		<input type="text" name="userID">
		<input type="password" name="userPasswd">
		<input type="submit" value="회원가입">
	</form>

</body>
</html>