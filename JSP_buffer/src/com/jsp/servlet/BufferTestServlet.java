package com.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/out")
public class BufferTestServlet extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String url = "/WEB-INF/views/out.jsp";
			
			request.getRequestDispatcher(url).forward(request, response);
			
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
			
//			for (int i = 0; i < 100; i++) {
//				out.println("<h3>안녕하세요</h3>");
//			}
//			
//			new Scanner(System.in).nextLine();
			
			//버퍼의 성질 때문에 스크립트 안에 다 넣어줬을 때만 메서드가 끝나서 버퍼에 실어 내보낸다.
//			out.println("<script>alert('네이버로 이동합니다.');"
//					+"location.href='https://www.naver.com';"
//					+"</script>");
			
			//sendRedirect 할 경우 위 스크립트를 넣은 버퍼를 비운후 sendRedirect만 실행하므로 둘중 선택을 해야함(alert를 살려야할 경우 스크립트에 location.href를 넣어 페이지를 이동시켜야함)
			//response.sendRedirect("https://www.naver.com");
	}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}
}
