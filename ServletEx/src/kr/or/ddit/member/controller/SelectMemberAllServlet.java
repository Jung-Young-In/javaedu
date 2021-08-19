package kr.or.ddit.member.controller;

import java.io.IOException;
import java.sql.SQLException;
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

@WebServlet("/list")
public class SelectMemberAllServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		IMemberService memberService = MemberServiceImpl.getInstance();	
		
		List<MemberVO> memList;
		try {
			memList = memberService.getAllMemberList();
			
			req.setAttribute("memList", memList);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/list.jsp");	
			
			dispatcher.forward(req, resp);	
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
