package kr.or.ddit.comm.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comm.ibatis.SqlMapClientFactory;

public class commDao {
	
	private SqlMapClient smc;
	
	protected SqlMapClient getSqlMapClient() {
		if (smc == null) 
				smc = SqlMapClientFactory.getInstance();
		
		return smc;
	}
}
