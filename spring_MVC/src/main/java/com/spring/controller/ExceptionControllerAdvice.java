package com.spring.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.spring.dto.MemberVO;
import com.spring.service.MemberService;
import com.spring.utils.ExceptionLoggerHelper;

//등록하는 방식은 controller와 비슷함
//어노테이션으로 사용한다는 의미는 bean등록한 인프라를 모두 사용할 수 있다는 의미
@ControllerAdvice
public class ExceptionControllerAdvice {

//	@Autowired
//	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionControllerAdvice.class);
	
	//controller에서는  requestMapping을 잡지만 여기서는 exception이 흘러들어오기 때문에 ExceptionHandler를 등록함(여기에 exception 종류를 기술)
	//SQLException이 있고 Exception이 있는 경우 상속 관계가 작을수록 우선함
	@ExceptionHandler(SQLException.class)
	public String sqlExceptionPage(Exception e, Model model, HttpSession session) {
		
//		String url = "error/sqlException";
		String url = "error/sqlException2";
		
		
		logger.info(e.toString());
//		e.printStackTrace();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		model.addAttribute("exception", e);
		model.addAttribute("user", loginUser != null ? loginUser.getName() : "");
		
		return url;
	}
	
//	@ExceptionHandler(RuntimeException.class)
//	public void RuntimeExceptionPage(Exception e) {
//		
//	}
	
	@ExceptionHandler(Exception.class)
	public void ExceptionPage(Exception e, HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		logger.info(e.toString());
		
		ExceptionLoggerHelper.write(request, e, new Object());
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('서버장애가 발생했습니다.\\n관리자에게 문의하세요.');");
		out.println("history.go(-1);");
		out.println("</script>");
		
		out.close();
	}
	
	
	//controllerAdvice에서 model에 넣어주게 되면 controller 전역에서 사용할 수 있게 됨(Controller에 넣게 되면 그 controller 내 모든 메서드에서 사용될 수 있고, parameter로 넣어주면 model에 넣지 않고 바로 사용할 수 있게 됨)
	@Autowired
	private MemberService memberService;
	
	@ModelAttribute("admin")
	public MemberVO getAdmin() throws Exception {
		MemberVO member = memberService.getMember("mimi");
		return member;
	}
}
