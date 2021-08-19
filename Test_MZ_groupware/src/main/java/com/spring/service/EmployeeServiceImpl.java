package com.spring.service;

import java.sql.SQLException;

import com.spring.dao.EmployeeDAO;
import com.spring.dto.EmployeeVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundEmpNoException;

public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeDAO employeeDAO;
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	@Override
	public void login(int empNo, String empPwd) throws SQLException, NotFoundEmpNoException, InvalidPasswordException {
		EmployeeVO emp = employeeDAO.selectEmployeeByEmpNo(empNo);
		
		if(emp == null) {
			throw new NotFoundEmpNoException();
		}
		if (!empPwd.equals(emp.getEmpPwd())) {
			throw new InvalidPasswordException();
		}
	}

	@Override
	public EmployeeVO getEmployee(int empNo) throws SQLException {
		return employeeDAO.selectEmployeeByEmpNo(empNo);
	}

}
