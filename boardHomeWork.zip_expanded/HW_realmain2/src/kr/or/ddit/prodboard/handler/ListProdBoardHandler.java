package kr.or.ddit.prodboard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.prodboard.service.IProdBoardService;
import kr.or.ddit.prodboard.service.ProdBoardServiceImpl;
import kr.or.ddit.prodboard.vo.ProdBoardVO;

public class ListProdBoardHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/noticeprodBoard/prodBoardList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
				IProdBoardService prodBoardService = ProdBoardServiceImpl.getInstance();
				
				List<ProdBoardVO> prodBoardList = prodBoardService.getAllProdBoardList();
				
				req.setAttribute("prodBoardList", prodBoardList);
				
				return VIEW_PAGE;
	}

	
	
	
}
