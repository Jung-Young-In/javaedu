package com.spring.dto;

import java.util.Date;

public class ReplyVO {

	private int rno;			//고유번호
	private int appNo;			//board번호
	private String replytext;	//reply 내용
	private String replyer;		//member테이블 id 참조
	private Date regdate;		//등록날짜
	private Date updatedate;	//수정날짜

	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", appNo=" + appNo + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
}
