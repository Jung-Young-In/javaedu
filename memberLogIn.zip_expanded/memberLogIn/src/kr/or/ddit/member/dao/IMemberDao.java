package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao{
	
	public String loginMember(SqlMapClient smc, MemberVO memberVo) throws SQLException;
}
