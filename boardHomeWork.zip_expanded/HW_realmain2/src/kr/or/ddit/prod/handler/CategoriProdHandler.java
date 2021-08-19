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

public class CategoriProdHandler implements CommandHandler {

private static final String VIEW_PAGE = "/WEB-INF/view/prod/categori.jsp";
	

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String prodCategori = req.getParameter("prodCategori");
		
		// 회원 정보 조회
		IProdService prodService = ProdServiceImpl.getInstance();
		List<ProdVO> prodList = prodService.getProdList(prodCategori);
		
		
		req.setAttribute("prodList", prodList);
		
		return VIEW_PAGE;
		
	}
}

