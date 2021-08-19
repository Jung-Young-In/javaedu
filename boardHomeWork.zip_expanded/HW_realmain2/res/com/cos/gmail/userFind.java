package com.cos.gmail;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

public class userFind extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// super.doPost(req, resp); // 지워야함 : extends한 HttpServlet 의 doPost를 호출하는 것이기
		// 때문에 현재 클래스의 doPost를 사용할 수 없음

		// 브라우저로 부터 받은 값을 사용하기 위해 request에서 parameter를 get.
		String flag = req.getParameter("flag");
		
		try {
			if ("IDFIND".equals(flag)) { // 목록조회
				String userId = IdFind(req);
				String email = req.getParameter("email");
				
				// 브라우저로 전달한 결과를 request에 attribute로 세팅
				req.setAttribute("userId", userId);
				req.setAttribute("email", email);

				/*RequestDispatcher disp = req.getRequestDispatcher("/html/member/memberListResult.jsp");
				disp.forward(req, resp);*/
				
				
			} else if ("PASSFIND".equals(flag)) { // 등록
				String userId = IdFind(req);
				String email = req.getParameter("email");
				
				// 브라우저로 전달한 결과를 request에 attribute로 세팅
				req.setAttribute("userId", userId);
				req.setAttribute("email", email);

				/*RequestDispatcher disp = req.getRequestDispatcher("/html/member/memberListResult.jsp");
				disp.forward(req, resp);*/
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	private String IdFind(HttpServletRequest req) throws SQLException {
		
	String memName = req.getParameter("username");	
		
	String memEmail = req.getParameter("email");	
		
	MemberVO memberVo = new MemberVO();	
		
	memberVo.setMemName(memName);
	memberVo.setMemEmail(memEmail);
		
	MemberService service = new MemberService();	
	
	
	String userId = service.idFind(memberVo);
	
		
		return userId;
	}
	
	
	
}







































