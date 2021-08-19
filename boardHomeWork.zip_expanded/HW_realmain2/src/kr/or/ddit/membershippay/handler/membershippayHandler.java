package kr.or.ddit.membershippay.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;

public class membershippayHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/membership/membershippay.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		return VIEW_PAGE;
		
	}
}
