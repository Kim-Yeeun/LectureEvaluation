<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=EUC-KR">
<title> 게시판 기본 예제 : 게시 목록 표시 </title>
</head>
<body>
	<h2> 게시판 목록 표시 프로그램 </h2>
	
	<%@ page import="java.util.ArrayList, univ.BoardEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="brddb" class="univ.BoardDBCP" scope="page" />
	
	<center>
	<%
		ArrayList<BoardEntity> list = brddb.getBoardList();
		int counter = list.size();
		int row = 0;
		
		if (counter > 0) {
	%>
	<table width=800 border=0 cellpadding=1 cellspacing=3>
	<tr>
		<th> <font color=blue> <b> 번호 </b></font> </th>
		<th> <font color=blue> <b> 제목 </b></font> </th>
		<th> <font color=blue> <b> 작성자 </b></font> </th>
		<th> <font color=blue> <b> 작성일 </b></font> </th>
		<th> <font color=blue> <b> 전자메일 </b></font> </th>
	</tr>
	<%
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (BoardEntity brd : list) {
			String color = "papayawhip";
			if (++row % 2 == 0)
				color = "white";
	%>
	<tr bgcolor=<%= color %>
		onmouseover="this.style,backgroundColor='SkyBlue'"
		onmouseout="this.style.backgroundColor='<%= color %>'">
		<td align=center> <a href="editboard.jsp?id=<%= brd.getId() %>"> <%= brd.getId() %></a> </td>
		<td align=left> <%= brd.getTitle() %> </td>
		<td align=center> <%= brd.getName() %> </td>
		<td align=center> <%= df.format(brd.getRegdate()) %> </td>
		<td align=center> <%= brd.getEmail() %> </td>
	</tr>
	<%
		}
	%>
	</table>
	<%
	}
	%>
	<hr width=90%>
	<p> 조회된 게시판 목록 수가 <%= counter %>개 입니다.
	</center> <hr>
	<center>
	<form name=form method=post action=editboard.jsp>
		<input type=submit value="게시등록">
	</form>
	</center>
</body>
</html>