package kr.or.ddit.notice.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class NoticeServiceImpl  implements INoticeService{

	private INoticeDao noticeDao;
	private SqlMapClient smc;
	
	private static INoticeService noticeService;
	 
	private NoticeServiceImpl() {
		noticeDao = NoticeDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static INoticeService getInstance() {
		if(noticeService==null) {
			noticeService = new NoticeServiceImpl();
		}
		return noticeService;
	}
	
	
	@Override
	public int insertNotice(NoticeVO bv) {
		int cnt = 0;
		
		try {
			cnt = noticeDao.insertNotice(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<NoticeVO> getAllNoticeList() {
		List<NoticeVO> noticeList = new ArrayList<>();
		
		try {
			noticeList = noticeDao.getAllNoticeList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noticeList;
	}

	@Override
	public int updateNotice(NoticeVO bv) {
		int cnt = 0;
		
		try {
			cnt = noticeDao.updateNotice(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(String noticeNum) {
		int cnt = 0;
		
		try {
			cnt = noticeDao.deleteNotice(smc, noticeNum);
			System.out.println("딜리트 결과다잉"+cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public NoticeVO getNotice(String noticeNum) {
		
		NoticeVO bv = null;
		
		
		try {
			bv = noticeDao.getNotice(smc, noticeNum);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return bv;
	}

	
	
	
	
	
}
