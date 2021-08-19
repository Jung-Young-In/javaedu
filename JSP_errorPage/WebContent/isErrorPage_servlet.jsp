<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- 서블릿(EL문 사용)에서 에러페이지 할때 사용법 -->
	<h1>Servlet forward Exception : ${exception.message }</h1>
</body>
</html>