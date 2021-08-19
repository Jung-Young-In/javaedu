package kr.or.ddit.command;

import java.util.Date;

import kr.or.ddit.dto.ReplyVO;

public class ReplyRegistCommand {

	private int bno;
	private String replyer;
	private String replytext;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	
	public ReplyVO toReplyVO() {

		ReplyVO reply = new ReplyVO();
		
		reply.setBno(bno);
		reply.setReplyer(replyer);
		reply.setReplytext(replytext);
		reply.setRegdate(new Date());	//예를 들어 등록날짜를 사용자가 요청한 시간으로 할 것인지 DB에 들어가는 시간으로 할것인지에 대한 선택으로 파라미터에 new Date()를 기술(여기서는 sql문을 모르기 때문에 DB에 sysdate를 설정해 놓은 것을 알지 못함)
		reply.setUpdatedate(new Date());
		
		return reply;
	}
}
