package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.NoticeVO;

public interface NoticeService {

	//목록 조회(noticeList와 pageMaker를 한꺼번에 내보내야 하기 때문에 Map으로 처리
	Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException;
	
	//파일명 찾기
	NoticeVO findFileInContent(String fileName) throws SQLException;
	
	//상세보기
	NoticeVO getNotice(int nno) throws SQLException;
	
	//수정화면 상세
	NoticeVO getNoticeForModify(int nno) throws SQLException;
	
	//등록
	void regist(NoticeVO notice) throws SQLException;
	
	//수정
	void modify(NoticeVO board) throws SQLException;
	
	//삭제
	void remove(int nno) throws SQLException;
}
