package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	
	int insertMember(MemberVO memberVo) throws SQLException;
	
	public List<MemberVO> getAllMemberList() throws SQLException;
	
	public int updateMember(MemberVO memberVo) throws SQLException;
	
	public int deleteMember(String memId) throws SQLException;
	
	public MemberVO getMember(String memId) throws SQLException;
}
