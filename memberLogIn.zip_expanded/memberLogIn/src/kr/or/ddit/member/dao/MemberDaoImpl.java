package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	
	private static IMemberDao memDao;
	
	private MemberDaoImpl() {
		
	}
	
	public static IMemberDao getInstance() {
		if (memDao == null) {
			memDao = new MemberDaoImpl();
		}
		return memDao;
	}
	
	@Override
	public String loginMember(SqlMapClient smc, MemberVO memberVo) throws SQLException {
		
		String memId = (String) smc.queryForObject("member.memId", memberVo);
		String memPass = (String) smc.queryForObject("member.memPass", memberVo);
		
		if (memId == null) {
			String login = "비밀번호가 틀렸습니다.";
			return login;
		}else if (memPass == null) {
			String login = "아이디가 틀렸습니다.";
			return login;
		}
		String login = "로그인을 성공하였습니다.";
		return login;
	}
}
