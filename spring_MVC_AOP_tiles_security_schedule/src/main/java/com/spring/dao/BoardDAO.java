package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.BoardVO;
import com.spring.dto.NoticeVO;

public interface BoardDAO {

	List<BoardVO> selectSearchBoardList(SearchCriteria cri) throws SQLException;
	
	int selectSearchBoardListCount(SearchCriteria cri) throws SQLException;
	
	BoardVO selectBoardByBno(int bno) throws SQLException;
	
	BoardVO selectBoardByFileName(String fileName) throws SQLException;
	
	//viewcnt 증가
	void increaseViewCount(int bno) throws SQLException;
	
	//Board_seq.nextVal 가져오기
	int selectBoardSequenceNextValue() throws SQLException;
	
	void insertBoard(BoardVO board) throws SQLException;
	
	//DAO는 해당 쿼리문을 실행해 줄수 있도록 작성
	
	void updateBoard(BoardVO board) throws SQLException;
	
	void deleteBoard(int bno) throws SQLException;	
}
