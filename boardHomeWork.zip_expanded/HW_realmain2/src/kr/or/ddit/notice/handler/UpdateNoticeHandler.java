package kr.or.ddit.notice.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class UpdateNoticeHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/notice/noticeUpdate.jsp";
	
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
			if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			String noticeNum = req.getParameter("noticeNum");
			
			
			//1-1회원정보 조회
			INoticeService noticeservice = NoticeServiceImpl.getInstance();
			NoticeVO bv = noticeservice.getNotice(noticeNum);

			//2. 모델정보 등록
			req.setAttribute("NoticeVO", bv);
			
			return VIEW_PAGE;
			
		}else { // POST 방식인 경우
			
			// 1. 요청파라티터 정보 가져오기
				long noticeNum = Long.parseLong(req.getParameter("noticeNum"));
				String noticeTitle = req.getParameter("noticeTitle");
				String noticeContent = req.getParameter("noticeComtent");
				
				// 2. 서비스 객체 생성하기
				INoticeService noticeService = 
						NoticeServiceImpl.getInstance();
				
				// 3. 회원정보 수정하기
				NoticeVO bv = new NoticeVO();
				bv.setNoticeNum(noticeNum);
				bv.setNoticeTitle(noticeTitle);
				bv.setNoticeContent(noticeContent);
				
				int cnt = noticeService.updateNotice(bv);
				
				String msg = "";
				
				if(cnt > 0) {
					msg = "성공";
				}else {
					msg = "실패";
				}
				
				// 4. 목록 조회화면으로 이동
				String redirectUrl =req.getContextPath()+"/HW/notice/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
				
				return redirectUrl;
				
				
		}
	}

	
	
	
	
	
	
	
	
}
