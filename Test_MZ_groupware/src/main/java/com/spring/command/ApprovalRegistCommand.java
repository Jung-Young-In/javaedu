package com.spring.command;

import java.util.Date;

import com.spring.dto.ApprovalVO;

public class ApprovalRegistCommand {

	private String appTitle;
	private String appContent;
	private String empNo;
	
	
	public String getAppTitle() {
		return appTitle;
	}
	public void setAppTitle(String appTitle) {
		this.appTitle = appTitle;
	}
	public String getAppContent() {
		return appContent;
	}
	public void setAppContent(String appContent) {
		this.appContent = appContent;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	@Override
	public String toString() {
		return "ApprovalRegistCommand [appTitle=" + appTitle + ", appContent=" + appContent + ", empNo=" + empNo + "]";
	}
	
	public ApprovalVO toApprovalVO() {
		ApprovalVO approval = new ApprovalVO();
		
		approval.setAppTitle(this.appTitle);
		approval.setAppContent(this.appContent);
		approval.setEmpNo(this.empNo);
		approval.setAppUpDate(new Date());
		
		return approval;
	}
}
