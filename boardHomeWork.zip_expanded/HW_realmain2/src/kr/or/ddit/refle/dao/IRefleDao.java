package kr.or.ddit.refle.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.refle.vo.RefleVO;

public interface IRefleDao {

	
	
	public int insertRefle(SqlMapClient smc, RefleVO refleVo)throws SQLException;
	
	
	
	
	
	
	
	
}
