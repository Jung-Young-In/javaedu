package kr.or.ddit.qna.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.qna.service.QnaServiceImpl;
import kr.or.ddit.qna.service.IQnaService;
import kr.or.ddit.qna.vo.QnaVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class ListQnaHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/qna/qnaList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
				IQnaService qnaService = QnaServiceImpl.getInstance();
				
				List<QnaVO> qnaList = qnaService.getAllQnaList();
				
				req.setAttribute("qnaList", qnaList);
				
				return VIEW_PAGE;
	}

	
	
	
}
