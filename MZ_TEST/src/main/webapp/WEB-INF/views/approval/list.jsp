<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<c:set var="approvalList" value="${dataMap.approvalList }"/>

<head></head>

<title>Approval List</title>

<body>
	<button type="button" onclick="OpenWindow('registForm.do','공지등록',800,700);"></button>
	<!-- Main Content -->
	<c:forEach items="${approvalList }" var="approval">
		<tr>
			<td>${approval.appNo }</td>
			<td>${approval.appTitle }</td>
			<td>${approval.appContent }</td>
		</tr>
	</c:forEach>
</body>
<script src="/resources/js/common.js" ></script>
</html>
