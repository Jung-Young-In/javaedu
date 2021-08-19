package com.servlet.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.dto.MemberVO;
import com.servlet.exception.InvalidPasswordException;
import com.servlet.exception.NotFoundIDException;
import com.servlet.service.MemberService;
import com.servlet.service.MemberServiceImpl;
import com.servlet.view.HTMLView;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private MemberService memberService = new MemberServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HTMLView.loginView(response);
		
		String view = "/WEB-INF/views/login.jsp";
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면 URL
		String view = "/WEB-INF/views/login_success.jsp";
		
		//입력
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		//처리
		String script = "";
		//memService.login(id, password) : memberVO, InvalidPasswordException, NotFoundException 등
		try {
			MemberVO member = memberService.login(id, password);
			
			script = "alert('로그인을 성공했습니다.');" 
						+ "location.href='"+request.getContextPath()+"/main';";
			
		} catch (NotFoundIDException e) {
			script = "alert('"+e.getMessage()+"');" + "history.go(-1);";
		} catch (InvalidPasswordException e) {
			script = "alert('"+e.getMessage()+"');" + "location.href='/login';";
		} catch (SQLException e) {
			script = "alert('서버장애로 인해 불가합니다.');" + "history.go(-1);";
			e.printStackTrace();
		}
		
		//출력
//		HTMLView.html(response, script);
		
		request.setAttribute("script", script);
		request.getRequestDispatcher(view).forward(request, response);
	}
}














