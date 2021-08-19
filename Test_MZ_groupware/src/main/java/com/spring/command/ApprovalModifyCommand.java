package com.spring.command;

import com.spring.dto.ApprovalVO;

public class ApprovalModifyCommand extends ApprovalRegistCommand{

	private String appNo;

	public String getAppNo() {
		return appNo;
	}

	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}

	@Override
	public ApprovalVO toApprovalVO() {

		ApprovalVO approval = super.toApprovalVO();
		approval.setAppNo(appNo);
		
		return approval;
	}
}
