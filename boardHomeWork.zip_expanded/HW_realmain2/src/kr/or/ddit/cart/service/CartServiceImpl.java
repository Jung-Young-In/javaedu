package kr.or.ddit.cart.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cart.dao.CartDaoImpl;
import kr.or.ddit.cart.dao.ICartDao;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class CartServiceImpl implements ICartService{

	private ICartDao cartDao;
	private SqlMapClient smc;
	
	private static ICartService cartService;
	
	private CartServiceImpl() {
		cartDao = CartDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	
	public static ICartService getInstance() {
		if(cartService == null) {
			cartService = new CartServiceImpl();
		}
		return cartService;
	}
	
	
	@Override
	public int insertCart(CartVO cartVo) {
		
		int cnt = 0;
		try {
			System.out.println(cartVo);
			cnt = cartDao.insertCart(smc, cartVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
		
	}


	@Override
	public List<CartVO> getCart(String memId) throws SQLException {
		
		List<CartVO> cartList = new ArrayList<>();
		
		try {
			cartList = cartDao.getCart(smc,memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cartList;
		
	}


	@Override
	public int deleteCart(String cartNum) {
		int cnt = 0;
		try {
			cnt = cartDao.deleteCart(smc, cartNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	

	
	
	
	
	
	
	
	
	
	
}
