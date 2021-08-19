package kr.or.ddit.comm.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class HttpServletRequestWrapperTest extends HttpServletRequestWrapper{
	
	public HttpServletRequestWrapperTest(HttpServletRequest request) {
		
		super(request);
	}
}
