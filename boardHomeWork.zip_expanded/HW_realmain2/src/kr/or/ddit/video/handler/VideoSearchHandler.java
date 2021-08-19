package kr.or.ddit.video.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.video.service.VideoService;
import kr.or.ddit.video.vo.VideoVO;

public class VideoSearchHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/video_view.jsp";
	private static final String VIEW_PAGE2 = "/WEB-INF/view/video_primiumview.jsp";
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String videoKey = req.getParameter("videoKey");
		
		VideoVO videoVo = new VideoVO();
		videoVo.setVideoName(videoKey);
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		MemberService memberservice = new MemberService();
		String memGrade = memberservice.getGrade(memId);
		
		System.out.println("이것이 아이디이다아아아: "+memId);
		System.out.println("이것이 등급이다아이다아아아: "+memGrade);
		
		
		if(memGrade.equals("G001")) {
			

			//회원 목록 조회
			VideoService service = new VideoService();
			List<VideoVO> videoList = service.selectVideoPathList(videoVo);
			
			req.setAttribute("videoList", videoList);
			
			
			return VIEW_PAGE;
			
			
		}else if(memGrade.equals("G002")) {

			//회원 목록 조회
			VideoService service = new VideoService();
			List<VideoVO> videoList = service.selectPrimiumVideoPathList(videoVo);
			
			req.setAttribute("videoList", videoList);
			
			return VIEW_PAGE2;	
			
			
		}else {
			
			return VIEW_PAGE;
		}
	}

}
