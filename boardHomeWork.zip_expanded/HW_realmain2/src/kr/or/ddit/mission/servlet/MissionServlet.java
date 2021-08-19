package kr.or.ddit.mission.servlet;

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
import kr.or.ddit.mission.service.IMissionService;
import kr.or.ddit.mission.service.MissionServiceImpl;
import kr.or.ddit.mission.vo.missionVO;


@WebServlet("/MissionServlet")
public class MissionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// super.doPost(req, resp); // 지워야함 : extends한 HttpServlet 의 doPost를 호출하는 것이기
		// 때문에 현재 클래스의 doPost를 사용할 수 없음

		// 브라우저로 부터 받은 값을 사용하기 위해 request에서 parameter를 get.
		String flag = req.getParameter("flag");
		try {
			if ("missionList".equals(flag)) { // 목록조회
				// 스트링을쓰고 equals를 쓰면 에러가 나지않는다
				// 왜냐하면 flag가 널일수도있기 때문에;
				List<missionVO> missionList = getMissionInfo(req);

				// 브라우저로 전달한 결과를 request에 attribute로 세팅
				req.setAttribute("missionList", missionList);

				RequestDispatcher disp = req.getRequestDispatcher("/HW_video/common/missionResult.jsp");
				disp.forward(req, resp);

			} 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private List<missionVO> getMissionInfo(HttpServletRequest req) throws SQLException {
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		missionVO vv = new missionVO();
		
		vv.setMemId(memId);

		IMissionService missionService = MissionServiceImpl.getInstance();
		
		List<missionVO> missionList = missionService.getMissionInfo(vv);
		
		return missionList;
		
	}

}