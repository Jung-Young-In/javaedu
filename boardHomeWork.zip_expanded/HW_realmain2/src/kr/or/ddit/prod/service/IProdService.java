package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;



public interface IProdService {
	
	/**
	 * 상품전체를 조회하는 메서드
	 * @return
	 */
	public List<ProdVO> getAllProdList();
	
	
	/**
	 * 상품등록하는 메서드
	 * @param mv
	 * @return
	 */
	public int insertProd(ProdVO mv);
	
	/** 상품 하나 검색하는 메서드
	 * ProdVO 
	 * @param mv 
	 * @return 
	 */
	public ProdVO getProd(String prodNum);
	
	/**
	 * 카테고리 검색
	 * @param mv
	 * @return
	 */
	public List<ProdVO>  getProdList(String prodCategori);

	
	/**
	 * 상품검색
	 * @param prodCategori
	 * @return
	 */
	public List<ProdVO>  getSearchProdList(ProdVO prodVo);
	
}
