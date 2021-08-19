package kr.or.ddit.calender.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.calender.vo.CalenderVO;

public class CalenderDaoImpl implements ICalenderDao{

	
private static ICalenderDao calenderDao;
	
	private CalenderDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static ICalenderDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(calenderDao == null) {
			calenderDao = new CalenderDaoImpl();
		}
		return calenderDao;
	}
	
	@Override
	public int insertCalender(SqlMapClient smc, CalenderVO bv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("calender.insertCalender", bv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<CalenderVO> getAllCalenderList(SqlMapClient smc) throws SQLException {
		List<CalenderVO> memList =smc.queryForList("calender.allListCalender");
		
		return memList;
	}


	
	
	
}
