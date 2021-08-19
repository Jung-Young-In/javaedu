package kr.or.ddit.prodboard.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.prodboard.service.IProdBoardService;
import kr.or.ddit.prodboard.service.ProdBoardServiceImpl;
import kr.or.ddit.prodboard.vo.ProdBoardVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class UpdateProdBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/noticeprodBoard/prodBoardUpdate.jsp";
	
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
			String prodBoardNum = req.getParameter("prodBoardNum");
			
			
			//1-1회원정보 조회
			IProdBoardService prodBoardservice = ProdBoardServiceImpl.getInstance();
			ProdBoardVO bv = prodBoardservice.getProdBoard(prodBoardNum);
			
			//2. 모델정보 등록
			req.setAttribute("ProdBoardVO", bv);
			
			return VIEW_PAGE;
			
		}else { // POST 방식인 경우
			
			
			// 1. 요청파라티터 정보 가져오기
				long prodBoardNum = Long.parseLong(req.getParameter("prodBoardNum"));
				String prodBoardTitle = req.getParameter("prodBoardTitle");
				String prodBoardContent = req.getParameter("prodBoardComtent");
				
				// 2. 서비스 객체 생성하기
				IProdBoardService prodBoardService = 
						ProdBoardServiceImpl.getInstance();
				
				// 3. 회원정보 수정하기
				ProdBoardVO bv = new ProdBoardVO();
				bv.setProdBoardNum(prodBoardNum);
				bv.setProdBoardTitle(prodBoardTitle);
				bv.setProdBoardContent(prodBoardContent);
				
				int cnt = prodBoardService.updateProdBoard(bv);
				
				String msg = "";
				
				if(cnt > 0) {
					msg = "성공";
				}else {
					msg = "실패";
				}
				
				// 4. 목록 조회화면으로 이동
				String redirectUrl =req.getContextPath()+"/HW/prodBoard/list.do?msg=" + URLEncoder.encode(msg,"UTF-8");
				
				return redirectUrl;
				
				
		}
	}

	
	
	
	
	
	
	
	
}
