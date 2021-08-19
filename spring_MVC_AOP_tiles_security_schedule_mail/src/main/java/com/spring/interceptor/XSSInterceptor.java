package com.spring.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.josephoconnell.html.HTMLInputFilter;

public class XSSInterceptor extends HandlerInterceptorAdapter {

	//파일 받을때는 request 쓰지 말고 multipartFile로 받아야함
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Enumeration<String> crossParamNames = request.getParameterNames();
		
		while (crossParamNames.hasMoreElements()) {
			
			String paramName = crossParamNames.nextElement();
			String paramValue = request.getParameter(paramName);
			
			request.setAttribute("XSS" + paramName, HTMLInputFilter.htmlSpecialChars(paramValue));
		}
		return true;
	}
}
