package kr.or.ddit.refle.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.refle.vo.RefleVO;

public class RefleDaoImpl implements IRefleDao{

	
	private static IRefleDao refleDao;
	
	
	
	
	private RefleDaoImpl() {
		
	}
	
	public static IRefleDao getInstance() {
		if(refleDao == null) {
			refleDao = new RefleDaoImpl();
		}
		return refleDao;
		
	}
	


	@Override
	public int insertRefle(SqlMapClient smc, RefleVO refleVo) throws SQLException {
		int cnt = 0;
		Object obj=smc.insert("refle.insertRefle", refleVo);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

}
