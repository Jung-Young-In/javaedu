package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeDao {
	
	
	
	public int insertNotice(SqlMapClient smc,NoticeVO bv)throws SQLException;
	
	
	public List<NoticeVO> getAllNoticeList(SqlMapClient smc)
			throws SQLException;
	
	
	public int updateNotice (SqlMapClient smc,NoticeVO bv)
			throws SQLException;
	
	
	public int deleteNotice(SqlMapClient smc,String noticeNum)
			throws SQLException;
	
	
	public NoticeVO getNotice(SqlMapClient smc,String noticeNum)
			throws SQLException;

}
