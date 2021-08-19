package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.vo.MemberVO;

public class MemberService {

	private MemberDao dao;
	
	public MemberService() {
		if (dao == null) 			
			dao = new MemberDao();
	}
	
	public MemberVO retrieveMember(String memId) throws SQLException {
		MemberVO membervo = dao.retrieveMember(memId);
		return membervo;
	}
	
	public List<MemberVO> retrieveMemberList(MemberVO memberVo) throws SQLException {
		List<MemberVO> list = dao.retrieveMemberList(memberVo);
		return list;
	}
	
	public void createMember(MemberVO memberVo) throws SQLException {
		dao.createMember(memberVo);
	}
	
	public MemberVO loginMember(MemberVO memberVo) throws SQLException {
		MemberVO membervo = dao.loginMember(memberVo);
		return membervo;
	}
}
