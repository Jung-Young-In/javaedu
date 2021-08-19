package kr.or.ddit.notice.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;

public class SelectNoticeHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/notice/noticeSelect.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String noticeNum = req.getParameter("boardNum");
		
		// 회원정보 조회
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		NoticeVO bv = noticeService.getNotice(noticeNum);
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		MemberService memberservice = new MemberService();
		String memGrade = memberservice.getGrade(memId);
		
		req.setAttribute("noticeVO", bv);
		req.setAttribute("memGrade", memGrade);
		
		return VIEW_PAGE;
	}

	
	
	
	
	
	
	
	
}
