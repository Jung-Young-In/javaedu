package kr.or.ddit.prod.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ListloginProdHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/prod/shopping_login.jsp";
	

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ListProdHandler -> process");
		// 1. 서비스 객체 생성하기
		IProdService prodService =  ProdServiceImpl.getInstance();
		
		// 2. 회원정보 조회
		List<ProdVO> prodList = prodService.getAllProdList();
		
		req.setAttribute("prodList", prodList);
		
		return VIEW_PAGE;
	}

}
