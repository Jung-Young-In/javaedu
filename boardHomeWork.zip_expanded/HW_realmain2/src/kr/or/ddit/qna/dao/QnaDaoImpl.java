package kr.or.ddit.qna.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.vo.QnaVO;

public class QnaDaoImpl implements IQnaDao{

	
private static IQnaDao qnaDao;
	
	private QnaDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static IQnaDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(qnaDao == null) {
			qnaDao = new QnaDaoImpl();
		}
		return qnaDao;
	}
	
	@Override
	public int insertQna(SqlMapClient smc, QnaVO bv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("qna.insertQna", bv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<QnaVO> getAllQnaList(SqlMapClient smc) throws SQLException {
		List<QnaVO> memList =smc.queryForList("qna.allListQna");
		
		return memList;
	}

	@Override
	public int updateQna(SqlMapClient smc, QnaVO bv) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("qna.updateQna",bv);
		
		return cnt;
	}

	@Override
	public int deleteQna(SqlMapClient smc, String qnaNum) throws SQLException {
			int cnt=0;
		
		cnt = smc.delete("qna.deleteQna", qnaNum);
		System.out.println("딜리트 결과다잉"+cnt);
		return cnt;
	}

	@Override
	public QnaVO getQna(SqlMapClient smc, String qnaNum) throws SQLException {
		QnaVO bv = (QnaVO)smc.queryForObject("qna.getQnaInfo",qnaNum);
		
		
		return bv;
	}

	
	
	
}
