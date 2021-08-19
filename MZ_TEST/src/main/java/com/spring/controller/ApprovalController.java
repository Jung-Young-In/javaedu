package com.spring.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.ApprovalModifyCommand;
import com.spring.command.ApprovalRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.ApprovalVO;
import com.spring.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("/main")
	public String main() throws SQLException {
		
		return "approval/main";
	}
	
	@RequestMapping("/lib/req/list")
	public ModelAndView reqList(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		
		String url = "approval/list";
		
		Map<String, Object> dataMap = approvalService.getApprovalList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/registForm")
	public String normalRegistForm() {
	
		String url = "approval/regist";
		
		return url;
	}
//	
//	@RequestMapping("/comm/registForm")
//	public String commRegistForm() {
//		
//		String url = "approval/comm_regist";
//		
//		return url;
//	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(ApprovalRegistCommand approvalReq, HttpServletRequest request) throws SQLException {
		String url = "approval/regist_success";
		
		ApprovalVO approval = approvalReq.toApprovalVO();
		approval.setAppTitle((String)request.getAttribute("XSStitle"));
		
		approvalService.regist(approval);
		
		return url;
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public ModelAndView detail(String appNo, 
							   @RequestParam(defaultValue="") String from,
							   ModelAndView mnv) throws SQLException {
		
		String url = "approval/detail";
		
		ApprovalVO approval = null;
		
		if (from.equals("modify")) {
			approval = approvalService.getApprovalForModify(appNo);
		}
		
		mnv.addObject("approval", approval);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String appNo, ModelAndView mnv) throws Exception {
		
		String url = "approval/modify";
		
		ApprovalVO approval = approvalService.getApprovalForModify(appNo);
		
		mnv.addObject("approval", approval);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPost(ApprovalModifyCommand modifyReq, HttpServletRequest request) throws Exception {
			
		String url = "redirect:/approval/detail.do?from=modify&appNo" + request.getParameter("appNo");
		
		ApprovalVO approval = modifyReq.toApprovalVO();
		approval.setAppTitle((String)request.getAttribute("XSStitle"));
		
		approvalService.modify(approval);
		
		return url;
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(String appNo) throws Exception {
		
		String url = "approval/remove_success";
		
		approvalService.remove(appNo);
		
		return url;
	}
//	@RequestMapping("lib/ing/list")
//	public ModelAndView ingList(ModelAndView mnv) throws SQLException {
//		
//		String url = "approval/ing_list";
//		
//		return mnv;
//	}
//	
//	@RequestMapping("lib/comp/list")
//	public ModelAndView compList(ModelAndView mnv) throws SQLException {
//		
//		String url = "approval/comp_list";
//		
//		return mnv;
//	}
//	
//	@RequestMapping("lib/temp/list")
//	public ModelAndView tempList(ModelAndView mnv) throws SQLException {
//		
//		String url = "approval/temp_list";
//		
//		return mnv;
//	}
//	
//	@RequestMapping("lib/ref/list")
//	public ModelAndView refList(ModelAndView mnv) throws SQLException {
//		
//		String url = "approval/ref_list";
//		
//		return mnv;
//	}
//	
//	@RequestMapping("lib/cir/list")
//	public ModelAndView cirList(ModelAndView mnv) throws SQLException {
//		
//		String url = "approval/cir_list";
//		
//		return mnv;
//	}
	
	
}
