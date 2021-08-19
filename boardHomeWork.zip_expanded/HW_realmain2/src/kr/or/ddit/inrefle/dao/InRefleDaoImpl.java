package kr.or.ddit.inrefle.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.inrefle.vo.InRefleVO;

public class InRefleDaoImpl implements IInRefleDao{

	
	private static IInRefleDao inrefleDao;
	
	
	
	
	private InRefleDaoImpl() {
		
	}
	
	public static IInRefleDao getInstance() {
		if(inrefleDao == null) {
			inrefleDao = new InRefleDaoImpl();
		}
		return inrefleDao;
		
	}
	

	
	@Override
	public List<InRefleVO> getInRefle(SqlMapClient smc, String prodNum) throws SQLException {
		 List<InRefleVO> inrefleList = smc.queryForList("inrefle.getInRefle", prodNum);
	     return inrefleList;
	}

}
