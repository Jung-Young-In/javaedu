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

@WebServlet("/delete")
public class DeleteMemberServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = req.getParameter("memId");
		
		req.setAttribute("memId", memId);
		
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/deleteForm.jsp");
		
		dispatcher.forward(req, resp);
		
		List<MemberVO> memberList;
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMemberService memberService = MemberServiceImpl.getInstance();
		List<MemberVO> memberList;
		String memId = req.getParameter("memId");
		
		req.setAttribute("memId", memId);
		try {
			int result = memberService.deleteMember(memId);
			if (result == 1) {
				memberList = memberService.getAllMemberList();
				req.setAttribute("memList", memberList);
				req.setAttribute("msg", "회원 삭제에 실패하였습니다.");
				req.getRequestDispatcher("/WEB-INF/view/list.jsp").forward(req, resp);
			}else {
				memberList = memberService.getAllMemberList();
				req.setAttribute("memList", memberList);
				req.setAttribute("msg", "회원 삭제를 정상적으로 처리하였습니다.");
				req.getRequestDispatcher("/WEB-INF/view/list.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				memberList = memberService.getAllMemberList();
				req.setAttribute("memList", memberList);
				req.setAttribute("msg", "서버 이상으로  정상적으로 처리하지 못하였습니다.");
				req.getRequestDispatcher("/WEB-INF/view/list.jsp").forward(req, resp);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		
		
		
	}
}
