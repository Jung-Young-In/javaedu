package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class ProdServiceImpl implements IProdService {
	
	// 사용할 DAO의 객체변수를 선언한다.
	private IProdDao prodDao;
	private SqlMapClient smc;
	
	private static IProdService service;
	
	private ProdServiceImpl() {
		prodDao = ProdDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IProdService getInstance() {
		if(service == null) {
			service = new ProdServiceImpl();
		}
		
		return service;
	}

	
	@Override
	public List<ProdVO> getAllProdList() {
		
		List<ProdVO> prodList = new ArrayList<>();
		
		try {
			prodList = prodDao.getAllProdList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prodList;
	}

	@Override
	public int insertProd(ProdVO mv) {

		int cnt = 0;
		
		try {
			cnt = prodDao.insertProd(smc, mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}




	@Override
	public ProdVO getProd(String prodNum) {
		
		ProdVO mv = null;
		
		try {
			mv = prodDao.getProd(smc, prodNum);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return mv;
	}

	@Override
	public List<ProdVO>  getProdList(String prodCategori) {
		
		List<ProdVO> prodList = new ArrayList<>();
		
		try {
			prodList = prodDao.getProdList(smc, prodCategori);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prodList;
	}

	@Override
	public List<ProdVO> getSearchProdList(ProdVO prodVo) {
		
		List<ProdVO> prodList = new ArrayList<>();
		
		try {
			prodList = prodDao.getSearchProdList(smc, prodVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prodList;
	}

	

}


