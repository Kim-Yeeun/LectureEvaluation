<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=EUC-KR">
<title> �Խ��� �⺻ ���� : �Խ� ��� ǥ�� </title>
</head>
<body>
	<h2> �Խ��� ��� ǥ�� ���α׷� </h2>
	
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
		<th> <font color=blue> <b> ��ȣ </b></font> </th>
		<th> <font color=blue> <b> ���� </b></font> </th>
		<th> <font color=blue> <b> �ۼ��� </b></font> </th>
		<th> <font color=blue> <b> �ۼ��� </b></font> </th>
		<th> <font color=blue> <b> ���ڸ��� </b></font> </th>
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
	<p> ��ȸ�� �Խ��� ��� ���� <%= counter %>�� �Դϴ�.
	</center> <hr>
	<center>
	<form name=form method=post action=editboard.jsp>
		<input type=submit value="�Խõ��">
	</form>
	</center>
</body>
</html>