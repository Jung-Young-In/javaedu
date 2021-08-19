package kr.or.ddit.qna.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.qna.service.QnaServiceImpl;
import kr.or.ddit.qna.service.IQnaService;
import kr.or.ddit.qna.vo.QnaVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class SelectQnaHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/qna/qnaSelect.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String qnaNum = req.getParameter("qnaNum");
		
		// 회원정보 조회
		IQnaService qnaService = QnaServiceImpl.getInstance();
		
		QnaVO bv = qnaService.getQna(qnaNum);
		
		req.setAttribute("qnaVO", bv);
		
		
		
		return VIEW_PAGE;
	}

	
	
	
	
	
	
	
	
}
