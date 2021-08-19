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
	
	private static IMemberService service;
	private IMemberDao memDao;
	private SqlMapClient smc;
	
	
	private MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) {
			service = new MemberServiceImpl();
		}
		
		return service;
	}

	@Override
	public int insertMember(MemberVO mv) {
		
		int cnt = 0;
		
		try {
			smc.startTransaction();
			cnt = memDao.insertMember(smc, mv);
			smc.commitTransaction();
			
		} catch (SQLException e) {
			try {
				smc.endTransaction();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return cnt;
	}


	@Override
	public List<MemberVO> getAllMemberList() {
		
		List<MemberVO> memList = new ArrayList<>();
		
		try {
			memList = memDao.getAllMemberList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memList;
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		int cnt = 0;
		
		try {
			cnt = memDao.updateMember(smc, memberVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteMember(String memId) {
		int cnt = 0;
		
		try {
			cnt = memDao.deleteMember(smc, memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	

	@Override
	public MemberVO getMember(String memId) {

		MemberVO memberVo = null;
		
		try {
			memberVo = memDao.getMember(smc, memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return memberVo;
	}
}
