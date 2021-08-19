package kr.or.ddit.calender.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.calender.vo.CalenderVO;

public interface ICalenderDao {
	
	
	
	public int insertCalender(SqlMapClient smc,CalenderVO bv)throws SQLException;
	
	
	public List<CalenderVO> getAllCalenderList(SqlMapClient smc)
			throws SQLException;
	
	

}
