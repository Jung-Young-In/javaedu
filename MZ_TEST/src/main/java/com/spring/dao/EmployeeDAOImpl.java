package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.EmployeeVO;

public class EmployeeDAOImpl implements EmployeeDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session =  session;
	}
	
	@Override
	public EmployeeVO selectEmployeeByEmpNo(String empNo) throws SQLException {
		return session.selectOne("Employee-Mapper.selectEmployeeByEmpNo", empNo);
	}

}
