<%@page import="kr.or.ddit.member.dao.IMemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset='utf-8' />
        <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />
<title>Insert title here</title>
<c:if test="${not empty result }">
        <script type="text/javascript">
			alert(${msg});
        </script>
</c:if>
</head>
<body>
	<div class="container">
    	<div class="row mt-5">
        	<h1 style="margin-left: 220px;">회원목록</h1>
        </div>
        	<div class="row mt-5">
                <div class="col-12">
				     <table border="1px solid black" style="border-collapse: collapse; width: 600px; height: 100%;">
				     	<thead>
							<tr style="background-color: lightgray;">
								<td>ID</td>
								<td>이름</td>
								<td>전화번호</td>
								<td>주소</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty memList }">
								<td colspan="4">등록된 회원이 없습니다.</td>
							</c:if>
							<c:if test="${not empty memList }">
								<c:forEach items="${memList }" var="member">
									<tr>
										<td><a href="${pageContext.request.contextPath }/info?memId=${member.memId}">${member.memId }</a></td>
										<td>${member.memName }</td>
										<td>${member.memTel }</td>
										<td>${member.memAddr }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				<br>
				<div style="margin-left: 250px;">
				<button class="btn btn-primary" ><a href="${pageContext.request.contextPath }/join">회원 등록</a></button>
				</div>
            </div>
         </div>
       </div>
    </body>
</html>