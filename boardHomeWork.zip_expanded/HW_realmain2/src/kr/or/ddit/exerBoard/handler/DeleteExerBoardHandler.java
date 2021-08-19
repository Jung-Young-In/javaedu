package kr.or.ddit.exerBoard.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.exerBoard.service.ExerBoardServiceImpl;
import kr.or.ddit.exerBoard.service.IExerBoardService;
import kr.or.ddit.exerBoard.vo.ExerBoardVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class DeleteExerBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/exerBoard/exerBoardList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		System.out.println("일로 와버렸지 뭐야");
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("잘 들어는 왔는디...");
		String exerBoardNum = req.getParameter("exerBoardNum");
		
		//2. 삭제처리 
		IExerBoardService exerBoardService = ExerBoardServiceImpl.getInstance();
		
		int cnt = exerBoardService.deleteExerBoard(exerBoardNum);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		/*
		// 4. 목록 조회화면으로 이동
		//String redirectUrl = req.getContextPath()+"/HW/exerBoard/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
		String redirectUrl =req.getContextPath()+"/HW/exerBoard/list.do";

		//		resp.sendRedirect(redirectUrl); 나중에 핸들러에서 뷰로 보내줄 것.
		
		return redirectUrl;*/
		
		List<ExerBoardVO> exerBoardList = exerBoardService.getAllExerBoardList();
		
		req.setAttribute("exerBoardList", exerBoardList);
		
		return VIEW_PAGE;
		
		
	}

	
	
	
	
}
