<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제 : 표현언어 내장객체 cookie </title>
</head>
<body>

<h2> 표현언어 내장객체 cookie 이용 </h2>
<%
	Cookie c = new Cookie("userid", "yekim");
	response.addCookie(c);
%>

\${cookie.userid.value} = ${cookie.userid.value}

<p><hr><h2> 스크립트릿에서 직접 cookie 이용 </h2>
<%
	Cookie[] cs = request.getCookies();

	if (!(cs == null)) {
		for (Cookie ck : cs) {
			if (ck.getName().equals("userid"))
				out.println(ck.getValue());
		}
	}
%>

</body>
</html>