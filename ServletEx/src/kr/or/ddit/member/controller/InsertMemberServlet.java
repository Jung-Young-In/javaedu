package kr.or.ddit.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/join")
public class InsertMemberServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/view/insertForm.jsp");
		
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String memId = req.getParameter("memId");
		String memName = req.getParameter("memName");
		String memTel = req.getParameter("memTel");
		String memAddr = req.getParameter("memAddr");
		
		
		MemberVO memberVo = new MemberVO();
		memberVo.setMemId(memId);
		memberVo.setMemName(memName);
		memberVo.setMemTel(memTel);
		memberVo.setMemAddr(memAddr);
		
		
		IMemberService memberService = MemberServiceImpl.getInstance();
		List<MemberVO> memberList;

		try {
			int result = memberService.insertMember(memberVo);
			
			if (result == 1) {
				memberList = memberService.getAllMemberList();
				req.setAttribute("memList", memberList);
				req.setAttribute("msg", "회원 등록을 성공적으로 처리하였습니다.");
				req.getRequestDispatcher("/WEB-INF/view/list.jsp").forward(req, resp);
			}else {
				memberList = memberService.getAllMemberList();
				req.setAttribute("memList", memberList);
				req.setAttribute("msg", "회원등록에 실패하였습니다.");
				req.getRequestDispatcher("/WEB-INF/view/list.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				memberList = memberService.getAllMemberList();
				req.setAttribute("memList", memberList);
				req.setAttribute("msg", "서버 이상으로 인하여 정상적으로 처리되지 않았습니다.");
				req.getRequestDispatcher("WEB-INF/view/list.jsp").forward(req, resp);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}
}
