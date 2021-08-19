package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.spring.command.Criteria;
import com.spring.command.SearchCriteria;
import com.spring.dto.MemberVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIDException;

public interface MemberService {
	
	// 로그인
	void login(String id, String pwd) throws SQLException, NotFoundIDException, InvalidPasswordException;
	
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

	//controller에 만들어놓은면 다른곳에 쓸수 없기 때문에 service에 만듦
	//ModelAndView까지 서비스에서 넣어줄 경우 결합도가 높아져 추천하지는 않음(사용 예를 보여준 것)
	//메일 보내기
	public void sendMail(ModelAndView mnv) throws Exception;
}









