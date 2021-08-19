package kr.or.ddit.exerBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerBoard.vo.ExerBoardVO;

public class ExerBoardDaoImpl implements IExerBoardDao{

	
private static IExerBoardDao exerBoardDao;
	
	private ExerBoardDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static IExerBoardDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(exerBoardDao == null) {
			exerBoardDao = new ExerBoardDaoImpl();
		}
		return exerBoardDao;
	}
	
	@Override
	public int insertExerBoard(SqlMapClient smc, ExerBoardVO bv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("exerBoard.insertExerBoard", bv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<ExerBoardVO> getAllExerBoardList(SqlMapClient smc) throws SQLException {
		List<ExerBoardVO> memList =smc.queryForList("exerBoard.allListExerBoard");
		
		return memList;
	}

	@Override
	public int updateExerBoard(SqlMapClient smc, ExerBoardVO bv) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("exerBoard.updateExerBoard",bv);
		
		return cnt;
	}

	@Override
	public int deleteExerBoard(SqlMapClient smc, String exerBoardNum) throws SQLException {
			int cnt=0;
		
		cnt = smc.delete("exerBoard.deleteExerBoard", exerBoardNum);
		System.out.println("딜리트 결과다잉"+cnt);
		return cnt;
	}

	@Override
	public ExerBoardVO getExerBoard(SqlMapClient smc, String exerBoardNum) throws SQLException {
		ExerBoardVO bv = (ExerBoardVO)smc.queryForObject("exerBoard.getExerBoardInfo",exerBoardNum);
		
		return bv;
	}

	
	
	
}
