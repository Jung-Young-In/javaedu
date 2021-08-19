package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {
	
	public int insertMember(SqlMapClient smc, MemberVO mv) throws SQLException;
	
	public boolean checkMember(SqlMapClient smc, String memId) throws SQLException;
	
	public List<MemberVO> getAllMemberList(SqlMapClient smc) throws SQLException;
	
	public int updateMember(SqlMapClient smc, MemberVO mv)
						throws SQLException;
	
	public int deleteMember(SqlMapClient smc, String memId)
						throws SQLException;
	
	public List<MemberVO> getSearchMember(SqlMapClient smc, MemberVO mv) 
						throws SQLException;
	
	public MemberVO getMember(SqlMapClient smc, String memId) throws SQLException;
	
}
