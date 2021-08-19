package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.NoticeVO;

public interface NoticeDAO {

	List<NoticeVO> selectSearchNoticeList(SqlSession session, SearchCriteria cri) throws SQLException;
	
	int selectSearchNoticeListCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNno(SqlSession session, int nno) throws SQLException;
	
	//viewcnt 증가
	void increaseViewCount(SqlSession session, int nno) throws SQLException;
	
	//Notice_seq.nextVal 가져오기
	int selectNoticeSequenceNextValue(SqlSession session) throws SQLException;
	
	void insertNotice(SqlSession session, NoticeVO notice) throws SQLException;
	
	//DAO는 해당 쿼리문을 실행해 줄수 있도록 작성
	
	void updateNotice(SqlSession session, NoticeVO notice) throws SQLException;
	
	void deleteNotice(SqlSession session, int nno) throws SQLException;
}