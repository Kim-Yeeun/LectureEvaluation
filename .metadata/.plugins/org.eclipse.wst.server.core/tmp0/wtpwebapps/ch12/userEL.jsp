<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : ǥ������ �ڹٺ��� getter ȣ�� </title>
</head>
<body>

<h2> ǥ������ �ڹٺ��� getter ȣ�� </h2>

<jsp:useBean id="user" class="member.User">
	<jsp:setProperty name="user" property="uname" value="�迹��"/>
	<jsp:setProperty name="user" property="uid" value="kim"/>
	<jsp:setProperty name="user" property="unum" value="0125"/>
</jsp:useBean>

\${ user.uname } = ${ user.uname } <br>
\${ user.uid } = ${ user.uid } <br>
\${ user.unum } = ${user.unum } <br>
<p>
\${ user["uname"] } = ${ user["uname"] } <br>
\${ user['uid'] } = ${ user['uid'] } <br>
\${ user['unum'] } = ${ user['unum'] } <br>

</body>
</html>