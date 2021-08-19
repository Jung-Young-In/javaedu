<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset='utf-8' />
        <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />
<title>신규회원 등록</title>
<style type="text/css">
	label {
		font-weight: bold;
	}
</style>
</head>
<body>
        <div class="container">
            <div class="row mt-5">
                <h1 style="margin-left: 270px">회원 등록</h1>
            </div>
            <div class="row mt-5">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath }/join" method="post">
						<label for="username">I D :</label>
						<input type="text" class="form-control" name="memId">
						<br>
						<label for="username">이름 :</label>
						<input type="text" class="form-control" name="memName">
						<br>
						<label for="username">전화번호 :</label>
						<input type="text" class="form-control" name="memTel">
						<br>
						<label for="username">주소 :</label>
						<input type="text" class="form-control" class="form-control" name="memAddr">
						<br><br>
						<button type="submit" class="btn">회원 등록</button>
						<button type="button" class="btn" onclick="goList()">메인 화면</button>
					</form>
                </div>
            </div>
        </div>
    </body>
</html>