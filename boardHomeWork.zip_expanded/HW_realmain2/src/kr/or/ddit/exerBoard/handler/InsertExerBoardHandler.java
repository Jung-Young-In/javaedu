package kr.or.ddit.exerBoard.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.board.service.AtchFileServiceImpl;
import kr.or.ddit.board.service.IAtchFileService;
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.exerBoard.service.ExerBoardServiceImpl;
import kr.or.ddit.exerBoard.service.IExerBoardService;
import kr.or.ddit.exerBoard.vo.ExerBoardVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class InsertExerBoardHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/exerBoard/exerBoardInsert.jsp";

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
			
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFile");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			atchFileVO = fileService.saveAtchFile(item);
			
			
			// 1. 요청파라티터 정보 가져오기
			String exerBoardTitle = req.getParameter("exerBoardTitle");
			String exerBoardContent = req.getParameter("exerBoardContent");
			
			// 2. 서비스 객체 생성하기
			IExerBoardService exerBoardService = 
					ExerBoardServiceImpl.getInstance();
			
			HttpSession session = req.getSession();
			
			String memId = (String)session.getAttribute("signedUser");

			
			// 3. 회원정보 등록하기
			ExerBoardVO bv = new ExerBoardVO();
			bv.setMemId(memId);
			bv.setExerBoardTitle(exerBoardTitle);
			bv.setExerBoardContent(exerBoardContent);
			bv.setAtchFileId(atchFileVO.getAtchFileId());
			
			int cnt = exerBoardService.insertExerBoard(bv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			
			// 4. 목록 조회화면으로 이동
			String redirectUrl = req.getContextPath() +
					"/HW/exerboard/list.do?msg=" 
					+ URLEncoder.encode(msg, "UTF-8");
			
			return redirectUrl;
		}
	}
	
	
	
	
	
	
	
}