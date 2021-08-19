package kr.or.ddit.mypageuser.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.exerciseNotice.Dao.ExerciseNoticeDaoImpl;
import kr.or.ddit.exerciseNotice.service.ExerciseNoticeServiceImpl;
import kr.or.ddit.exerciseNotice.service.IExerciseNoticeService;
import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;

public class MemberNoticeHandler implements CommandHandler{

	private static final String VIEW_PAGE =  "/WEB-INF/view/mypageuser/memberNotice.jsp";
	
	
	
	
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
		if(req.getMethod().equals("GET")) { //GET방식인 경우 isRedirect을 하지 않는다
			
			String memId = (String)req.getParameter("memId");
			
			req.setAttribute("memId2", memId);
			
			return VIEW_PAGE;
		}else {
			// 1. 요청파라티터 정보 가져오기
						String memId = req.getParameter("memId");
						String exercise = req.getParameter("exercise");
						String food = req.getParameter("food");
						String month = req.getParameter("month");
						
						
						// 2. 서비스 객체 생성하기
						IExerciseNoticeService exerciseNoticeService = 
								ExerciseNoticeServiceImpl.getInstance();
						
						HttpSession session = req.getSession();
						String trainerId = (String)session.getAttribute("signedUser");
						
						
						
						// 3. 회원정보 등록하기
						ExerciseNoticeVO ev = new ExerciseNoticeVO();
						ev.setTrainerId(trainerId);
						ev.setMemId(memId);
						ev.setExercise(exercise);
						ev.setFood(food);
						ev.setMemDate(month);
						
						int cnt = exerciseNoticeService.insertExerciseNotice(ev);
						
						String msg = "";
						
						if(cnt > 0) {
							msg = "성공";
						}else {
							msg = "실패";
						}
						
						// 4. 목록 조회화면으로 이동
						String redirectUrl = req.getContextPath() +
								"/HW/mypageuser/memberInfo.do?msg=" 
								+ URLEncoder.encode(msg, "UTF-8");
						
						return redirectUrl;
		}
	}

	
	
	
	
}
