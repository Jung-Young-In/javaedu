package kr.or.ddit.exerfood.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.exerfood.service.ExerFoodService;
import kr.or.ddit.exerfood.service.IExerFoodService;
import kr.or.ddit.exerfood.vo.ExerVO;
import kr.or.ddit.exerfood.vo.FoodVO;

public class ViewExerSikdanHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/exerSikdan.jsp";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String exeName = req.getParameter("exeName");
		int foodNum = req.getParameter("foodNum")==null? 0:Integer.parseInt(req.getParameter("foodNum"));
		
		
		IExerFoodService exerService = ExerFoodService.getInstance();
		IExerFoodService foodService = ExerFoodService.getInstance();
		
		ExerVO ev = new ExerVO();
		ev.setExeName(exeName);
		
		FoodVO fv = new FoodVO();
		fv.setFoodNum(foodNum);
		
		List<ExerVO> exerList = exerService.selectExerList(ev);
		
		List<FoodVO> foodList = foodService.selectFoodList(fv);
		
		req.setAttribute("exerList", exerList);
		
		req.setAttribute("foodList", foodList);
		
		String msg1 = "";
		
		String msg2 = "";
		
		if(exerList.size() > 0) {
			msg1 = "성공";
		}else {
			msg1 = "실패";
		}
		
		if(foodList.size() > 0) {
			msg2 = "성공";
		}else {
			msg2 = "실패";
		}
		
		return VIEW_PAGE;
	}

}
