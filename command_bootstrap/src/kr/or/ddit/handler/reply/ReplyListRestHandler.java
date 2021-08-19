package kr.or.ddit.handler.reply;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.controller.JSONResolver;
import kr.or.ddit.handler.Handler;
import kr.or.ddit.service.ReplyService;
//화면을 주는 핸들러가 아닌 RESTful 방식의 핸들러이기 때문에 아래와 같이 클래스 네이밍함
public class ReplyListRestHandler implements Handler {

	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		//SearchCriteria가 아닌 Criteria로 해도 무관(검색할 것이 아니기 떄문에)
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		Map<String, Object> dataMap = replyService.getReplyList(bno, cri);
		
		JSONResolver.view(response, dataMap);
		
		return url;
	}
}
