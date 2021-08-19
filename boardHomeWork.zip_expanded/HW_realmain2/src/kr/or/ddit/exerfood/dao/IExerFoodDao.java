package kr.or.ddit.exerfood.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerfood.vo.ExerVO;
import kr.or.ddit.exerfood.vo.FoodVO;


public interface IExerFoodDao {
	public List<ExerVO> selectExerList(SqlMapClient smc, ExerVO ev) throws SQLException;
	
	public List<FoodVO> selectFoodList(SqlMapClient smc, FoodVO fv) throws SQLException;
}
