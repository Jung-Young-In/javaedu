package com.spring.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('아이디 혹은 패스워드가 일치하지 않습니다.');");
		out.println("history.go(-1)");
		out.println("</script>");
		
		//여기서는 success와 다르게 내 방식대로 해보는 걸로 하기 때문에 super 하지 않음
//		super.onAuthenticationFailure(request, response, exception);
	}
}
