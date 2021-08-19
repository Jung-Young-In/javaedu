package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.BoardVO;
import com.spring.dto.PdsVO;

public interface PdsDAO {

	List<PdsVO> selectPdsCriteria(SearchCriteria cri)	throws SQLException;
	int selectPdsCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	PdsVO selectPdsByPno(int pno)throws SQLException;
	
	//파일명 찾기
	PdsVO selectPdsByFileName(String fileName) throws SQLException;
	
	void insertPds(PdsVO pds)throws SQLException;
	void updatePds(PdsVO pds)throws SQLException;
	void deletePds(int pno)throws SQLException;

	
	
	//viewcnt  증가
	void increaseViewCnt(int pno)throws SQLException;
	
	//pds_seq.nextval 가져오기
	int getSeqNextValue() throws SQLException;

}

