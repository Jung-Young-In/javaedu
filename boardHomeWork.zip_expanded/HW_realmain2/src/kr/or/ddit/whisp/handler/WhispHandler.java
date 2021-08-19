package kr.or.ddit.whisp.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.whisp.service.WhispServiceImpl;
import kr.or.ddit.whisp.service.IWhispService;
import kr.or.ddit.whisp.vo.WhispVO;
import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.video.vo.VideoVO;

public class WhispHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/whisp/userWhisp.jsp";
	private static final String VIEW_PAGE2 = "/WEB-INF/view/whisp/ptWhisp.jsp";
	private static final String VIEW_PAGE3 = "/WEB-INF/view/membership/membership_ex.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("signedUser");

		MemberService memberservice = new MemberService();
		String memGrade = memberservice.getGrade(memId);
		
		
		
		if (memGrade.equals("G002")) {
			IWhispService whispService = WhispServiceImpl.getInstance();
			List<WhispVO> whispList = whispService.getAllWhispList();
			req.setAttribute("whispList", whispList);
			return VIEW_PAGE;

		} else if (memGrade.equals("G003")) {

			IWhispService whispService = WhispServiceImpl.getInstance();
			List<WhispVO> whispList = whispService.getAllWhispList();
			req.setAttribute("whispList", whispList);
			return VIEW_PAGE2;

		} else {

			return VIEW_PAGE3;
		}

	}

}
