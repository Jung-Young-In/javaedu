package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.ApprovalVO;

public interface ApprovalDAO {

	List<ApprovalVO> selectSearchApprovalList(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectSearchApprovalByCategory(SearchCriteria cri, ApprovalVO approval) throws SQLException;
	
	int selectSearchApprovalListCount(SearchCriteria cri) throws SQLException;
	
	ApprovalVO selectApprovalByAppNo(String appNo) throws SQLException;
	
	ApprovalVO selectApprovalByFileName(String FileName) throws SQLException;
	
	String selectApprovalSequenceNextValue() throws SQLException;
	
	void insertApproval(ApprovalVO approval) throws SQLException;
	
	void updateApproval(ApprovalVO approval) throws SQLException;
	
	void deleteApproval(String appNo) throws SQLException;
}
