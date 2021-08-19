package kr.or.ddit.refle.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.refle.dao.IRefleDao;
import kr.or.ddit.refle.dao.RefleDaoImpl;
import kr.or.ddit.refle.vo.RefleVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class RefleServiceImpl implements IRefleService{

	private IRefleDao refleDao;
	private SqlMapClient smc;
	
	private static IRefleService refleService;
	
	private RefleServiceImpl() {
		refleDao = RefleDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	
	public static IRefleService getInstance() {
		if(refleService == null) {
			refleService = new RefleServiceImpl();
		}
		return refleService;
	}
	


	@Override
	public int insertReflr(RefleVO refleVo) {
		int cnt = 0;
		try {
			cnt = refleDao.insertRefle(smc, refleVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
