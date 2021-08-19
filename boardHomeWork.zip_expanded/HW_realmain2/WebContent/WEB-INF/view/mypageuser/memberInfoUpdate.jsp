<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberVO memberVO = (MemberVO)request.getAttribute("MemberVO");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/HW/mypageuser/memberInfoUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="MemId" value="<%=memberVO.getMemId()%>">
		<table>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="MemName" value="<%=memberVO.getMemName()%>"></td>
			</tr>
			<tr>
				<td>생일 : </td>
				<td><input type="text" name="MemIn" value="<%=memberVO.getMemIn()%>"></td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td><input type="text" name="MemEmail" value="<%=memberVO.getMemEmail()%>"></td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td><input type="text" name="MemHp" value="<%=memberVO.getMemHp()%>"></td>
			</tr>
			<tr>
				<td>키 : </td>
				<td><input type="text" name="MemHeight" value="<%=memberVO.getMemHeight()%>"></td>
			</tr>
			<tr>
				<td>몸무게 : </td>
				<td><input type="text" name="MemWeight" value="<%=memberVO.getMemWeight()%>"></td>
			</tr>
			<tr>
				<td>장애 : </td>
				<td><input type="text" name="MemOb" value="<%=memberVO.getMemOb()%>"></td>
			</tr>
			<tr>
				<td>병 : </td>
				<td><input type="text" name="MemSick" value="<%=memberVO.getMemSick()%>"></td>
			</tr>
		</table>
		<input type="submit" value="회원정보 수정">
	</form>
</body>
</html>