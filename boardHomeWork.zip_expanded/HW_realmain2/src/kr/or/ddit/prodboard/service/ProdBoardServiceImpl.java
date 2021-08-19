package kr.or.ddit.prodboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prodboard.dao.IProdBoardDao;
import kr.or.ddit.prodboard.dao.ProdBoardDaoImpl;
import kr.or.ddit.prodboard.vo.ProdBoardVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class ProdBoardServiceImpl  implements IProdBoardService{

	private IProdBoardDao prodBoardDao;
	private SqlMapClient smc;
	
	private static IProdBoardService prodBoardService;
	 
	private ProdBoardServiceImpl() {
		prodBoardDao = ProdBoardDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IProdBoardService getInstance() {
		if(prodBoardService==null) {
			prodBoardService = new ProdBoardServiceImpl();
		}
		return prodBoardService;
	}
	
	
	@Override
	public int insertProdBoard(ProdBoardVO bv) {
		int cnt = 0;
		
		try {
			cnt = prodBoardDao.insertProdBoard(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ProdBoardVO> getAllProdBoardList() {
		List<ProdBoardVO> prodBoardList = new ArrayList<>();
		
		try {
			prodBoardList = prodBoardDao.getAllProdBoardList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodBoardList;
	}

	@Override
	public int updateProdBoard(ProdBoardVO bv) {
		int cnt = 0;
		
		try {
			cnt = prodBoardDao.updateProdBoard(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteProdBoard(String prodBoardNum) {
		int cnt = 0;
		
		try {
			cnt = prodBoardDao.deleteProdBoard(smc, prodBoardNum);
			System.out.println("딜리트 결과다잉"+cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public ProdBoardVO getProdBoard(String prodBoardNum) {
		
		ProdBoardVO bv = null;
		
		
		try {
			bv = prodBoardDao.getProdBoard(smc, prodBoardNum);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return bv;
	}

	
	
	
	
	
}
