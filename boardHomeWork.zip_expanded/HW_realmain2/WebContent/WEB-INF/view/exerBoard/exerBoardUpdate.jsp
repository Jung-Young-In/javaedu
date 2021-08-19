<%@page import="kr.or.ddit.exerBoard.vo.ExerBoardVO"%>
<%@page import="kr.or.ddit.board.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	ExerBoardVO exerBoardVO = (ExerBoardVO)request.getAttribute("ExerBoardVO");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>)request.getAttribute("atchFileList");	
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/HW/exerboard/update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="exerBoardNum" value="<%=exerBoardVO.getExerBoardNum()%>">
			<input type="hidden" name="atchFileId" value="<%=exerBoardVO.getAtchFileId()%>">
		<table>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="exerBoardTitle" value="<%=exerBoardVO.getExerBoardTitle()%>"></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><input type="text" name="exerBoardComtent" value="<%=exerBoardVO.getExerBoardContent()%>"></td>
			</tr>
			<tr>
				<td>기존 첨부파일</td>
				<td>
					<%if(atchFileList != null){
						for(AtchFileVO atchFileVO : atchFileList){
					%>
						<div><a href="<%=request.getContextPath() %>/HW/exerboard/filedownload.do?fileId=<%=atchFileVO.getAtchFileId() %>&fileSn=<%=atchFileVO.getFileSn() %>"><%=atchFileVO.getOrignlFileNm() %></a></div>			
					<% 
						}
					}
					%>
				</td>
		</tr>
		<tr>
			<td>새로운 첨부파일</td>
			<td><input type="file" name="atchFile"> </td>
		</tr>
		</table>
		<input type="submit" value="회원정보 수정">
	</form>
</body>
</html>