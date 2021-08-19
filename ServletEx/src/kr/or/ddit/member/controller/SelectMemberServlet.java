package kr.or.ddit.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/info")
public class SelectMemberServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId");

		IMemberService memberService = MemberServiceImpl.getInstance();	
		
		try {
		MemberVO memInfo = memberService.getMember(memId);
		req.setAttribute("memInfo", memInfo);
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/view/select.jsp");	
		dispatcher.forward(req, resp);	
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
