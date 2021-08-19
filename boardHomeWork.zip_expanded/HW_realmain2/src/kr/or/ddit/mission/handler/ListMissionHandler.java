package kr.or.ddit.mission.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.mission.service.IMissionService;
import kr.or.ddit.mission.service.MissionServiceImpl;
import kr.or.ddit.mission.vo.missionVO;

public class ListMissionHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/mypageuser/mypageuser_main.jsp";
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
	
		IMissionService missionService = MissionServiceImpl.getInstance();
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		missionVO vv = new missionVO();
		
		vv.setMemId(memId);

		List<missionVO> missionList = missionService.getMissionInfo(vv);
		
		req.setAttribute("missionList", missionList);
		
		
		return VIEW_PAGE;
			
			
		
	}

}
