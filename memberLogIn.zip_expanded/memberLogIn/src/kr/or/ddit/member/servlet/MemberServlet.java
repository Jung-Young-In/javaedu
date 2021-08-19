package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/Login")
public class MemberServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		String memId = req.getParameter("memId");
//		String memPass = req.getParameter("memPass");
		
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>로그인 화면</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<form action='/memberLogIn/Login' method='post'>");
		out.println("<label>아이디</label>");
		out.println("<input type='text' name='memId'>");
		out.println("<br>");
		out.println("<label>비밀번호</label>");
		out.println("<input type='text' name='memPass'>");
		out.println("<br>");
		out.println("<input type='submit' value='로그인'>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		
		MemberVO memberVo = new MemberVO();
		memberVo.setMemId(memId);
		memberVo.setMemPass(memPass);
		
		IMemberService memberService = MemberServiceImpl.getInstance();
		String result = memberService.loginMember(memberVo);
		
		
		
//		resp.setContentType("text/html;charset=utf-8");
//		
//		PrintWriter out = resp.getWriter();
//		
//		String memId = req.getParameter("memId");
//		String memPass = req.getParameter("memPass");
//		
//		MemberVO memberVo = new MemberVO();
//		
//		memberVo.setMemId(memId);
//		memberVo.setMemPass(memPass);
//		
//		MemberServiceImpl service = (MemberServiceImpl) MemberServiceImpl.getInstance();
//		
//		try {
//			List<MemberVO> list = service.getSearchMember(memberVo);
//			
//			if (list.get(0).getMemId().equals(memId) && list.get(0).getMemPass().equals(memPass)) {
//				
//				out.println("<script>alert('로그인 성공');</script>");
//				out.println("<h1>로그인 완료</h1>");
//				out.println("ID : " + list.get(0).getMemId());
//				out.println("<br>");
//				out.println("PHONE : " + list.get(0).getMemPhone());
//				out.println("<br>");
//				out.println("EMAIL : " + list.get(0).getMemEmail());
//			}else {
//				JOptionPane.showMessageDialog(null, "다시 로그인 해주세요");
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}
}
