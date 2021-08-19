package kr.or.ddit.handler.reply;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.ReplyRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.handler.Handler;
import kr.or.ddit.service.ReplyService;

public class ReplyRegistHandler implements Handler {

	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = null;
		
		ObjectMapper mapper = new ObjectMapper();
		
		ReplyRegistCommand replyReq = mapper.readValue(request.getReader(), ReplyRegistCommand.class);
		
		PrintWriter out = response.getWriter();
		
		try {
			
			replyService.registReply(replyReq.toReplyVO());	//replyReq를 넣지 못하기 때문에 toReplyVO() 메서드를 만들고 불러서 넣어주게 됨
			
			//댓글이 들어갈 페이지를 정해주는 부분(PageMaker에서 만들어 놓았기 때문에 기존 인프라 이용)
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(new SearchCriteria());
			pageMaker.setTotalCount(replyService.getReplyListCount(replyReq.toReplyVO().getBno()));
			
			int realEndPage = pageMaker.getRealEndPage();
			
			out.print("SUCCESS,"+realEndPage);
			
		}catch (SQLException e) {
			out.print("FAIL");
		}finally {
			out.close();
		}
		return url;
	}
}
