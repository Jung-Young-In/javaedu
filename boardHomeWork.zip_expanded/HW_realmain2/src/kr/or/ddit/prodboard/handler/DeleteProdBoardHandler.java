package kr.or.ddit.prodboard.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.prodboard.service.IProdBoardService;
import kr.or.ddit.prodboard.service.ProdBoardServiceImpl;
import kr.or.ddit.prodboard.vo.ProdBoardVO;

public class DeleteProdBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/noticeProdBoard/ProdBoardList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		System.out.println("일로 와버렸지 뭐야");
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("잘 들어는 왔는디...");
		String ProdBoardNum = req.getParameter("ProdBoardNum");
		
		//2. 삭제처리 
		IProdBoardService ProdBoardService = ProdBoardServiceImpl.getInstance();
		
		int cnt = ProdBoardService.deleteProdBoard(ProdBoardNum);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		/*
		// 4. 목록 조회화면으로 이동
		//String redirectUrl = req.getContextPath()+"/HW/ProdBoard/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
		String redirectUrl =req.getContextPath()+"/HW/ProdBoard/list.do";

		//		resp.sendRedirect(redirectUrl); 나중에 핸들러에서 뷰로 보내줄 것.
		
		return redirectUrl;*/
		
		List<ProdBoardVO> ProdBoardList = ProdBoardService.getAllProdBoardList();
		
		req.setAttribute("ProdBoardList", ProdBoardList);
		
		return VIEW_PAGE;
		
		
	}

	
	
	
	
}
