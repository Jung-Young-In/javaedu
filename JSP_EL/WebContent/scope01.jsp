<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<% 
	//다 살릴 경우 pageContext가 제일 우선순위가 높기 때문에 먼저 실행됨
 	pageContext.setAttribute("msg", "EL문 예제1");
 	request.setAttribute("msg", "EL문 예제2");
 	session.setAttribute("msg", "EL문 예제3");
	application.setAttribute("msg", "EL문 예제4");
%>
<!-- 우선순위가 아닌 따로 지정하여 실행하고 싶을 경우 scope 지정해줘야 함 -->
<h1>${msg}</h1>
<h1>${sessionScope.msg}</h1>
<!-- request 객체를 가져오고 싶을 경우는 requestScope가 아닌 param. 으로 받아옴 -->
<h1>${param.msg}</h1>

