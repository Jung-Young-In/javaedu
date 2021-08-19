<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
	alert("${member.name}님의 회원정보가 정상적으로 수정되었습니다.");
	//양쪽 싱글 쿼테이션을 주는 것은 boolean이 아닌 string으로 구별하기 위함.(boolean일 경우 false가 나오면 에러가 발생하기 때문)
	location.href='detail.do?id=${member.id}';
</script>
