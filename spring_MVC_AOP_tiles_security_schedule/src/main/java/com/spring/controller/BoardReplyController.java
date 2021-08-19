package com.spring.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.command.PageMaker;
import com.spring.command.ReplyModifyCommand;
import com.spring.command.ReplyRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.ReplyVO;
import com.spring.service.ReplyService;

//비동기인 경우 RestController 어노테이션 사용
@RestController
@RequestMapping("/replies")
public class BoardReplyController {

	@Autowired
	private ReplyService replyService;
	//value="/{bno}/{page}" 이 마치 키값과 같은 역할을 하며 @PathVariable("bno") 와 매치시켜 가져온 값을 int bno에 넣으라는 의미, 그리고 반드시 메서드 GET으로 줘야 함
	@RequestMapping(value="/{bno}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("bno") int bno,
														 @PathVariable("page") int page) throws Exception {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			Map<String, Object> dataMap = replyService.getReplyList(bno, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//value="" 는 명시적으로 써놓은것(왜냐하면 없어서 안준것인지 있는데 안 준것인지 알수 없기 때문)
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody ReplyRegistCommand registReq) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			replyService.registReply(registReq.toReplyVO());
			
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = replyService.getReplyList(registReq.toReplyVO().getBno(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			
			entity = new ResponseEntity<String>("SUCCESS," + realEndPage, HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/{rno}",method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("rno") int rno, @RequestBody ReplyModifyCommand modifyReq) throws Exception {

		ResponseEntity<String> entity = null;
		
		ReplyVO reply = modifyReq.toReplyVO();
		reply.setRno(rno);
		
		try {
			replyService.modifyReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/{bno}/{rno}/{page}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") int rno,
										 @PathVariable("bno") int bno,
										 @PathVariable("page") int page) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			replyService.removeReply(rno);
			
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = replyService.getReplyList(bno, cri);
			PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
			
			int realEndPage = pageMaker.getRealEndPage();
			if (page > realEndPage) {
				page = realEndPage;
			}
			
			entity = new ResponseEntity<String>("" + page, HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
