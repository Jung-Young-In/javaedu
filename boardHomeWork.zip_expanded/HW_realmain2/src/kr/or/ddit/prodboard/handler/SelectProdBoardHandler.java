package kr.or.ddit.prodboard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.prodboard.service.IProdBoardService;
import kr.or.ddit.prodboard.service.ProdBoardServiceImpl;
import kr.or.ddit.prodboard.vo.ProdBoardVO;

public class SelectProdBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/noticeprodBoard/prodBoardSelect.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String prodBoardNum = req.getParameter("prodBoardNum");
		
		// 회원정보 조회
		IProdBoardService prodBoardService = ProdBoardServiceImpl.getInstance();
		
		ProdBoardVO bv = prodBoardService.getProdBoard(prodBoardNum);
		
		
		req.setAttribute("prodBoardVO", bv);
		
		
		
		return VIEW_PAGE;
	}

	
	
	
	
	
	
	
	
}
