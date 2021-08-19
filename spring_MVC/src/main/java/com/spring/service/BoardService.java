package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.BoardVO;

public interface BoardService {

	//목록 조회(boardList와 pageMaker를 한꺼번에 내보내야 하기 때문에 Map으로 처리
	Map<String, Object> getBoardList(SearchCriteria cri) throws SQLException;
	
	//상세보기
	BoardVO getBoard(int nno) throws SQLException;
	
	//수정화면 상세
	BoardVO getBoardForModify(int nno) throws SQLException;
	
	//등록
	void regist(BoardVO board) throws SQLException;
	
	//수정
	void modify(BoardVO board) throws SQLException;
	
	//삭제
	void remove(int nno) throws SQLException;	
}
