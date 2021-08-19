package kr.or.ddit.video.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.video.service.IVideoService;
import kr.or.ddit.video.service.VideoService;
import kr.or.ddit.video.vo.VideoVO;

public class ListVideoPathHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/video_view.jsp";
	private static final String VIEW_PAGE2 = "/WEB-INF/view/video_primiumview.jsp";
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			
		String videoNum	= req.getParameter("videoNum");
		String videoName = req.getParameter("videoName");
		String videoContent = req.getParameter("videoContent");
		String videoPath = req.getParameter("videoPath");
	
		IVideoService videoService = VideoService.getInstance();
		
		VideoVO vv = new VideoVO();
		vv.setVideoNum(videoNum);
		vv.setVideoName(videoName);
		vv.setVideoContent(videoContent);
		vv.setVideoPath(videoPath);
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("signedUser");
		
		MemberService memberservice = new MemberService();
		String memGrade = memberservice.getGrade(memId);
		
		System.out.println("이것이 아이디이다아아아: "+memId);
		System.out.println("이것이 등급이다아이다아아아: "+memGrade);
		
		
		if(memGrade.equals("G001")) {
			

			List<VideoVO> videoList = videoService.selectVideoPathList(vv);
			
			req.setAttribute("videoList", videoList);
			
			
			return VIEW_PAGE;
			
			
		}else if(memGrade.equals("G002")) {

			List<VideoVO> videoList = videoService.selectPrimiumVideoPathList(vv);
			
			req.setAttribute("videoList", videoList);
			
			return VIEW_PAGE2;	
			
			
		}else {
			
			return VIEW_PAGE;
		}
		
	}

}
