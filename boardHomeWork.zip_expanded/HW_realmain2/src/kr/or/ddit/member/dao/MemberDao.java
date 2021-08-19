package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.base.dao.BaseDao;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.vo.MemberVO;

public class MemberDao extends BaseDao {
	private SqlMapClient smc;
	
	public MemberDao() {
		smc = super.getSqlMapClient();
	}
	
	//updateMember
	
	
	public MemberVO retrieveMember(String memId) throws SQLException {
		return (MemberVO)smc.queryForObject("member.retrieveMember",memId);
	}
	
	public List<MemberVO> retrieveMemberList(MemberVO memberVo) throws SQLException {
		return smc.queryForList("member.retrieveMemberList", memberVo);
	}


	public void createMember(MemberVO memberVo) throws SQLException {
		
		smc.insert("member.createMember", memberVo);
	}
	
	public MemberVO loginMember(MemberVO memberVo) throws SQLException {
		
		return (MemberVO)smc.queryForObject("member.loginMember",memberVo);
	}

	public String idFind(MemberVO memberVo) throws SQLException {
		
		return (String)smc.queryForObject("member.idFind",memberVo);
	}

	public String idFind2(MemberVO memberVo) throws SQLException {
		return (String)smc.queryForObject("member.idFind2",memberVo);
	}

	public String getGrade(String memId) throws SQLException {
		
		return (String)smc.queryForObject("member.getGrade",memId);
	}

	public int memberInfoUpdate(MemberVO mv) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("member.memberInfoUpdate",mv);
		
		return cnt;
	}

	public List<MemberVO> getCart(String memId) throws SQLException {
		List<MemberVO> memberList = smc.queryForList("member.getMemList",memId);
		
		 return memberList;
	}

		
		

	
}
