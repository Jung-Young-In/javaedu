package kr.or.ddit.notice.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class ListNoticeHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/notice/noticeList.jsp";
	
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
				INoticeService noticeService = NoticeServiceImpl.getInstance();
				
				List<NoticeVO> noticeList = noticeService.getAllNoticeList();
				
				req.setAttribute("noticeList", noticeList);
				
				return VIEW_PAGE;
	}

	
	
	
}
