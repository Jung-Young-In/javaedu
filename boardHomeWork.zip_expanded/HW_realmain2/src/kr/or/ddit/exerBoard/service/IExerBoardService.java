package kr.or.ddit.exerBoard.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerBoard.vo.ExerBoardVO;


public interface IExerBoardService {
	
	
	public int insertExerBoard(ExerBoardVO bv);
	
	public List<ExerBoardVO> getAllExerBoardList();
	
	public int updateExerBoard(ExerBoardVO bv);
	
	
	public int deleteExerBoard(String exerBoardNum);
	
	public ExerBoardVO getExerBoard(String exerBoardNum);

}
