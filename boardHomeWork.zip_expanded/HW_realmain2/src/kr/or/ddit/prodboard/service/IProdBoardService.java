package kr.or.ddit.prodboard.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prodboard.vo.ProdBoardVO;


public interface IProdBoardService {
	
	
	public int insertProdBoard(ProdBoardVO bv);
	
	public List<ProdBoardVO> getAllProdBoardList();
	
	public int updateProdBoard(ProdBoardVO bv);
	
	
	public int deleteProdBoard(String boardNum);
	
	public ProdBoardVO getProdBoard(String boardNum);

}
