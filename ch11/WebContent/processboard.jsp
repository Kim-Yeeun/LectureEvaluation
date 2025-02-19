<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=EUC-KR">
<title> 게시판 기본 예제 : 게시 등록 수정 삭제 처리 </title>
</head>
<body>

	<jsp:useBean id="brd" class="univ.BoardEntity" scope="page" />
	<jsp:useBean id="brddb" class="univ.BoardDBCP" scope="page" />
	
	<%
		request.setCharacterEncoding("euc-kr");
	
		String menu = request.getParameter("menu");
		
		if (menu.equals("delete") || menu.equals("update")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			int idnum = Integer.parseInt(id);
		
			if (!brddb.isPasswd(idnum, passwd)) {
	%>
	
		<script> alert("비밀번호가 다릅니다."); history.go(-1); </script>
	<%
			} else {
				if (menu.equals("delete")) {
					brddb.deleteDB(idnum);
				} else if (menu.equals("update")) {
	%>
	
		<jsp:setProperty name="brd" property="id" />
		<jsp:setProperty name="brd" property="name" />
		<jsp:setProperty name="brd" property="title" />
		<jsp:setProperty name="brd" property="email" />
		<jsp:setProperty name="brd" property="content" />
	<%
					brddb.updateDB(brd);
					}
				response.sendRedirect("listboard.jsp");
				}
			} else if (menu.equals("insert")) {
	%>
	
		<jsp:setProperty name="brd" property="name" />
		<jsp:setProperty name="brd" property="title" />
		<jsp:setProperty name="brd" property="email" />
		<jsp:setProperty name="brd" property="content" />
		<jsp:setProperty name="brd" property="passwd" />
	<%
		brddb.insertDB(brd);
		response.sendRedirect("listboard.jsp");
		}
	%>
</body>
</html>