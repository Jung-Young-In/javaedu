<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  
   	if (session.getAttribute("signedUser") == null) {
   	  String redirectUrl = request.getContextPath()+"/HW/main/login.do";
   	response.sendRedirect(redirectUrl); 
   	} 
%>  
    
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>login page</title>
<body>
  	<a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> 
  	<%=(String)session.getAttribute("signedUser") %>님 반갑습니다 
  	</a>
    <a href="<%=request.getContextPath() %>/HW/main/logout.do">Logout</a>
</body>
</html>