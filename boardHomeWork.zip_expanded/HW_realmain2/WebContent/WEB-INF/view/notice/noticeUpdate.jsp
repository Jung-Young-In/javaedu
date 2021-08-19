<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	NoticeVO noticeVO = (NoticeVO)request.getAttribute("NoticeVO");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/HW/notice/update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="noticeNum" value="<%=noticeVO.getNoticeNum()%>">
		<table>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="noticeTitle" value="<%=noticeVO.getNoticeTitle()%>"></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><input type="text" name="noticeComtent" value="<%=noticeVO.getNoticeContent()%>"></td>
			</tr>
		</table>
		<input type="submit" value="회원정보 수정">
	</form>
</body>
</html>