package com.cos.gmail;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/user3")
public class UserFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserFindController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String flag = request.getParameter("flag");
		

		try {
			if ("IDFIND".equals(flag)) { // 목록조회
				String userId = IdFind(request);
				
				// 브라우저로 전달한 결과를 request에 attribute로 세팅
				request.setAttribute("userId", userId);
				request.setAttribute("email", email);

				/*RequestDispatcher disp = request.getRequestDispatcher("/HW_BHK/HW_main/common/gmailSendAction2.jsp");
				disp.forward(request, response);*/
			response.sendRedirect("/HW_realmain2/HW_main/common/gmailSendAction2.jsp?email="+email+"&userId="+userId);
				
			} else if ("PASSFIND".equals(flag)) { // 등록
				String userPass = IdFind2(request);
				
				// 브라우저로 전달한 결과를 request에 attribute로 세팅
				request.setAttribute("userPass", userPass);
				request.setAttribute("email", email);
				response.sendRedirect("/HW_realmain2/HW_main/common/gmailSendAction3.jsp?email="+email+"&userPass="+userPass);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//DB에 저장했으니 google email 인증 페이지로 이동
	/*	response.sendRedirect("/HW_BHK/HW_main/common/gmailSendAction2.jsp?email="+email+"&name="+username+"&flag="+flag);*/
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private String IdFind2(HttpServletRequest request) throws SQLException {
		
	String memName = request.getParameter("name");	
	String memEmail = request.getParameter("email");	
	MemberVO memberVo = new MemberVO();	
		
	memberVo.setMemName(memName);
	memberVo.setMemEmail(memEmail);
		
	MemberService service = new MemberService();	
	
	
	String userId = service.idFind2(memberVo);
		
		return userId;
	}
	
	
	private String IdFind(HttpServletRequest req) throws SQLException {
		
	String memName = req.getParameter("name");	
	String memEmail = req.getParameter("email");	
	MemberVO memberVo = new MemberVO();	
		
	memberVo.setMemName(memName);
	memberVo.setMemEmail(memEmail);
		
	MemberService service = new MemberService();	
	
	
	String userId = service.idFind(memberVo);
		
		return userId;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}