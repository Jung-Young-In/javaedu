<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	alert("회원정보가 정상적으로 삭제되었습니다.");
	
	<c:if test="${!empty loginUser}">
		window.opener.parent.location.reload();	
	</c:if>

	<c:if test="${empty loginUser}">
		window.opener.parent.location.href="/";
	</c:if>

	CloseWindow();
</script>