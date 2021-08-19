package kr.or.ddit.whisp.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.whisp.vo.WhispVO;

public interface IWhispDao {
	
	
	
	public int insertWhisp(SqlMapClient smc,WhispVO wv)throws SQLException;
	
	
	public List<WhispVO> getAllWhispList(SqlMapClient smc)
			throws SQLException;
}
