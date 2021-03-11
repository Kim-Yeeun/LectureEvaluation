<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=EUC-KR">
<title> 게시판 기본 예제 : 게시 폼 작성 </title>
</head>

<script language=JavaScript src="boardform.js"></script>

<body>

	<%@ page import="univ.*" %>
	<%
		String name = "";
		String email = "";
		String title = "";
		String content = "";
		String headline = "등록";
		
		String id = request.getParameter("id");
		if (id != null) {
			int idnum = Integer.parseInt(id);
			BoardDBCP brddb = new BoardDBCP();
			BoardEntity brd = brddb.getBoard(idnum);
			name = brd.getName();
			email = brd.getEmail();
			title = brd.getTitle();
			content = brd.getContent();
			headline = "수정 삭제";
		};
	%>
	
	<h2> 게시판 <%= headline %> 프로그램 </h2> <hr>
	
	<center>
	<form name=boardform method=post action="processboard.jsp" >
	<input type=hidden name="menu" value="insert">
	<input type=hidden name="id" value=<%= id %>>
	<table width=100% border=0 cellspacing=0 cellpadding=7>
	<tr> <td align=center>
		<table border=0>
		<tr> <td colspan=2>
			<table>
			<tr>
			<td width=50> 이름 : </td>
			<td width=100>
			<input type=text name=name value="<%= name %>" size=30 maxlength=20> </td>
			<td width=80> 전자메일 : </td>
			<td width=100>
			<input type=text name=email size=30 value="<%= email %>" maxlength=30> </td>
			</tr>
			<tr>
				<td width=50> 제목 : </td>
				<td colspan=3>
					<input type=text name=title size=80 value="<%= title %>" maxlength=100> </td>
			</tr>
		</table>
	</td> </tr>
	
	<tr> <td colspan=2>
		<textarea name=content rows=10 cols=90> <%= content %> </textarea> </td> </tr>
	<tr>
		<td colspan=2> 비밀번호 : 
			<input type=password name=passwd size=20 maxlength=15>
			<font color=red>
			현재 게시 내용을 수정 또는 삭제하려면 이미 등록한 비밀번호가 필요합니다.
			</font>
		</td>
	</tr>
	<tr>
		<td colspan=2 height=5> <hr size=2> </td>
	</tr>
	<tr>
		<td colspan=2>
		<% if (id == null) { %>
			<input type=button value="등록" onClick="insertcheck()">
		<% } else { %>
			<input type=button value="수정완료" onClick="updatecheck()">
			<input type=button value="삭제" onClick="deletecheck()">
		<% } %>
		<input type=button value="목록보기" onClick="location.href='listboard.jsp'">
		<input type=reset value="취소">
		</td>
	</tr>
	</table>
	
	</form>
	</center>

</body>
</html>