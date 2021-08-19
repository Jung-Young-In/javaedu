
package kr.or.ddit.qna.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.dao.QnaDaoImpl;
import kr.or.ddit.qna.dao.IQnaDao;
import kr.or.ddit.qna.vo.QnaVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class QnaServiceImpl  implements IQnaService{

	private IQnaDao qnaDao;
	private SqlMapClient smc;
	
	private static IQnaService qnaService;
	 
	private QnaServiceImpl() {
		qnaDao = QnaDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IQnaService getInstance() {
		if(qnaService==null) {
			qnaService = new QnaServiceImpl();
		}
		return qnaService;
	}
	
	
	@Override
	public int insertQna(QnaVO bv) {
		int cnt = 0;
		
		try {
			cnt = qnaDao.insertQna(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<QnaVO> getAllQnaList() {
		List<QnaVO> qnaList = new ArrayList<>();
		
		try {
			qnaList = qnaDao.getAllQnaList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qnaList;
	}

	@Override
	public int updateQna(QnaVO bv) {
		int cnt = 0;
		
		try {
			cnt = qnaDao.updateQna(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteQna(String qnaNum) {
		int cnt = 0;
		
		try {
			cnt = qnaDao.deleteQna(smc, qnaNum);
			System.out.println("딜리트 결과다잉"+cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public QnaVO getQna(String qnaNum) {
		
		QnaVO bv = null;
		
		
		try {
			bv = qnaDao.getQna(smc, qnaNum);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return bv;
	}

	
	
	
	
	
}
