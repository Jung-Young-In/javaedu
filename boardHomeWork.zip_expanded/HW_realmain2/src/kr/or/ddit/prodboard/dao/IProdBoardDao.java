package kr.or.ddit.prodboard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prodboard.vo.ProdBoardVO;

public interface IProdBoardDao {
	
	
	
	public int insertProdBoard(SqlMapClient smc,ProdBoardVO bv)throws SQLException;
	
	
	public List<ProdBoardVO> getAllProdBoardList(SqlMapClient smc)
			throws SQLException;
	
	
	public int updateProdBoard (SqlMapClient smc,ProdBoardVO bv)
			throws SQLException;
	
	
	public int deleteProdBoard(SqlMapClient smc,String prodBoardNum)
			throws SQLException;
	
	
	public ProdBoardVO getProdBoard(SqlMapClient smc,String prodBoardNum)
			throws SQLException;

}
