package com.spring.service;

import java.sql.SQLException;

import com.spring.dto.EmployeeVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundEmpNoException;

public interface EmployeeService {

	// 로그인
	void login(String empNo, String empPwd) throws SQLException, NotFoundEmpNoException, InvalidPasswordException;
	
	// 직원
	EmployeeVO getEmployee(String empNo) throws SQLException;
}
