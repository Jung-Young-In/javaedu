package kr.or.ddit.qna.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.vo.QnaVO;

public interface IQnaDao {
	
	
	
	public int insertQna(SqlMapClient smc,QnaVO bv)throws SQLException;
	
	
	public List<QnaVO> getAllQnaList(SqlMapClient smc)
			throws SQLException;
	
	
	public int updateQna (SqlMapClient smc,QnaVO bv)
			throws SQLException;
	
	
	public int deleteQna(SqlMapClient smc,String qnaNum)
			throws SQLException;
	
	
	public QnaVO getQna(SqlMapClient smc,String qnaNum)
			throws SQLException;

}
