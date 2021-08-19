package kr.or.ddit.notice.service;

import java.util.List;


import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeService {
	
	
	public int insertNotice(NoticeVO bv);
	
	public List<NoticeVO> getAllNoticeList();
	
	public int updateNotice(NoticeVO bv);
	
	
	public int deleteNotice(String noticeNum);
	
	public NoticeVO getNotice(String noticeNum);

}
