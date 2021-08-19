package kr.or.ddit.exerciseNotice.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.exerciseNotice.service.ExerciseNoticeServiceImpl;
import kr.or.ddit.exerciseNotice.service.IExerciseNoticeService;
import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;

public class ListExerciseNoticeHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/exercise/exerciseNotice_view.jsp";
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			
		
		String exerciseNoticeDate = req.getParameter("exerciseNoticeDate");
	
		IExerciseNoticeService exerciseNoticeService = ExerciseNoticeServiceImpl.getInstance();
		
		ExerciseNoticeVO vv = new ExerciseNoticeVO();
		vv.setMemDate(exerciseNoticeDate);
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		MemberService memberservice = new MemberService();
		String memGrade = memberservice.getGrade(memId);
		
		System.out.println("이것이 아이디이다아아아: "+memId);
		System.out.println("이것이 등급이다아이다아아아: "+memGrade);
		
			

			List<ExerciseNoticeVO> exerciseNoticeList = exerciseNoticeService.retrieveExerciseList(vv);
			
			req.setAttribute("exerciseNoticeList", exerciseNoticeList);
			
			
			
			
			return VIEW_PAGE;
		
	}

}
