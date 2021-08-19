package kr.or.ddit.inrefle.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.inrefle.vo.InRefleVO;

public interface IInRefleDao {
	public List<InRefleVO> getInRefle(SqlMapClient smc, String prodNum) throws SQLException;
	
}
