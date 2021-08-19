package com.spring.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.spring.dto.MemberVO;

public class ExceptionLoggerHelper {

	public static void write(HttpServletRequest request, Exception e, Object res) {
		
		String savePath = GetUploadPath.getUploadPath("error.log").replace("/", File.separator);
		String logFilePath = savePath + File.separator + "system_exception_log.csv";
		
		String url = request.getRequestURI().replace(request.getContextPath(), "");
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String loginUserName = ((MemberVO) request.getSession().getAttribute("loginUser")).getName();
		String eceptionType = e.getClass().getName();
		String happenObject = res.getClass().getName();
		
		String log = "[Error : " + eceptionType + "]" + url + "," + date + "," + loginUserName + "," + happenObject + "\n" + e.getMessage();
		
		//로그 파일 생성
		File file = new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));	//기본값을 false로 두면 새로 쓰는 방식이 되므로, true로 해야 이어쓰는 방식으로 로그를 기록하게 됨
			
			//로그를 기록
			out.write(log);
			out.newLine();	//로그가 이어서 기록되지 않도록 한줄 띄워주는 역할
			
			out.close();	//열었으면 닫아줘야 함
		}catch (IOException exception) {
			exception.printStackTrace();
		}
	}
}
