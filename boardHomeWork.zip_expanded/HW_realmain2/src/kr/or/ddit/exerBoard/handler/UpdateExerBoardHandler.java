package kr.or.ddit.exerBoard.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.board.service.AtchFileServiceImpl;
import kr.or.ddit.board.service.IAtchFileService;
import kr.or.ddit.board.vo.AtchFileVO;
import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.exerBoard.service.ExerBoardServiceImpl;
import kr.or.ddit.exerBoard.service.IExerBoardService;
import kr.or.ddit.exerBoard.vo.ExerBoardVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class UpdateExerBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/exerBoard/exerBoardUpdate.jsp";
	
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
			String exerBoardNum = req.getParameter("exerBoardNum");
			
			
			//1-1회원정보 조회
			IExerBoardService exerBoardservice = ExerBoardServiceImpl.getInstance();
			ExerBoardVO bv = exerBoardservice.getExerBoard(exerBoardNum);
			
			
			if(bv.getAtchFileId()>0) {//첨부파일 존재하면
				//첨부파일 정보 조회
				AtchFileVO fileVO = new AtchFileVO();
				fileVO.setAtchFileId(bv.getAtchFileId());
				
				IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();
				
				
				List<AtchFileVO> atchFileList =  atchFileService.getAtchFileList(fileVO);
				
				req.setAttribute("atchFileList", atchFileList);
				
			}
			
			
			//2. 모델정보 등록
			req.setAttribute("ExerBoardVO", bv);
			
			return VIEW_PAGE;
			
		}else { // POST 방식인 경우
			
			
			//FileItem 추출
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFile");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			//기조의 첨부파일아이디 정보 가져오기
			atchFileVO.setAtchFileId(req.getParameter("atchFile")==null ? 
					-1 : Long.parseLong(req.getParameter("atchFile")));
			
			if(item != null && item.getName().equals("")) {
				
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				
				atchFileVO = fileService.saveAtchFile(item);//첨부파일저장
				
				
			}
			
			// 1. 요청파라티터 정보 가져오기
				long exerBoardNum = Long.parseLong(req.getParameter("exerBoardNum"));
				String exerBoardTitle = req.getParameter("exerBoardTitle");
				String exerBoardContent = req.getParameter("exerBoardComtent");
				
				// 2. 서비스 객체 생성하기
				IExerBoardService exerBoardService = 
						ExerBoardServiceImpl.getInstance();
				
				// 3. 회원정보 수정하기
				ExerBoardVO bv = new ExerBoardVO();
				bv.setExerBoardNum(exerBoardNum);
				bv.setExerBoardTitle(exerBoardTitle);
				bv.setExerBoardContent(exerBoardContent);
				bv.setAtchFileId(atchFileVO.getAtchFileId());
				
				int cnt = exerBoardService.updateExerBoard(bv);
				
				String msg = "";
				
				if(cnt > 0) {
					msg = "성공";
				}else {
					msg = "실패";
				}
				
				// 4. 목록 조회화면으로 이동
				String redirectUrl =req.getContextPath()+"/HW/exerboard/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
				
				return redirectUrl;
				
				
		}
	}

	
	
	
	
	
	
	
	
}
