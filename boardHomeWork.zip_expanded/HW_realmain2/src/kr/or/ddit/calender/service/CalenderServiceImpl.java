
package kr.or.ddit.calender.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.calender.dao.CalenderDaoImpl;
import kr.or.ddit.calender.dao.ICalenderDao;
import kr.or.ddit.calender.vo.CalenderVO;
import kr.or.ddit.qna.vo.QnaVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class CalenderServiceImpl  implements ICalenderService{

	private ICalenderDao calenderDao;
	private SqlMapClient smc;
	
	private static ICalenderService calenderService;
	 
	private CalenderServiceImpl() {
		calenderDao = CalenderDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static ICalenderService getInstance() {
		if(calenderService==null) {
			calenderService = new CalenderServiceImpl();
		}
		return calenderService;
	}
	
	
	@Override
	public int insertCalender(CalenderVO bv) {
		int cnt = 0;
		
		try {
			cnt = calenderDao.insertCalender(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<CalenderVO> getAllCalenderList() {
		List<CalenderVO> calenderList = new ArrayList<>();
		
		try {
			calenderList = calenderDao.getAllCalenderList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return calenderList;
	}


	
	
	
	
	
}
