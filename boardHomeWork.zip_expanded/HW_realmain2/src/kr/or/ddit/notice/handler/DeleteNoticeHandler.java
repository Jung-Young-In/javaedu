package kr.or.ddit.notice.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class DeleteNoticeHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/notice/noticeList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		System.out.println("일로 와버렸지 뭐야");
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("잘 들어는 왔는디...");
		String noticeNum = req.getParameter("noticeNum");
		
		//2. 삭제처리 
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		int cnt = noticeService.deleteNotice(noticeNum);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		/*
		// 4. 목록 조회화면으로 이동
		//String redirectUrl = req.getContextPath()+"/HW/notice/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
		String redirectUrl =req.getContextPath()+"/HW/notice/list.do";

		//		resp.sendRedirect(redirectUrl); 나중에 핸들러에서 뷰로 보내줄 것.
		
		return redirectUrl;*/
		
		List<NoticeVO> noticeList = noticeService.getAllNoticeList();
		
		req.setAttribute("noticeList", noticeList);
		
		return VIEW_PAGE;
		
		
	}

	
	
	
	
}
