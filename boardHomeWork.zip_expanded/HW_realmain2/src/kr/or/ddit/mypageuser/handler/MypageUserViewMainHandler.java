package kr.or.ddit.mypageuser.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

public class MypageUserViewMainHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/mypageuser/mypageuser_main.jsp";
	private static final String VIEW_PAGE2 = "/WEB-INF/view/mypageuser/mypageuser_main2.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");

		MemberService memberservice = new MemberService();
		MemberVO memInfo = memberservice.retrieveMember(memId);
		
		String grade = memInfo.getGradeCode();
		
		if(grade.equals("G003")) {
			
			req.setAttribute("memberVO", memInfo);
			return VIEW_PAGE2;
		}else {
		
		
		req.setAttribute("memberVO", memInfo);
		return VIEW_PAGE;
		}
		
	}

}
