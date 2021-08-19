package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class MemberServiceImpl implements IMemberService {

	private IMemberDao memDao;
	private SqlMapClient smc;
	
	private static IMemberService memService;
	
	private MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IMemberService getInstance() {
		if (memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}

	@Override
	public String loginMember(MemberVO memberVo) {
		
		String result = null;
		
		try {
			result = (String)memDao.loginMember(smc, memberVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
