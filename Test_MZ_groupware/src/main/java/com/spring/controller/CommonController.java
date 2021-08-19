package com.spring.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.command.LoginCommand;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundEmpNoException;
import com.spring.service.EmployeeService;

@Controller
public class CommonController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/common/loginForm", method=RequestMethod.GET)
	public String loginPage() throws Exception {
		String url = "/common/loginForm";
		return url;
	}
	
	@RequestMapping(value="/common/login", method=RequestMethod.POST)
	public String loginPost(LoginCommand loginReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/index.do";
		
		HttpSession session = request.getSession();
		
		try {
			employeeService.login(loginReq.getEmpNo(), loginReq.getEmpPwd());
			session.setAttribute("loginUser", employeeService.getEmployee(loginReq.getEmpNo()));
			session.setMaxInactiveInterval(6 * 60);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} catch (NotFoundEmpNoException | InvalidPasswordException e) {
			url = "redirect:/common/login.do";
			rttr.addFlashAttribute("msg", e.getMessage());
		}
		return url;
	}
}
