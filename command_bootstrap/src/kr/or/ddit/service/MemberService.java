package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIDException;

public interface MemberService {
	
	// 로그인
	void login(String id, String pwd) throws SQLException, NotFoundIDException, 
															InvalidPasswordException;
	
	// 회원정보조회
	MemberVO getMember(String id) throws SQLException;
	
	// 회원리스트조회
	List<MemberVO> getMemberList()throws SQLException;
	List<MemberVO> getMemberList(Criteria cri)throws SQLException;
	Map<String,Object> getMemberList(SearchCriteria cri)throws SQLException;
	
	//회원 등록
	public void regist(MemberVO member) throws SQLException;
	
	//회원 수정
	public void modify(MemberVO member) throws SQLException;
	
	//회원 삭제
	public void remove(String id) throws SQLException;
	
	//회원 정지
	public void disabled(String id) throws SQLException;
	
	//회원 활성화
	public void enabled(String id) throws SQLException;
}









