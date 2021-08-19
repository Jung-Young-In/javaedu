<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	var cnt = 0;
	var check = prompt("60분동안 활동이 없었습니다.\n비밀번호를 입력하세요");
	while(cnt < 5) {
		if(check == '${loginUser.pwd}'){
			sessionStorage.setItem('loginUser', '${loginUser}');
			return;
		}		
		cnt += 1;	
	}
	if(cnt == 5){
		alert("로그아웃 됩니다.");
	}
</script>