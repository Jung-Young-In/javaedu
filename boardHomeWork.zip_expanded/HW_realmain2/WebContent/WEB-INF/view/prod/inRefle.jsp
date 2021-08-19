<%@page import="kr.or.ddit.inrefle.vo.InRefleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<InRefleVO> inrefleList = 
			(List<InRefleVO>)request.getAttribute("inrefleList");
	String msg = request.getParameter("msg") == null ? ""
			: request.getParameter("msg");
	String prodNum = (String)request.getAttribute("prodNum");
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="float:right; width: 80%; padding-left:100px;">	
					<ul id ="list" style="width: 800px;">	
				
				

				<%
					int refleListSize = inrefleList.size();
					
					
					if(refleListSize > 0){
						for(int i = 0; i < refleListSize; i++){
							if(inrefleList.get(i).getRefleNum().equals(prodNum)){
				%>	
						<li>
							제목 : <%=inrefleList.get(i).getProdRefleTitle()%>
							작성자 ID : <%=inrefleList.get(i).getMemId()%>
							날짜시간 : <%=inrefleList.get(i).getProdRefleDate()%>
							내용 : <%=inrefleList.get(i).getProdRefleContent()%>
						</li>
						<%
								}
							}
						
					}
						%>
					</ul>
				</div>
</body>
</html>