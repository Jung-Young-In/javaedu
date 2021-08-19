package kr.or.ddit.notice.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class InsertNoticeHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/notice/noticeInsert.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { // Get방식인 경우.
			return false;
		}else { // POST 방식인 경우... 
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) { //GET방식인 경우 isRedirect을 하지 않는다
			return VIEW_PAGE;
		}else { //POST 방식인 경우 isRedirect를 한다 
			
			// 1. 요청파라티터 정보 가져오기
			String noticeTitle = req.getParameter("noticeTitle");
			String noticeWriter = req.getParameter("noticeWriter");
			String noticeContent = req.getParameter("noticeContent");
			
			// 2. 서비스 객체 생성하기
			INoticeService noticeService = 
					NoticeServiceImpl.getInstance();
			

			
			// 3. 회원정보 등록하기
			NoticeVO bv = new NoticeVO();
			bv.setNoticeTitle(noticeTitle);
			bv.setNoticeWriter(noticeWriter);
			bv.setNoticeContent(noticeContent);
			
			int cnt = noticeService.insertNotice(bv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			
			// 4. 목록 조회화면으로 이동
			String redirectUrl = req.getContextPath() +
					"/HW/notice/list.do?msg=" 
					+ URLEncoder.encode(msg, "UTF-8");
			
			return redirectUrl;
		}
	}
	
	
	
	
	
	
	
}