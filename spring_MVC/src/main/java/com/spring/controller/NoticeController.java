package com.spring.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.NoticeModifyCommand;
import com.spring.command.NoticeRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.NoticeVO;
import com.spring.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/main")
	public void main() throws Exception{}
	
	@RequestMapping("/list")
	public void list(SearchCriteria cri, Model model) throws Exception {
		
		Map<String, Object> dataMap = noticeService.getNoticeList(cri);
		
//		if(true) throw new Exception();
		
		//addAttribute 할 것인지, addAllAttributes 할것인지는 jsp에서 어떤 데이터를 받는냐에 따라 달라짐
	  //model.addAllAttributes(dataMap);
		model.addAttribute("dataMap", dataMap);
	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		
		String url = "notice/regist";
		
		return url;
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(NoticeRegistCommand noticeReq, HttpServletRequest request) throws SQLException, IOException {
		
		String url = "notice/regist_success";
		
		NoticeVO notice = noticeReq.toNoticeVO();
		notice.setTitle((String)request.getAttribute("XSStitle"));
		
		noticeService.regist(notice);
		
		return url;
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public ModelAndView detail(int nno, 
							   @RequestParam(defaultValue="") String from,
							   ModelAndView mnv) throws SQLException {
		
		String url = "notice/detail";
		
		NoticeVO notice = null;
		
		if (from.equals("modify")) {
			notice = noticeService.getNoticeForModify(nno);
		}else {
			notice = noticeService.getNotice(nno);
		}
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int nno, ModelAndView mnv) throws Exception {
		
		String url = "notice/modify";
		
		NoticeVO notice = noticeService.getNoticeForModify(nno);
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	//method=RequestMethod를 넣는 기준은 GET과 POST를 구별해야 할 필요가 있을 때는 입력(안주면 GET이건 POST건 POST로 처리함)
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPost(NoticeModifyCommand modifyReq, HttpServletRequest request) throws Exception {
		String url = "redirect:/notice/detail.do?from=modify&nno=" + request.getParameter("nno");
		
		NoticeVO notice = modifyReq.toNoticeVO();
		notice.setTitle((String)request.getAttribute("XSStitle"));
		
		noticeService.modify(notice);
		
		return url;
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(int nno) throws Exception {
		
		String url = "notice/remove_success";
		
		noticeService.remove(nno);
		
		return url;
	}
}







