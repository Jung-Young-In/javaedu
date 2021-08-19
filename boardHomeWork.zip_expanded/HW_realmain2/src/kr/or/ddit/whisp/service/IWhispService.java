package kr.or.ddit.whisp.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.whisp.vo.WhispVO;

public interface IWhispService {
	
	
	public int insertWhisp(WhispVO wv);
	
	public List<WhispVO> getAllWhispList();
	

}
