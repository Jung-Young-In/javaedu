package kr.or.ddit.exerfood.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerfood.dao.ExerFoodDao;
import kr.or.ddit.exerfood.dao.IExerFoodDao;
import kr.or.ddit.exerfood.vo.ExerVO;
import kr.or.ddit.exerfood.vo.FoodVO;
import kr.or.ddit.util.SqlMapClientUtil;
import kr.or.ddit.video.dao.IVideoDao;
import kr.or.ddit.video.dao.VideoDao;
import kr.or.ddit.video.vo.VideoVO;



public class ExerFoodService implements IExerFoodService {

	private IExerFoodDao exerfoodDao;
	private SqlMapClient smc;
	
	private static IExerFoodService exerfoodService;
	
	public ExerFoodService() {
		exerfoodDao = ExerFoodDao.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IExerFoodService getInstance() {
		if(exerfoodService == null) {
			exerfoodService = new ExerFoodService();
		}
		return exerfoodService;
	}
	@Override
	public List<ExerVO> selectExerList(ExerVO ev) {
		List<ExerVO> exerList = new ArrayList<>();
		
		try {
			exerList = exerfoodDao.selectExerList(smc, ev);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return exerList;
	}
	@Override
	public List<FoodVO> selectFoodList(FoodVO fv) {
		List<FoodVO> foodList = new ArrayList<>();
		
		try {
			foodList = exerfoodDao.selectFoodList(smc, fv);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return foodList;
	}
	
	
}
