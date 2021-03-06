package kr.or.ddit.ibatis;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {

	private static SqlMapClient smc;
	
	private SqlMapClientFactory() {
	}
	
	public static SqlMapClient getInstance() {
		if (smc == null) {
			
			try {
				Charset charset = Charset.forName("UTF-8");
				Resources.setCharset(charset);
				String resource = "./SqlMapConfig.xml";
				Reader rd = Resources.getResourceAsReader(resource);
				
				smc = SqlMapClientBuilder.buildSqlMapClient(rd);
				
				rd.close();
			} catch (IOException e) {
				System.err.println("SqlMapClient 객체 생성 실패");
				e.printStackTrace();
			}
		}
		return smc;
	}
}
