package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.vo.MemberVO;

public class MemberService {
	// singleton 패턴 적용
	private MemberDao dao;
	
	public MemberService() {
		if(dao == null)
			dao = new MemberDao();
	}
	
	
	public MemberVO retrieveMember(String memId) throws SQLException {
		//검증작업
		
		MemberVO membervo = dao.retrieveMember(memId);
		return membervo;
		
	}
	
	
	
	public List<MemberVO> retrieveMemberList(MemberVO memberVo) throws SQLException {
		List<MemberVO> list = dao.retrieveMemberList(memberVo);
		return list;
	}

	public void createMember(MemberVO memberVo) throws SQLException {
		
		
		//
		
		// 1.등록전 유효성 체크
		
		//1)중복된 ID인지 체크
		
		/*MemberVO resultVo = dao.retrieveMember(memberVo.getMemId());
		if(resultVo != null) 
			return;*/
		
		//2)ID,password 등 유효한 값인지 체크
		
		//2. DB에 insert하기
		dao.createMember(memberVo);
		
	}

	public MemberVO loginMember(MemberVO memberVo) throws SQLException {

		
		MemberVO membervo = dao.loginMember(memberVo);
		return membervo;
	}




	public String idFind(MemberVO memberVo) throws SQLException {
		
		
		String userId = dao.idFind(memberVo);
		
		return userId;
	}




	public String idFind2(MemberVO memberVo) throws SQLException {
		
		String userPass = dao.idFind2(memberVo);
		
		return userPass;
	}


	public String getGrade(String memId) throws SQLException {
		
		String memGrade = dao.getGrade(memId);
		
		return memGrade;
	}


	public int memberInfoUpdate(MemberVO mv)throws SQLException {
		int cnt = 0;
		
		try {
			cnt = dao.memberInfoUpdate(mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}


	public List<MemberVO> getMemList(String memId) {
		List<MemberVO> memberList = new ArrayList<>();
		
		try {
			memberList = dao.getCart(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}


		
		
	

	
	
	
	
	
}






