package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.EmployeeVO;

public interface EmployeeDAO {
	
	// 직원정보 조회
	EmployeeVO selectEmployeeByEmpNo(String empNo) throws SQLException;
	
	
}
