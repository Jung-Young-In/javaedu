package kr.or.ddit.mypageuser.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.exerciseNotice.service.ExerciseNoticeServiceImpl;
import kr.or.ddit.exerciseNotice.service.IExerciseNoticeService;
import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;
import kr.or.ddit.mission.service.IMissionService;
import kr.or.ddit.mission.service.MissionServiceImpl;
import kr.or.ddit.mission.vo.missionVO;

public class MissionHandler implements CommandHandler{

	private static final String VIEW_PAGE =  "/WEB-INF/view/mypageuser/memberMission.jsp";
	
	
	
	
	
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
			String memId = req.getParameter("memId");
			String mission1 = req.getParameter("mission1");
			String mission2 = req.getParameter("mission2");
			String mission3 = req.getParameter("mission3");
			String month = req.getParameter("month");
			
			
			// 2. 서비스 객체 생성하기
			IMissionService missionService = MissionServiceImpl.getInstance();
			
			HttpSession session = req.getSession();
			String trainerId = (String)session.getAttribute("signedUser");
			
			
			// 3. 회원정보 등록하기
			missionVO mv = new missionVO();
			mv.setTrainerId(trainerId);
			mv.setMemId(memId);
			mv.setExerMission1(mission1);
			mv.setExerMission2(mission2);
			mv.setExerMission3(mission3);
			mv.setMemDate(month);
			
			int cnt = missionService.insertMission(mv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			// 4. 목록 조회화면으로 이동
			String redirectUrl = req.getContextPath() +
					"/HW/mypageuser/memberMissionInfo.do?msg=" 
					+ URLEncoder.encode(msg, "UTF-8");
			return redirectUrl;
		}
	}

	
	
	
	
}
