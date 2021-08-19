package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cart.vo.CartVO;

public interface ICartDao {

	
	
	public int insertCart(SqlMapClient smc,CartVO cv)throws SQLException;

	public List<CartVO> getCart(SqlMapClient smc, String memId)throws SQLException;

	public int deleteCart(SqlMapClient smc, String cartNum)throws SQLException;
	
	
	
}
