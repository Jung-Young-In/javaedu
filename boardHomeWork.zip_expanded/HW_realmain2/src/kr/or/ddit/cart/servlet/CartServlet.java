package kr.or.ddit.cart.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.service.ZipService;
import kr.or.ddit.common.vo.ZipVO;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doPost(req, resp);
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String flag = req.getParameter("flag");
		
			
			if("cart".equals(flag)) { 
				
				String memId = req.getParameter("memId");
				String prodNum = req.getParameter("prodNum"); 
				String prodName = req.getParameter("prodName"); 
				long prodPrice =  Long.parseLong(req.getParameter("prodPrice"));
				long prodMemberPrice = Long.parseLong(req.getParameter("prodMemberPrice"));
				String prodImgPath = req.getParameter("prodImgPath");
				
				
				System.out.println("첫번째"+memId+prodNum+prodName+prodPrice+prodMemberPrice+prodImgPath);
				
				CartVO cartVo = new CartVO();
				cartVo.setMemId(memId);
				cartVo.setProdNum(prodNum);
				cartVo.setProdName(prodName);
				cartVo.setProdPrice(prodPrice);
				cartVo.setProdMemberPrice(prodMemberPrice);
				cartVo.setProdImgPath(prodImgPath);
				
				
				
				
				
				String memId2 = cartVo.getMemId();
				String prodNum2 =  cartVo.getProdNum();
				String prodName2 = cartVo.getProdName();
				long prodPrice2 =  cartVo.getProdPrice();
				long prodMemberPrice2 = cartVo.getProdMemberPrice();
				String prodImgPath2 = cartVo.getProdImgPath();
				
				System.out.println("두번째"+memId2+prodNum2+prodName2+prodPrice2+prodMemberPrice2+prodImgPath2);
				
				
				
				
				
				
				ICartService cartService = CartServiceImpl.getInstance();
				
				
				int cnt = cartService.insertCart(cartVo);
				int resultCnt = 0;
				if (cnt > 0) {
					resultCnt = 1;
				}
				req.setAttribute("resultCnt", resultCnt);

				RequestDispatcher disp = req.getRequestDispatcher("/HW_main/common/checkResult.jsp");
				disp.forward(req, resp);
				
				
				
			}else if("SI".equals(flag)) {
				
				
			} else if("GU".equals(flag)) {
				
				
			} else if("DONG".equals(flag)) {
				
				
			}else {
				
				
			}
			
		
		
	}
	
	
	
	
	
	
	
	
	
	
}











































