package com.spring.security;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.spring.dto.MemberVO;
import com.spring.service.MemberService;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
											Authentication authentication) throws ServletException, IOException {
		//로그인한 사람의 아이디는 authentication에 담겨져 옮
		
		UserDetails user = (UserDetails)authentication.getPrincipal();
		String username = user.getUsername();
		
		ApplicationContext ctx = new GenericXmlApplicationContext("classpath:com/spring/context/root-context.xml");
		
		MemberService service = ctx.getBean("memberService", MemberService.class);
		
		try {
			MemberVO loginUser = service.getMember(username);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		//아래를 지우면 하나부터 열까지 모두 다시 다 만들어줘야함(return url 등의 과정) -> 여기서 session에만 넣어줬으면 하는 것이 목적
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
