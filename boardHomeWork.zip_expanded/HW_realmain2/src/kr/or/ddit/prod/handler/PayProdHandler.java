package kr.or.ddit.prod.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class PayProdHandler implements CommandHandler{
	private static final String VIEW_PAGE =
			"/WEB-INF/view/prod/payProd.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		ICartService cartService = CartServiceImpl.getInstance();
		
		List<CartVO> cartList = cartService.getCart(memId);
		
		req.setAttribute("cartList", cartList);
		
		return VIEW_PAGE;
	}

	
	
	
}
