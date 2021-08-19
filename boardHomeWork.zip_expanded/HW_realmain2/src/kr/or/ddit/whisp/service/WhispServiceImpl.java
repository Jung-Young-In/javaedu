package kr.or.ddit.whisp.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientUtil;
import kr.or.ddit.whisp.dao.IWhispDao;
import kr.or.ddit.whisp.dao.WhispDaoImpl;
import kr.or.ddit.whisp.vo.WhispVO;

public class WhispServiceImpl  implements IWhispService{

	private IWhispDao whispDao;
	private SqlMapClient smc;
	
	private static IWhispService whispService;
	 
	private WhispServiceImpl() {
		whispDao = WhispDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IWhispService getInstance() {
		if(whispService==null) {
			whispService = new WhispServiceImpl();
		}
		return whispService;
	}
	
	
	
	@Override
	public int insertWhisp(WhispVO wv) {
		int cnt = 0;
		
		try {
			cnt = whispDao.insertWhisp(smc, wv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<WhispVO> getAllWhispList() {
		List<WhispVO> userWhispList = new ArrayList<>();
		
		try {
			userWhispList = whispDao.getAllWhispList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userWhispList;
	}


	
	
	
	
	
}
