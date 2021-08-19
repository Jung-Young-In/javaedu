package com.spring.controller;

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

import com.spring.dto.MenuVO;
import com.spring.service.MenuService;

@Controller
public class CommonController {
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value="/common/loginForm", method=RequestMethod.GET)
	public String loginPage(@RequestParam(defaultValue="")String error, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/common/login";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse response) {
		String url = "security/accessDenied";
		
		response.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/index")
	public ModelAndView indexPage(ModelAndView mnv,
			  @RequestParam(defaultValue="M010000")String menuCode, 
			  HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "common/indexPage";
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();		
			MenuVO menu = menuService.getMenuByMcode(menuCode);
			mnv.addObject("menuList", menuList);
			mnv.addObject("menu", menu);
		} catch (SQLException e) {			
			e.printStackTrace();
			throw e;
		}
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/main")
	public String main() {
		String url = "common/main";
		return url;
	}
	
	@RequestMapping("/getMenuCode")
	@ResponseBody
	public ResponseEntity<MenuVO> getMcode(String menuName) throws Exception {
		ResponseEntity<MenuVO> entity = null;
		
		try {
			MenuVO menu = menuService.getMenuByMname(menuName);
			
			entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenu(String menuCode) throws Exception {
		ResponseEntity<List<MenuVO>> entity = null;
		
		try {
			List<MenuVO> menuList = menuService.getSubMenuList(menuCode);
			
			entity = new ResponseEntity<List<MenuVO>>(menuList, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/common/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/";
		session.invalidate();
		return url;
	}
}
