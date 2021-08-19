<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />
<title>회원정보 삭제</title>
</head>
<body>
        <div class="container">
            <div class="row mt-5">
                <h1>회원 정보 삭제</h1>
            </div>
            <br><br>
            <h4>삭제하실 아이디와 이름을 정확히 입력하세요.</h4>
            <div class="row mt-5">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath }/delete" method="post">
						<label for="username">I D :</label>
						<input type="text" name="memId" value="">
						<br><br>
						<label for="username">이름 :</label>
						<input type="text" name="memName" value="">
						<br><br>
						<div style="margin-left: 50px;">
						<button type="submit" value="삭제">삭제</button>
						<button><a href="${pageContext.request.contextPath }/list">회원 목록</a></button>
						</div>
					</form>
                </div>
            </div>
        </div>
    </body>
</html>