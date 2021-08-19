<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품번호:</td>
				<td><input type="text" name="prodNum" value=""></td>
			</tr>
			<tr>
				<td>상품이름:</td>
				<td><input type="text" name="prodName" value=""></td>
			</tr>
			<tr>
				<td>추천인:</td>
				<td><input type="text" name="prodChoice" value=""></td>
			</tr>
			<tr>
				<td>재고수량:</td>
				<td><input type="text" name="prodChoice" value=""></td>
			</tr>
			<tr>
				<td>판매처</td>
				<td><input type="text" name="prodSell"></td>
			</tr>
			<tr>
				<td>판매가</td>
				<td><input type="text" name="prodPrice"></td>
			</tr>
			<tr>
				<td>회원가</td>
				<td><input type="text" name="prodMemberPrice"></td>
			</tr>
			<tr>
				<td>상세정보(추후 이미지로 바꾸기)</td>
				<td><input type="text" name="prodDetailInfo"></td>
			</tr>
		</table>
		<input type="submit" value="상품 등록">
	</form><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규회원 등록</title>
</head>
</body>
</html>