package kr.or.ddit.calender.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.calender.vo.CalenderVO;

public interface ICalenderService {
	
	
	public int insertCalender(CalenderVO bv);
	
	public List<CalenderVO> getAllCalenderList();
	

}
