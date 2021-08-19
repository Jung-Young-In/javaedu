package kr.or.ddit.inrefle.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.inrefle.dao.IInRefleDao;
import kr.or.ddit.inrefle.dao.InRefleDaoImpl;
import kr.or.ddit.inrefle.vo.InRefleVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class InRefleServiceImpl implements IInRefleService{

	private IInRefleDao inrefleDao;
	private SqlMapClient smc;
	
	private static IInRefleService inrefleService;
	
	private InRefleServiceImpl() {
		inrefleDao = InRefleDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	
	public static IInRefleService getInstance() {
		if(inrefleService == null) {
			inrefleService = new InRefleServiceImpl();
		}
		return inrefleService;
	}
	


	@Override
	public List<InRefleVO>  getInRefle(String prodNum) {
		
		List<InRefleVO> inrefleList = new ArrayList<>();
		
		try {
			inrefleList = inrefleDao.getInRefle(smc, prodNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return inrefleList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
