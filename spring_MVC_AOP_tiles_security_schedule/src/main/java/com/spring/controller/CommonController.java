package com.spring.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.command.LoginCommand;
import com.spring.dto.MenuVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIDException;
import com.spring.service.MemberService;
import com.spring.service.MenuService;


//annotation은 선언자 역할(선언하는 역할을 수행)
@Controller
public class CommonController {

	//자동으로 아래 타입에 맞는 것을 bean등록된 것 중에 찾아와주는 역할(annotation-driven이 그 역할을 해줌)->타입 비교 방식으로 가져와줌(같은 이름으로 등록된 것이 없이 하나일 경우)
	//component-scan으로 찾아서 가져오는데 단순히 xml에 등록된 클래스는 가져오지 못함(주체가 다르기 때문)
	//어노테이션으로 등록된 것은 어노테이션으로 주입해야지만 주입 가능(set메서드로 주입 불가능), xml로 등록된 것(예:boardServiceImpl)은  xml로 주입해야지만 가능(어노테이션으로 주입 불가능)
	@Autowired
	private MemberService memberService;

	@Autowired
	private MenuService menuService;
	
	//매핑 필요(URL과 메서드 필요)
	//이후부터는 mapper가 챙기는 어노테이션이 됨
	//handler Mapper를 통해 오는 url들은 .이하를 생략함(즉, /login.do도  /login으로 매핑함)
	//리턴은 항상 view 이름을 넘겨줘야 함
	//handler adapter가 들어오는 뷰 이름을 그대로 view resolver에게 넘겨줌
	@RequestMapping(value="/common/loginForm",method=RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="") String error, HttpServletResponse response) throws Exception {
		String url = "common/login";
		
		if (error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping("/common/loginTimeOut")
	public void loginTimeOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인 하십시오.');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
		
		out.close();
	}
	
	@RequestMapping("/common/loginExpired")
	public void loginExpired(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('중복 로그인이 확인되었습니다.\\n다시 로그인 할시 다른 장치의 로그인은 취소됩니다.');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
		
		out.close();
	}
	
/*	
	//처리 부분
	@RequestMapping(value="/common/login",method=RequestMethod.POST)
	//화면이 있기 떄문에 타입 String?(위 메서드는 화면이 없음)
//	public String loginPost(String id, String pwd, HttpServletRequest request) throws Exception{
	public String loginPost(LoginCommand loginReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/index.do";
		
		HttpSession session = request.getSession();
		
		try {
			memberService.login(loginReq.getId(), loginReq.getPwd());
			session.setAttribute("loginUser", memberService.getMember(loginReq.getId()));
			session.setMaxInactiveInterval(6*60);
		}catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}catch (NotFoundIDException | InvalidPasswordException e) {
			url = "redirect:/common/login.do";
			//handler adapter가 attribute를 확인하여 key, value 형식으로 주소줄에 파라미터 형식으로 내보내게 됨
			
			//rttr.addAttribute("msg",e.getMessage());
			rttr.addFlashAttribute("msg", e.getMessage());
			//파라미터로 msg를 넘겨주게 되면 새로고침해도 주소줄에 계속 남아있는 형태가 되어 문제가 됨
			//flashAttribute로 주게 되면 redirect 화면 내보내면서 request 객체(msg)는 가지고 있고 다시 redirect가 오면 jsp가 한번 돌면서 스크립트의 msg가 request에 박히고
			//redirect로 메시지를 내보낸 후 다시 redirect가 왔을때는 request가 비워져 있는 형태가 됨
		}
		return url;
	}
*/	
	//여기서는 post, get 구분하지 않을 것임(구분하지 않을때는 그냥 안주면 됨(즉, value 속성을 주지 않으면 됨))
	@RequestMapping("/index")
	//jsp와 이름이 다르기 때문에 페이지 url 줘야함
	//ModelAndView는 화면까지 같이 내보내줌(request의 역할 대신)
	public ModelAndView indexPage(ModelAndView mnv,
								  @RequestParam(defaultValue="M000000")String mCode,
								  HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "common/indexPage.page";
		
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();			
			MenuVO menu = menuService.getMenuByMcode(mCode);
			
			mnv.addObject("menuList",menuList);
			mnv.addObject("menu",menu);
			
		} catch (SQLException e) {			
			e.printStackTrace();
			throw e;
		}
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping(value="/main")
	public String main() {
		String url = "/common/main";
		
		return url;
	}
	
	@RequestMapping("/getMcode")
	@ResponseBody
	public ResponseEntity<MenuVO> getMcode(String mName) throws Exception {

		ResponseEntity<MenuVO> entity = null;
		
		try {
			MenuVO menu = menuService.getMenuByMname(mName);
			
			//이전에는 ()안에 sc_ 로 시작하는 상수 에러값을 내보냈으나, 스프링에서는 status로 바뀜
			//파일로 보낼때는 menu 가 들어가는 곳에 byte를 넣어주게 되면 파일도 보낼수 있게 됨(단, 필요한 jar(fileUpload jar 등)는 넣고 수행해야함)
			entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK);
		}catch (SQLException e) {
			//이전에는 여기서 에러 외에는 내보낼 수 없었음
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping("/subMenu")
	@ResponseBody
	//하지만 내부적으로는 jacksonDataBind가 없으면 안됨(단,직접 사용하는 것이 아니라 handlerAdapter를 통해 간접적으로 사용하는 방식일 뿐)
	//이를 통해 알 수 있는 것이 이전에 작성해 쓰던 JSONResolver가 필요 없게 됨
	public ResponseEntity<List<MenuVO>> subMenu(String mCode) throws Exception {
		
		ResponseEntity<List<MenuVO>> entity = null;
		
		try {
			List<MenuVO> menuList = menuService.getSubMenuList(mCode);
			
			entity = new ResponseEntity<List<MenuVO>>(menuList, HttpStatus.OK);
		}catch (SQLException e) {
			//이전에는 여기서 에러 외에는 내보낼 수 없었음
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
/*	
	@RequestMapping(value="/common/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/";
		session.invalidate();
		
		return url;
	}
*/	
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse response) {
		
		String url = "security/accessDenied";
		
		response.setStatus(302);
		
		return url;
	}
}
