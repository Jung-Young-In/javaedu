package kr.or.ddit.prod.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;

public class RealPayHandler implements CommandHandler{
	private static final String VIEW_PAGE =
			"/WEB-INF/view/payment/realpay.jsp";
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String price = req.getParameter("price");
		
		
		req.setAttribute("price", price);
		
		
		return VIEW_PAGE;
	}

	
	
	
	
	
}
