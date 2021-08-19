package kr.or.ddit.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.josephoconnell.html.HTMLInputFilter;

//사용에 있어 ENC타입은 제외
public class XSSResolver {

	public static void parseXSS(HttpServletRequest request) throws IOException, ServletException{
		
		Enumeration<String> crossParamNames = request.getParameterNames();
		
		while (crossParamNames.hasMoreElements()) {
			
			String paramName = crossParamNames.nextElement();
			String paramValue = request.getParameter(paramName);
			
			request.setAttribute("XSS" + paramName, HTMLInputFilter.htmlSpecialChars(paramValue));
		}
	}
}
