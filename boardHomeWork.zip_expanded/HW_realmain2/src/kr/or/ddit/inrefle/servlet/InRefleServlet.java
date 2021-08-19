package kr.or.ddit.inrefle.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.inrefle.service.IInRefleService;
import kr.or.ddit.inrefle.service.InRefleServiceImpl;
import kr.or.ddit.inrefle.vo.InRefleVO;
import kr.or.ddit.prod.vo.AtchFileVO;
import kr.or.ddit.prod.vo.ProdVO;


@WebServlet("/InRefleServlet")
public class InRefleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doPost(req, resp);
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	String prodNum = req.getParameter("prodNum");
		
		// 회원 정보 조회
		IInRefleService inRefleService = InRefleServiceImpl.getInstance();
		List<InRefleVO> inrefleVo = inRefleService.getInRefle(prodNum);
		
		req.setAttribute("inrefleList", inrefleVo);
		req.setAttribute("prodNum", prodNum);
		
		RequestDispatcher disp = req.getRequestDispatcher("/WEB-INF/view/prod/inRefle.jsp");
		disp.forward(req, resp);
	}
			
		
		
	}
	
	
	
	
	
	
	
	
	
	












































