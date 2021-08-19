package kr.or.ddit.exerBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.exerBoard.service.ExerBoardServiceImpl;
import kr.or.ddit.exerBoard.service.IExerBoardService;
import kr.or.ddit.exerBoard.vo.ExerBoardVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class ListExerBoardHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/exerBoard/exerBoardList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
				IExerBoardService exerBoardService = ExerBoardServiceImpl.getInstance();
				
				List<ExerBoardVO> exerBoardList = exerBoardService.getAllExerBoardList();
				
				req.setAttribute("exerBoardList", exerBoardList);
				
				return VIEW_PAGE;
	}

	
	
	
}
