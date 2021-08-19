package com.cos.gmail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/user2")
public class loginCheck extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		
		//DB 저장 했다고 가정 (DB에는 emailAuth 필드가 있어야 하고 최초에는 0이 저장되어 있음) 1 인증 0 미인증
		
		//DB에 저장했으니 google email 인증 페이지로 이동
		resp.sendRedirect("/HW_realmain2/HW_main/common/loginCheck.jsp?memId="+memId+"&memPass="+memPass);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
