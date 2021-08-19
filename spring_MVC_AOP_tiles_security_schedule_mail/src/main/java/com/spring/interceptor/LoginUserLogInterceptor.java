package com.spring.interceptor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.dto.MemberVO;

public class LoginUserLogInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//로그인 정보를 받아와서
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		//만약 로그인 한 사람이 없는 경우는 return으로 아무 것도 처리하지 않고 있다면 아래로 내려가므로 스트링으로 log 저장하는 방식
		if(loginUser == null) return;
		
		//로그인 정보를 스트링으로 저장(csv파일로 만들때는 데이터 구분자를 , 로 주어야 만들어짐)
		String tag = "[login:user]";
		String log = tag + ","
				   + loginUser.getId() + ","
				   + loginUser.getPhone() + ","
				   + loginUser.getEmail() + ","
				   + request.getRemoteAddr() + ","
				   + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		String savePath = "d:\\log";
		File file = new File(savePath);
		
		if (!file.exists()) {
			file.mkdirs();
		}
		
		String logFilePath = savePath + File.separator + "login_user_log.csv";
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));	//true로 설정해 줘야 이어쓰기 가능해짐
		
		//로그를 기록
		out.write(log);
		out.newLine();
		
		out.close();
	
	}
}
