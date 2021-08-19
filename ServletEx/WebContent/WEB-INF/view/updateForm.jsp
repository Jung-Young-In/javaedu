<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />
<title>회원정보 수정</title>
</head>
<body>
        <div class="row mt-5">
            <h1 style="margin-left: 230px;">회원 정보 수정</h1>
        </div>
        <div class="container" style="margin-left: 200px;">
            <div class="row mt-5">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath }/update" method="post">
						<label for="username">I D :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="memId" value="${mv.memId }" readonly="readonly">
						<br><br>
						<label for="username">이름 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="memName" value="${mv.memName }">
						<br><br>
						<label for="username">전화번호 :</label>
						<input type="text" name="memTel" value="${mv.memTel }">
						<br><br>
						<label for="username">주소 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="memAddr" value="${mv.memAddr }">
						<br><br>
						<div style="margin-left: 90px;">
						<button type="submit" value="수정">수정</button> 
						</div>
					</form>
                </div>
            </div>
        </div>
    </body>
</html>