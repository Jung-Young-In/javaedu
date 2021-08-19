package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.AttachVO;

public interface AttachDAO {

	public List<AttachVO> selectAttachByPno(int pno) throws SQLException;
	public AttachVO selectAttachByAno(int ano) throws SQLException;
	
	public void insertAttach(AttachVO attach) throws SQLException;
	
	public void deleteAttach(int ano) throws SQLException;
	
	public void deleteAllAttach(int pno) throws SQLException;
}