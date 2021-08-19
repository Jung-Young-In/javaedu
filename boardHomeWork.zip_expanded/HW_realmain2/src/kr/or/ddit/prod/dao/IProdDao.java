package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prod.vo.ProdVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행하여 결과를 작성하여 서비스에 전달하는 DAO 인터페이스
 * @author SEM-pc
 *
 */
public interface IProdDao {
	
	
	public List<ProdVO> getAllProdList(SqlMapClient smc) throws SQLException;

	public int insertProd(SqlMapClient smc, ProdVO mv) throws SQLException;
	
	public ProdVO getProd(SqlMapClient smc, String prodNum) throws SQLException;
	
	public List<ProdVO> getProdList(SqlMapClient smc, String prodCategori) throws SQLException;
	
	public List<ProdVO> getSearchProdList(SqlMapClient smc, ProdVO prodVo) throws SQLException;

}