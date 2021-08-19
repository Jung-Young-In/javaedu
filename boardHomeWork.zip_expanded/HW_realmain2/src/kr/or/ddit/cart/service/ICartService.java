package kr.or.ddit.cart.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cart.vo.CartVO;

public interface ICartService {

	
	public int insertCart(CartVO cv);

	public List<CartVO> getCart(String memId) throws SQLException;
	
	public int deleteCart(String cartNum);
	
}
