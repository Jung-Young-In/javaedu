package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String flag = req.getParameter("flag");
		try {
			if ("L".equals(flag)) {
				List<MemberVO> list = retrieveMemberList(req);
				req.setAttribute("list", list);
				
				RequestDispatcher disp = req.getRequestDispatcher("/html/member/memberListResult.jsp");
				disp.forward(req, resp);
			} else if ("C".equals(flag)) {
				createMember(req);
				
				req.setAttribute("resultCnt", 1);
				RequestDispatcher disp = req.getRequestDispatcher("/main/common/checkResult.jsp");
				disp.forward(req, resp);
			} else if ("R".equals(flag)) {
				
			} else if ("U".equals(flag)) {
				
			} else if ("D".equals(flag)) {
				
			} else if ("CHKID".equals(flag)) {
				MemberVO memberVo = checkMemberId(req);
				
				int resultCnt = 0;
				if (memberVo != null) {
					resultCnt = 1;
				}
				
				req.setAttribute("resultCnt", resultCnt);
				
				RequestDispatcher disp = req.getRequestDispatcher("main/common/checkResult.jsp");
				disp.forward(req, resp);
				
			} else if ("LOGIN".equals(flag)) {
				
				String memberVo = login(req);
				
				int resultCnt = 0;
				if (!memberVo.equals(null)) {
					resultCnt =1;
				}
				
				if (resultCnt == 1) {
					HttpSession session = req.getSession();
					
					session.setAttribute("signedUser", memberVo);
				}
				req.setAttribute("memberVo", memberVo);
				req.setAttribute("resultCnt", resultCnt);
			
				RequestDispatcher disp = req.getRequestDispatcher("/main/common/checkResult2.jsp");
				disp.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
	}
}


	private String login(HttpServletRequest req)throws SQLException {
		
		String memId = req.getParameter("memId");
		
		String memPassword = req.getParameter("memPassword");
	
		MemberVO memberVo = new MemberVO();
		
		memberVo.setMemId(memId);
		memberVo.setMemPassword(memPassword);
		
		MemberService service = new MemberService();
	
		memberVo = service.loginMember(memberVo);
		
		 if(memberVo != null) {
			 return memId;
		 }
		return null;
	}
	
	private MemberVO checkMemberId(HttpServletRequest req) throws SQLException {
	
		String memId = req.getParameter("memId");
	
		MemberService service = new MemberService();
	
		MemberVO memberVo = service.retrieveMember(memId);
	
		return memberVo;
	}
	
	private void createMember(HttpServletRequest req) throws Exception {

		MemberVO memberVo = new MemberVO();
		BeanUtils.populate(memberVo,req.getParameterMap());
	
		MemberService service = new MemberService();
		service.createMember(memberVo);
	}
	
	private List<MemberVO> retrieveMemberList(HttpServletRequest req) throws SQLException {
		String memId = req.getParameter("memId");
		String memName = req.getParameter("memName");
	
		MemberVO memberVo = new MemberVO();
		memberVo.setMemId(memId);
		memberVo.setMemName(memName);
	
		MemberService service = new MemberService();
		List<MemberVO> list = service.retrieveMemberList(memberVo);
		
		return list;
	}
}