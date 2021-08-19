package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.ApprovalVO;

public interface ApprovalService {

	//목록조회
	Map<String, Object> getApprovalList(SearchCriteria cri) throws SQLException;
	
	//파일명 찾기
	ApprovalVO findFileInContent(String fileName) throws SQLException;
	
	//상세보기
	ApprovalVO getApproval(String appNo) throws SQLException;
	
	//수정화면 상세
	ApprovalVO getApprovalForModify(String appNo) throws SQLException;
	
	//등록
	void regist(ApprovalVO approval) throws SQLException;
	
	//수정
	void modify(ApprovalVO approval) throws SQLException;
	
	//삭제
	void remove(String appNo) throws SQLException;
}
