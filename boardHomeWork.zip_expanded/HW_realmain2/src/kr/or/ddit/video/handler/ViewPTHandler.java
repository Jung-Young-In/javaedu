package kr.or.ddit.video.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.exerfood.service.ExerFoodService;
import kr.or.ddit.exerfood.service.IExerFoodService;
import kr.or.ddit.exerfood.vo.ExerVO;
import kr.or.ddit.exerfood.vo.FoodVO;
import kr.or.ddit.video.service.IVideoService;
import kr.or.ddit.video.service.VideoService;
import kr.or.ddit.video.vo.VideoVO;

public class ViewPTHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/pt_view.jsp";
	
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
		String exeName = req.getParameter("exeName");
		int foodNum = req.getParameter("foodNum")==null? 0:Integer.parseInt(req.getParameter("foodNum"));
	
		IVideoService videoService = VideoService.getInstance();
		IExerFoodService exerService = ExerFoodService.getInstance();
		IExerFoodService foodService = ExerFoodService.getInstance();
		
		VideoVO vv = new VideoVO();
		vv.setVideoNum(videoNum);
		vv.setVideoName(videoName);
		vv.setVideoContent(videoContent);
		vv.setVideoPath(videoPath);

		ExerVO ev = new ExerVO();
		ev.setExeName(exeName);
		
		FoodVO fv = new FoodVO();
		fv.setFoodNum(foodNum);
		List<VideoVO> videoList = videoService.selectVideoPathList(vv);
		
		List<ExerVO> exerList = exerService.selectExerList(ev);
		
		List<FoodVO> foodList = foodService.selectFoodList(fv);
		
		req.setAttribute("videoList", videoList);
		
		req.setAttribute("exerList", exerList);
		
		req.setAttribute("foodList", foodList);
		
		
		return VIEW_PAGE;
	}

}
