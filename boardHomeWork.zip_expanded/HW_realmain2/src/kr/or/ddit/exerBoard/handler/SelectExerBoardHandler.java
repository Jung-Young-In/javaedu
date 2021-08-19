package kr.or.ddit.exerBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.exerBoard.service.ExerBoardServiceImpl;
import kr.or.ddit.exerBoard.service.IExerBoardService;
import kr.or.ddit.exerBoard.vo.ExerBoardVO;
import kr.or.ddit.board.service.AtchFileServiceImpl;
import kr.or.ddit.board.service.IAtchFileService;
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class SelectExerBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/exerBoard/exerBoardSelect.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String exerBoardNum = (String)req.getParameter("boardNum");
		
		// 회원정보 조회
		IExerBoardService exerBoardService = ExerBoardServiceImpl.getInstance();
		
		ExerBoardVO bv = exerBoardService.getExerBoard(exerBoardNum);
		
		
	/*	if(bv.getAtchFileId()>0) {//첨부파일 존재하면
			//첨부파일 정보 조회
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(bv.getAtchFileId());
			
			IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();
			
			
			List<AtchFileVO> atchFileList =  atchFileService.getAtchFileList(fileVO);
			
			req.setAttribute("atchFileList", atchFileList);
			
		}
		*/
		req.setAttribute("exerBoardVO", bv);
		
		
		
		return VIEW_PAGE;
	}

	
	
	
	
	
	
	
	
}
