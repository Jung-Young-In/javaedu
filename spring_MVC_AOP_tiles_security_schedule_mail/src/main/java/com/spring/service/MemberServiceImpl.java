package com.spring.service;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.Criteria;
import com.spring.command.MailRequestCommand;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.MemberDAO;
import com.spring.dto.MemberVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIDException;
import com.spring.mail.MimeAttachNotifier;

public class MemberServiceImpl implements MemberService{
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	private MimeAttachNotifier notifier;
	public void setMimeAttachNotifier(MimeAttachNotifier motifier) {
		this.notifier = motifier;
	}

	@Override
	public void login(String id, String pwd) throws SQLException, NotFoundIDException, InvalidPasswordException {

		MemberVO member = memberDAO.selectMemberById(id);
		if (member == null)
			throw new NotFoundIDException();
		if (!pwd.equals(member.getPwd()))
			throw new InvalidPasswordException();

	}
	
	@Override
	public MemberVO getMember(String id) throws SQLException {

		MemberVO member = memberDAO.selectMemberById(id);
		return member;

	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {

		List<MemberVO> memberList = memberDAO.selectMemberList();
		return memberList;

	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) throws SQLException {

		List<MemberVO> memberList = memberDAO.selectMemberList(cri);
		return memberList;

	}

	@Override
	public Map<String,Object> getMemberList(SearchCriteria cri) throws SQLException {
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));
			
			List<MemberVO> memberList = memberDAO.selectMemberList(cri);
			
			dataMap.put("memberList", memberList);
			dataMap.put("pageMaker", pageMaker);
			
		return dataMap;

	}

	@Override
	public void regist(MemberVO member) throws SQLException {

		memberDAO.insertMember(member);

	}

	@Override
	public void modify(MemberVO member) throws SQLException {

		memberDAO.updateMember(member);

	}


	@Override
	public void remove(String id) throws SQLException {

		memberDAO.deleteMember(id);

	}


	@Override
	public void disabled(String id) throws SQLException {

		memberDAO.disabledMember(id);

	}


	@Override
	public void enabled(String id) throws SQLException {

		memberDAO.enabledMember(id);
		
	}


	@Override
	public void sendMail(ModelAndView mnv) throws Exception {
		
		String url = "member/mail_success";
		
		MailRequestCommand mailReq = (MailRequestCommand)mnv.getModel().get("mailRequest");
		
		MultipartFile attach = mailReq.getFile();
		String uploadPath = (String)mnv.getModel().get("uploadPath");
		
		//파일 유무
		if (attach != null && !attach.isEmpty()) {
			//파일의 크기
			if (attach.getSize() < 1024*1024*5) {
				//파일 저장
				File file = new File(uploadPath, attach.getOriginalFilename());
				file.mkdirs();
				
				attach.transferTo(file);
		
			try {
				//메일 메시지 보내기
				notifier.sendMail(mailReq, uploadPath);
				
				//이 타이밍에 try catch 로 감싸주고 그 안에서 DB에 저장하는 로직을 넣음
				
				}catch (Exception e) {
					e.printStackTrace();
					url = "member/mail_fail";
					mnv.addObject("message", "메일 전송을 실패하였습니다.");
				}
				
			}else {	//용량초과
				url="member/mail_fail";
				mnv.addObject("message", "허용하는 첨부파일 용량을 초과하였습니다.");
			}
		}
		
		//화면 설정
		mnv.setViewName(url);
	}
}







