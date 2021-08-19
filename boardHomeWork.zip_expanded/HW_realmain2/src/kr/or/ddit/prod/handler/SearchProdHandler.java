package kr.or.ddit.prod.handler;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.AtchFileVO;
import kr.or.ddit.prod.vo.ProdVO;
import kr.or.ddit.video.vo.VideoVO;

public class SearchProdHandler implements CommandHandler {

private static final String VIEW_PAGE = "/WEB-INF/view/prod/searchProd.jsp";
	

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String prodSearch = req.getParameter("prodSearch");
		
		ProdVO prodVo = new ProdVO();
		prodVo.setProdName(prodSearch);
		
		IProdService prodService = ProdServiceImpl.getInstance();
		List<ProdVO> prodList = prodService.getSearchProdList(prodVo);
		
		
		req.setAttribute("prodList", prodList);
		
		return VIEW_PAGE;
		
	}
}

