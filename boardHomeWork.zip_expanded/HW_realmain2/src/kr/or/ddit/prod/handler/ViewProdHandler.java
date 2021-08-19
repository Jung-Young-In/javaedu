package kr.or.ddit.prod.handler;

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

public class ViewProdHandler implements CommandHandler {

	private static final String VIEW_PAGE =
			"/WEB-INF/view/prod/selectProd.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String prodNum = req.getParameter("prodNum");
		
		// 회원 정보 조회
		IProdService prodService = ProdServiceImpl.getInstance();
		ProdVO mv = prodService.getProd(prodNum);
		
		if(mv.getAtchFileId() > 0) {  // 첨부파일 존재하면..
			// 첨부파일 정보 조회
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(mv.getAtchFileId());
			
			IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();
			List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
			
			req.setAttribute("atchFileList", atchFileList);
			
		}
		req.setAttribute("prodVO", mv);
		
		return VIEW_PAGE;
		
	}
	
	
}
