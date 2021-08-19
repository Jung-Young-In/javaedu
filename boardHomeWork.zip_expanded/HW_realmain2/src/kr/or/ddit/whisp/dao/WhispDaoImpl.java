package kr.or.ddit.whisp.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.whisp.vo.WhispVO;


public class WhispDaoImpl implements IWhispDao{

	
private static IWhispDao whispDao;
	
	private WhispDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static IWhispDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(whispDao == null) {
			whispDao = new WhispDaoImpl();
		}
		return whispDao;
	}
	
	@Override
	public int insertWhisp(SqlMapClient smc, WhispVO wv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("whisp.insertWhisp", wv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<WhispVO> getAllWhispList(SqlMapClient smc) throws SQLException {
		List<WhispVO> userWhispList =smc.queryForList("whisp.getAllWhispList");
		
		return userWhispList;
	}


	
	
	
}
