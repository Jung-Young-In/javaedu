package kr.or.ddit.refle.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.refle.service.IRefleService;
import kr.or.ddit.refle.service.RefleServiceImpl;
import kr.or.ddit.refle.vo.RefleVO;


@WebServlet("/RefleServlet")
public class RefleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doPost(req, resp);
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String flag = req.getParameter("flag");
		
			
			if("refle".equals(flag)) { 
				
				String memId =  req.getParameter("memId");
				String prodNum = req.getParameter("prodNum"); 
				String prodRefleTitle = req.getParameter("prodRefleTitle"); 
				String prodRefleContent = req.getParameter("prodRefleContent");
				
				RefleVO refleVo = new RefleVO();
				refleVo.setMemId(memId);
				refleVo.setProdNum(prodNum);
				refleVo.setProdRefleTitle(prodRefleTitle);
				refleVo.setProdRefleContent(prodRefleContent);
				
				IRefleService refleService = RefleServiceImpl.getInstance();
				
				
				int cnt = refleService.insertReflr(refleVo);
				int resultCnt = 0;
				if (cnt > 0) {
					resultCnt = 1;
				}
				req.setAttribute("resultCnt", resultCnt);

				RequestDispatcher disp = req.getRequestDispatcher("/HW_main/common/checkResult.jsp");
				disp.forward(req, resp);
				
				
				
			}else if("SI".equals(flag)) {
				
				
			} else if("GU".equals(flag)) {
				
				
			} else if("DONG".equals(flag)) {
				
				
			}else {
				
				
			}
			
		
		
	}
	
	
	
	
	
	
	
	
	
	
}











































