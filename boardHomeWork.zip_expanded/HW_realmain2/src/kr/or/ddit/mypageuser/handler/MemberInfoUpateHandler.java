package kr.or.ddit.mypageuser.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

public class MemberInfoUpateHandler implements CommandHandler{

	
	private static final String VIEW_PAGE =  "/WEB-INF/view/mypageuser/memberInfoUpdate.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { // Get방식인 경우.
			return false;
		}else { // POST 방식인 경우... 
			return true;
		}
	}
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			
			HttpSession session =req.getSession();
			
			String memId = (String)session.getAttribute("signedUser");
			
			MemberService memberservice = new MemberService();
			
			MemberVO mv = memberservice.retrieveMember(memId);
			
			req.setAttribute("MemberVO", mv);
			
			return VIEW_PAGE;
			
		}else {
			HttpSession session =req.getSession();
			String memId = (String)session.getAttribute("signedUser");
			// 1. 요청파라티터 정보 가져오기
			String MemName = req.getParameter("MemName");
			long MemIn = Long.parseLong(req.getParameter("MemIn"));
			String MemEmail = req.getParameter("MemEmail");
			long MemHp = Long.parseLong(req.getParameter("MemHp"));
			long MemHeight = Long.parseLong(req.getParameter("MemHeight"));
			long MemWeight = Long.parseLong(req.getParameter("MemWeight"));
			String MemOb = req.getParameter("MemOb");
			String MemSick = req.getParameter("MemSick");
			
			MemberService memberservice = new MemberService();
			
			// 3. 회원정보 수정하기
			MemberVO mv = new MemberVO();
			mv.setMemId(memId);
			mv.setMemName(MemName);
			mv.setMemIn(MemIn);
			mv.setMemEmail(MemEmail);
			mv.setMemHp(MemHp);
			mv.setMemHeight(MemHeight);
			mv.setMemWeight(MemWeight);
			mv.setMemOb(MemOb);
			mv.setMemSick(MemSick);
			
			int cnt = memberservice.memberInfoUpdate(mv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			// 4. 목록 조회화면으로 이동
			String redirectUrl =req.getContextPath()+"/HW/mypageuser/main.do?msg=" + URLEncoder.encode(msg,"UTF-8");
			
			return redirectUrl;
			
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
