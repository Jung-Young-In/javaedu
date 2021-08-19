package kr.or.ddit.pay.recom.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;

public class payrecomHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/mypageuser/mypageuser_main.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		
		
		return VIEW_PAGE;
		
		
	}

}
