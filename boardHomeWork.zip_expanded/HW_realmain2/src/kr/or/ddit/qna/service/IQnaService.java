package kr.or.ddit.qna.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.vo.QnaVO;

public interface IQnaService {
	
	
	public int insertQna(QnaVO bv);
	
	public List<QnaVO> getAllQnaList();
	
	public int updateQna(QnaVO bv);
	
	
	public int deleteQna(String qnaNum);
	
	public QnaVO getQna(String qnaNum);

}
