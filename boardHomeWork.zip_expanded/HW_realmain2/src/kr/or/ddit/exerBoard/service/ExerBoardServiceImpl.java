package kr.or.ddit.exerBoard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerBoard.dao.ExerBoardDaoImpl;
import kr.or.ddit.exerBoard.dao.IExerBoardDao;
import kr.or.ddit.exerBoard.vo.ExerBoardVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class ExerBoardServiceImpl  implements IExerBoardService{

	private IExerBoardDao exerBoardDao;
	private SqlMapClient smc;
	
	private static IExerBoardService exerBoardService;
	 
	private ExerBoardServiceImpl() {
		exerBoardDao = ExerBoardDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IExerBoardService getInstance() {
		if(exerBoardService==null) {
			exerBoardService = new ExerBoardServiceImpl();
		}
		return exerBoardService;
	}
	
	
	@Override
	public int insertExerBoard(ExerBoardVO bv) {
		int cnt = 0;
		
		try {
			cnt = exerBoardDao.insertExerBoard(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ExerBoardVO> getAllExerBoardList() {
		List<ExerBoardVO> exerBoardList = new ArrayList<>();
		
		try {
			exerBoardList = exerBoardDao.getAllExerBoardList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exerBoardList;
	}

	@Override
	public int updateExerBoard(ExerBoardVO bv) {
		int cnt = 0;
		
		try {
			cnt = exerBoardDao.updateExerBoard(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteExerBoard(String exerBoardNum) {
		int cnt = 0;
		
		try {
			cnt = exerBoardDao.deleteExerBoard(smc, exerBoardNum);
			System.out.println("딜리트 결과다잉"+cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public ExerBoardVO getExerBoard(String exerBoardNum) {
		
		ExerBoardVO bv = null;
		
		
		try {
			bv = exerBoardDao.getExerBoard(smc, exerBoardNum);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return bv;
	}

	
	
	
	
	
}
