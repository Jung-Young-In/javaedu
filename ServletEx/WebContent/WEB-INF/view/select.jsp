<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/join" method="post">
		<h1 style="margin-left: 180px;">회원 정보 상세</h1>
			<table border="1px solid black" style="border-collapse: collapse; width: 600px; height: 100%;">
				<tr style="background-color: lightgray;">
					<td>ID</td>
					<td>이름</td>
					<td>전화번호</td>
					<td>주소</td>
				</tr>
				<tr>
					<td>${memInfo.memId }</td>
					<td>${memInfo.memName }</td>
					<td>${memInfo.memTel }</td>
					<td>${memInfo.memAddr }</td>
				</tr>
			</table>
			<br>
			<div style="margin-left: 130px;">
				<button class="btn btn-primary"><a href="${pageContext.request.contextPath }/list">메인 화면</a></button>
				<button class="btn btn-primary"><a href="${pageContext.request.contextPath }/delete?memId=${memList.memId }">회원 정보 삭제</a></button>
				<button class="btn btn-primary"><a href="${pageContext.request.contextPath }/update?memId=${memInfo.memId }">회원 정보 수정</a></button>
			</div>
	</form>
</body>
</html>

