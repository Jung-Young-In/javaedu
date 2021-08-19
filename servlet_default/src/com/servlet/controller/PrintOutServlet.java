package com.servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//html방식이 존재하는 것이 아니라 URI자체에 html이라고 명시한것 뿐임
@WebServlet("/print.html")
public class PrintOutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		System.out.println("Hello!!!");
		
//		Scanner scan = new Scanner(System.in);
		
		String bg = request.getParameter("bg");
		String color = request.getParameter("color");
		
		//"message" 부분에 value에 상응하는 key부분을 입력해야함
		String message = request.getParameter("message");
		
		//heading 세팅하는 부분
		response.setContentType("text/html;charset=utf-8");
		//브라우저는 무엇인지 명시한것을 잘 인지하지 못할때 아래 실행했을 때처럼 다운로딩함
//		response.setContentType("application/aaaaa;charset=utf-8");
		
		//out객체 가져오는 부분
		PrintWriter out = response.getWriter();
		//위에서 plain이 아닌 html로 마크업이라 명시해줬기 때문에 <h1>태그를 사용해도 효과만 반영됨(plain형태시 태그 이름까지 나옴)
//		out.println("<h1>안녕하세요!!!</h1>");
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>연숩</title>");
		out.println("<style>");
		out.println("body {background:"+bg+"}");
		out.println("body {color: "+color+"}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		//입력이 될때까지 화면에서 아무것도 못하기 때문에 비동기 방식이 생겨난 것
		out.printf("<h1>%s</h1>", message);
		out.println("</body>");
		out.println("</html>");
	}

}
