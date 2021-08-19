package kr.or.ddit.qna.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.qna.service.QnaServiceImpl;
import kr.or.ddit.qna.service.IQnaService;
import kr.or.ddit.qna.vo.QnaVO;
import kr.or.ddit.comm.handler.CommandHandler;

public class UpdateQnaHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/qna/qnaUpdate.jsp";
	
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
			String qnaNum = req.getParameter("qnaNum");
			
			
			//1-1회원정보 조회
			IQnaService qnaservice = QnaServiceImpl.getInstance();
			QnaVO bv = qnaservice.getQna(qnaNum);
			
			
			
			
			//2. 모델정보 등록
			req.setAttribute("QnaVO", bv);
			
			return VIEW_PAGE;
			
		}else { // POST 방식인 경우
			
			
			
			// 1. 요청파라티터 정보 가져오기
				long qnaNum = Long.parseLong(req.getParameter("qnaNum"));
				String qnaTitle = req.getParameter("qnaTitle");
				String qnaContent = req.getParameter("qnaComtent");
				
				// 2. 서비스 객체 생성하기
				IQnaService qnaService = 
						QnaServiceImpl.getInstance();
				
				// 3. 회원정보 수정하기
				QnaVO bv = new QnaVO();
				bv.setQnaNum(qnaNum);
				bv.setQnaTitle(qnaTitle);
				bv.setQnaContent(qnaContent);
				
				int cnt = qnaService.updateQna(bv);
				
				String msg = "";
				
				if(cnt > 0) {
					msg = "성공";
				}else {
					msg = "실패";
				}
				
				// 4. 목록 조회화면으로 이동
				String redirectUrl =req.getContextPath()+"/HW/qna/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
				
				return redirectUrl;
				
				
		}
	}

	
	
	
	
	
	
	
	
}
