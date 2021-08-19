package kr.or.ddit.mypageuser.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

public class MemberInfoHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/mypageuser/memberInfo.jsp";
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MemberService memberService = new MemberService();
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		List<MemberVO> memberList = memberService.getMemList(memId);
		
		req.setAttribute("memberList", memberList);
		
		return VIEW_PAGE;
	}

	
	
	
	
}
