package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.prod.vo.ProdVO;

public class CartDaoImpl implements ICartDao{

	
	private static ICartDao cartDao;
	
	
	
	
	private CartDaoImpl() {
		
	}
	
	public static ICartDao getInstance() {
		if(cartDao == null) {
			cartDao = new CartDaoImpl();
		}
		return cartDao;
	}
	
	
	@Override
	public int insertCart(SqlMapClient smc, CartVO cartVo) throws SQLException {
		int cnt = 0;
		System.out.println(cartVo);
		Object obj=smc.insert("cart.insertCart", cartVo);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<CartVO> getCart(SqlMapClient smc, String memId) throws SQLException {
		List<CartVO> cartList = smc.queryForList("cart.getCart",memId);
		
		 return cartList;
	}

	@Override
	public int deleteCart(SqlMapClient smc, String cartNum) throws SQLException {
		int cnt = 0;
		Object obj=smc.insert("cart.deleteCart", cartNum);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

}
