package kr.or.ddit.exerBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerBoard.vo.ExerBoardVO;

public interface IExerBoardDao {
	
	
	
	public int insertExerBoard(SqlMapClient smc,ExerBoardVO bv)throws SQLException;
	
	
	public List<ExerBoardVO> getAllExerBoardList(SqlMapClient smc)
			throws SQLException;
	
	
	public int updateExerBoard (SqlMapClient smc,ExerBoardVO bv)
			throws SQLException;
	
	
	public int deleteExerBoard(SqlMapClient smc,String exerBoardNum)
			throws SQLException;
	
	
	public ExerBoardVO getExerBoard(SqlMapClient smc,String exerBoardNum)
			throws SQLException;

}
