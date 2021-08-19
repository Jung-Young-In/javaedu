package kr.or.ddit.prod.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.AtchFileVO;
import kr.or.ddit.prod.vo.ProdVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class InsertProdHandler implements CommandHandler {

	private static final String VIEW_PAGE 
					= "/WEB-INF/view/prod/insertProd.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { // Get방식인 경우.
			return false;
		}else { // POST 방식인 경우... 
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) 
			throws Exception {
		
		if(req.getMethod().equals("GET")) { //GET방식인 경우 isRedirect을 하지 않는다
			return VIEW_PAGE;
		}else { //POST 방식인 경우 isRedirect를 한다 
			
			FileItem item = 
				((FileUploadRequestWrapper)req).getFileItem("atchFile");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			atchFileVO = fileService.saveAtchFile(item);
			
			
			// 1. 요청파라티터 정보 가져오기
			String prodNum = req.getParameter("prodNum");
			String prodName = req.getParameter("prodName");
			String prodChoice = req.getParameter("prodChoice");
			int prodRemianQty = Integer.parseInt(req.getParameter("prodRemianQty"));
			String prodSell = req.getParameter("prodSell");
			int prodPrice = Integer.parseInt(req.getParameter("prodPrice"));
			int prodMemberPrice = Integer.parseInt(req.getParameter("prodMemberPrice"));
			String prodDetailInfo = req.getParameter("prodDetailInfo");
			
			// 2. 서비스 객체 생성하기
			IProdService prodService = 
					ProdServiceImpl.getInstance();
			
			// 3. 회원정보 등록하기
			ProdVO mv = new ProdVO();
			mv.setProdNum(prodNum);
			mv.setProdName(prodName);
			mv.setProdChoice(prodChoice);
			mv.setProdRemianQty(prodRemianQty);
			mv.setProdSell(prodSell);
			mv.setProdPrice(prodPrice);
			mv.setProdMemberPrice(prodMemberPrice);
			mv.setProdImgPath("../img/"+ prodNum+ ".jpg");
			mv.setProdDetailInfo(prodDetailInfo);
			mv.setAtchFileId(atchFileVO.getAtchFileId());
			
			int cnt = prodService.insertProd(mv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			// 4. 목록 조회화면으로 이동
			String redirectUrl = req.getContextPath() +
					"/prod/list.do?msg=" 
					+ URLEncoder.encode(msg, "UTF-8");
			
			return redirectUrl;
		}
	}
}