package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.notice.vo.NoticeVO;

public class NoticeDaoImpl implements INoticeDao{

	
private static INoticeDao noticeDao;
	
	private NoticeDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static INoticeDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(noticeDao == null) {
			noticeDao = new NoticeDaoImpl();
		}
		return noticeDao;
	}
	
	@Override
	public int insertNotice(SqlMapClient smc, NoticeVO bv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("notice.insertNotice", bv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<NoticeVO> getAllNoticeList(SqlMapClient smc) throws SQLException {
		List<NoticeVO> memList =smc.queryForList("notice.allListNotice");
		
		return memList;
	}

	@Override
	public int updateNotice(SqlMapClient smc, NoticeVO bv) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("notice.updateNotice",bv);
		
		return cnt;
	}

	@Override
	public int deleteNotice(SqlMapClient smc, String noticeNum) throws SQLException {
			int cnt=0;
		
		cnt = smc.delete("notice.deleteNotice", noticeNum);
		System.out.println("딜리트 결과다잉"+cnt);
		return cnt;
	}

	@Override
	public NoticeVO getNotice(SqlMapClient smc, String noticeNum) throws SQLException {
		NoticeVO bv = (NoticeVO)smc.queryForObject("notice.getNoticeInfo",noticeNum);
		
		
		return bv;
	}

	
	
	
}
