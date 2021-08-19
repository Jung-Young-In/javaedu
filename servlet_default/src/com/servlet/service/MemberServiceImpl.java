package com.servlet.service;

import java.sql.SQLException;

import com.servlet.dao.MemberDAO;
import com.servlet.dto.MemberVO;
import com.servlet.exception.InvalidPasswordException;
import com.servlet.exception.NotFoundIDException;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO; // = MemberDAOImpl.getInstance();
	
	@Override
	public MemberVO login(String id, String password)
			throws NotFoundIDException, InvalidPasswordException, SQLException {
		
		MemberVO member = null; 
		
		try {	
			member = memberDAO.selectMemberByID(id);
		}catch (SQLException e) {
			//Exception에 대한 처리 구문 필요
			e.printStackTrace();
			throw e;
		}
		if (member != null) {
			if (password.equals(member.getPassword())) { //로그인 성공
				return member;
			}else { //패스워드 불일치
				//throw도 반환이기 때문에 return이 없어도 반환처리가 됨으로써 return이 필요가 없게 된다. 
				throw new InvalidPasswordException();
			}
		}else { //아이디 불일치
			throw new NotFoundIDException();
		}
	}
}
