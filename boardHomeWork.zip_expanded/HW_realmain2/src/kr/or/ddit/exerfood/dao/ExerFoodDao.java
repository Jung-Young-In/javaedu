package kr.or.ddit.exerfood.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerfood.vo.ExerVO;
import kr.or.ddit.exerfood.vo.FoodVO;
public class ExerFoodDao implements IExerFoodDao{
	private static IExerFoodDao exerfoodDao;
	
	private ExerFoodDao() {
		
	}
	
	public static IExerFoodDao getInstance() {
		if(exerfoodDao == null) {
			exerfoodDao = new ExerFoodDao();
		}
		
		return exerfoodDao;
	}

	@Override
	public List<ExerVO> selectExerList(SqlMapClient smc, ExerVO ev) throws SQLException {
		List<ExerVO> exerList = smc.queryForList("video.selectExerList", ev);
		
		return exerList;
	}
	
	@Override
	public List<FoodVO> selectFoodList(SqlMapClient smc, FoodVO fv) throws SQLException {
		List<FoodVO> foodList = smc.queryForList("video.selectFoodList", fv);
		
		return foodList;
	}
	
}

	