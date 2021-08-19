<%@page import="kr.or.ddit.whisp.vo.WhispVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<WhispVO> userWhispList = (List<WhispVO>)request.getAttribute("whispList");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav aria-label="breadcrumb" class="main-breadcrumb">
						<h1>트레이너 대화창</h1>
</nav>
	<table border="1">
		<tr>
			<td>to</td>
			<td>대화내용</td>
			<td>보낸 날짜</td>
			<td>from</td>
		</tr>
		
		<%
		if(userWhispList.size() > 0){
			for(int i = 0; i < userWhispList.size(); i++) {
		%>
			<tr>
			<td><%=userWhispList.get(i).getMemId() %></td>
			<td><%=userWhispList.get(i).getWhispContent() %></td>
			<td><%=userWhispList.get(i).getWhispDate() %></td>
		<%	
				if(userWhispList.get(i).getMemId().substring(0,1).equals("t")){
		%>			
			<td><%=userWhispList.get(i).getMemId2() %></td>
		<%	
				}else if (userWhispList.get(i).getMemId().substring(0,1).equals("p")){
		%>			
			<td><%=userWhispList.get(i).getMemId3() %></td>
		<%	
				}
		%>	
			</tr>	
		<%	
			}
		}else {
		%>
			<tr>
				<td colspan="7">게시글이 없습니다.</td>
			</tr>
		<%
			}
		%>
		<tr align="center">
			 <td colspan="7"><a href="<%=request.getContextPath() %>/HW/whisp/insert.do">[글등록]</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/HW/main/main.do">[메인화면]</a></td> 
		</tr>
	</table>
	<%
		if(msg.equals("성공")){ //성공메시지가 전달되면...
			
	%>		
			<script type="text/javascript">
				alert('정상적으로 처리되었습니다.');
			</script>
	<%
		}
	%>
</body>

</html>