package kr.or.ddit.memberex.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;

public class memberexHandler2 implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/membership/membership_ex2.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		return VIEW_PAGE;
		
	}
}
