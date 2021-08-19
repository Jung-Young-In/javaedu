package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prod.vo.ProdVO;


public class ProdDaoImpl implements IProdDao {

   private static IProdDao prodDao;
   
   private ProdDaoImpl() {
	   
   }
   
   public static IProdDao getInstance() {
	   if(prodDao == null) {
		   prodDao = new ProdDaoImpl();
	   }
	   
	   return prodDao;
   }
   
   
   
   
 

   @Override
   public List<ProdVO> getAllProdList(SqlMapClient smc) throws SQLException {
      
      List<ProdVO> prodList = smc.queryForList("prod.getprodAll");
     
      return prodList;
   }

@Override
public int insertProd(SqlMapClient smc, ProdVO mv) throws SQLException {
	int cnt = 0;
	   
    Object obj = smc.insert("prod.insertProd", mv);
    
    if(obj == null) {
    	cnt = 1;
    }
     
  return cnt;
}


@Override
public ProdVO getProd(SqlMapClient smc, String prodNum) throws SQLException {
	 ProdVO mv = (ProdVO)smc
				.queryForObject("prod.getProdInfo", prodNum);
		
			return mv;
		}

@Override
public List<ProdVO> getProdList(SqlMapClient smc, String prodCategori) throws SQLException {
	 List<ProdVO> prodList = smc.queryForList("prod.getProdCategori", prodCategori);
     
     return prodList;
}

@Override
public List<ProdVO> getSearchProdList(SqlMapClient smc, ProdVO prodVo) throws SQLException {
	List<ProdVO> prodList = smc.queryForList("prod.getSearchProd", prodVo);
    
    return prodList;
}


}




