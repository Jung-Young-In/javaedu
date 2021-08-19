package com.spring.dto;

import java.util.Date;

public class ApprovalVO {

	private String appNo;
	private String empNo;
	private String docId;
	private String appTitle;
	private String appContent;
	private String appStatus;
	private Date appUpDate;
	
	private int viewcnt;
	
	public String getAppNo() {
		return appNo;
	}
	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
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
	public String getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}
	public Date getAppUpDate() {
		return appUpDate;
	}
	public void setAppUpDate(Date appUpDate) {
		this.appUpDate = appUpDate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	@Override
	public String toString() {
		return "ApprovalVO [appNo=" + appNo + ", empNo=" + empNo + ", docId=" + docId + ", appTitle=" + appTitle
				+ ", appContent=" + appContent + ", appStatus=" + appStatus + ", appUpDate=" + appUpDate + ", viewcnt="
				+ viewcnt + "]";
	}
}
