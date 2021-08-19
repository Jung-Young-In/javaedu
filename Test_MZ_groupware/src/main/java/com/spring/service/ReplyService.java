package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.ReplyVO;

public interface ReplyService {

	//리스트 보기
	Map<String,Object> getReplyList(int appNo, SearchCriteria cri) throws SQLException;	//SearchCriteria가 아닌 Criteria로 해도 무관
	
	//리스트 개수
	int getReplyListCount(int appNo) throws SQLException;
	
	//등록
	void registReply(ReplyVO reply) throws SQLException;
	
	//수정
	void modifyReply(ReplyVO reply) throws SQLException;
	
	//삭제
	void removeReply(int rno) throws SQLException;
}
