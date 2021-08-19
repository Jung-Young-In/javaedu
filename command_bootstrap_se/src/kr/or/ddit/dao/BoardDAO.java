package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectSearchBoardList(SqlSession session, SearchCriteria cri) throws SQLException;
	
	int selectSearchBoardListCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	BoardVO selectBoardByBno(SqlSession session, int bno) throws SQLException;
	
	//viewcnt 증가
	void increaseViewCount(SqlSession session, int bno) throws SQLException;
	
	//Board_seq.nextVal 가져오기
	int selectBoardSequenceNextValue(SqlSession session) throws SQLException;
	
	void insertBoard(SqlSession session, BoardVO board) throws SQLException;
	
	//DAO는 해당 쿼리문을 실행해 줄수 있도록 작성
	
	void updateBoard(SqlSession session, BoardVO board) throws SQLException;
	
	void deleteBoard(SqlSession session, int bno) throws SQLException;	
}
