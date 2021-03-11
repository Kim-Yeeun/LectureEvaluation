<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제 : 표현언어 연산자 empty 예제 </title>
</head>
<body>

\${null} = ${ null } <p>

\${n} = ${n} <p>

\${empty null} = ${empty null} <p>
\${empty n} = ${empty n} <p>

\${param.user} = ${param.user} <p>
\${empty param.user} = ${empty param.user}

</body>
</html>