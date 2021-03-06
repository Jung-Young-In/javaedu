package kr.or.ddit.comm.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientUtil {
	private static SqlMapClient smc; 
	
	private SqlMapClientUtil() {
	}
	
	public static SqlMapClient getInstance() {
		
		if(smc == null) {
			
			try {
				
				Charset charset = Charset.forName("UTF-8");
				Resources.setCharset(charset);
				Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
				
				smc = SqlMapClientBuilder.buildSqlMapClient(reader);
				
				reader.close(); 
			}catch(IOException ex) {
				ex.printStackTrace();
			}
		}
		return smc;
	}
}
