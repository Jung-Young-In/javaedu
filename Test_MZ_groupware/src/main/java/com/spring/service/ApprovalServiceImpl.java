package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.ApprovalDAO;
import com.spring.dao.ReplyDAO;
import com.spring.dto.ApprovalVO;

public class ApprovalServiceImpl implements ApprovalService{

	private ApprovalDAO approvalDAO;
	public void setApprovalDAO(ApprovalDAO approvalDAO) {
		this.approvalDAO = approvalDAO;
	}
	
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getApprovalList(SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ApprovalVO> approvalList = approvalDAO.selectSearchApprovalList(cri);
		
		for (ApprovalVO approval : approvalList) {
			int replycnt = replyDAO.countReply(Integer.parseInt(approval.getAppNo()));
			approval.setViewcnt(replycnt);
		}
		
		int totalCount = approvalDAO.selectSearchApprovalListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public ApprovalVO findFileInContent(String fileName) throws SQLException {
		
		ApprovalVO approval = approvalDAO.selectApprovalByFileName(fileName);
		
		return approval;
	}

	@Override
	public ApprovalVO getApproval(String appNo) throws SQLException {
		
		return null;
	}

	@Override
	public ApprovalVO getApprovalForModify(String appNo) throws SQLException {

		ApprovalVO approval = approvalDAO.selectApprovalByAppNo(appNo);
		
		return approval;
	}

	@Override
	public void regist(ApprovalVO approval) throws SQLException {

		String appNo = approvalDAO.selectApprovalSequenceNextValue();
		approval.setAppNo(appNo);
		approvalDAO.insertApproval(approval);
	}

	@Override
	public void modify(ApprovalVO approval) throws SQLException {

		approvalDAO.updateApproval(approval);
	}

	@Override
	public void remove(String appNo) throws SQLException {

		approvalDAO.deleteApproval(appNo);
	}
}
