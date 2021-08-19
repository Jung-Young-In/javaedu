package kr.or.ddit.prodboard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prodboard.vo.ProdBoardVO;


public class ProdBoardDaoImpl implements IProdBoardDao{

	
private static IProdBoardDao prodBoardDao;
	
	private ProdBoardDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static IProdBoardDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(prodBoardDao == null) {
			prodBoardDao = new ProdBoardDaoImpl();
		}
		return prodBoardDao;
	}
	
	@Override
	public int insertProdBoard(SqlMapClient smc, ProdBoardVO bv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("prodBoard.insertProdBoard", bv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<ProdBoardVO> getAllProdBoardList(SqlMapClient smc) throws SQLException {
		List<ProdBoardVO> memList =smc.queryForList("prodBoard.allListProdBoard");
		
		return memList;
	}

	@Override
	public int updateProdBoard(SqlMapClient smc, ProdBoardVO bv) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("prodBoard.updateProdBoard",bv);
		
		return cnt;
	}

	@Override
	public int deleteProdBoard(SqlMapClient smc, String prodBoardNum) throws SQLException {
			int cnt=0;
		
		cnt = smc.delete("prodBoard.deleteProdBoard", prodBoardNum);
		System.out.println("딜리트 결과다잉"+cnt);
		return cnt;
	}

	@Override
	public ProdBoardVO getProdBoard(SqlMapClient smc, String prodBoardNum) throws SQLException {
		ProdBoardVO bv = (ProdBoardVO)smc.queryForObject("prodBoard.getProdBoardInfo",prodBoardNum);
		
		return bv;
	}

	
	
	
}
