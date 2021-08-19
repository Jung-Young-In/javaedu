package com.spring.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.servlet.View;

import com.spring.utils.MakeFileName;

//빈네임 뷰 리졸버를 servlet-context에 등록
public class FileDownloadView implements View {
	
	private String contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
	public void setContentType(String contentType) {
		this.contentType=contentType;
	}
	
	@Override
	public String getContentType() {
		return this.contentType;
	}
	 
	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String savedPath = (String) model.get("savePath");
		String fileName = (String) model.get("fileName");
		
		// 보낼 파일 설정.
		String filePath = savedPath + File.separator + fileName;
		System.out.println("filePath : " + filePath);
		File downloadFile = new File(filePath);
		FileInputStream inStream = new FileInputStream(downloadFile);
		
		// 파일 포맷으로 MIME를 결정한다.(ContentType 세팅)
		ServletContext context = request.getServletContext();
		String mimeType = context.getMimeType(downloadFile.getName());
		if(mimeType == null) {
			mimeType = "application/octet-stream";
		}
		
		this.contentType = mimeType;
		
		// response 수정.
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length()); // 회원 상세는 바이너리 값만 넘어가도 됨.
		
		// 다른 게시판에서도 사용할 것이기 때문에 아래 작업 수행.
		String headerKey = "Content-Disposition";
		
		String sendFileName = MakeFileName.parseFileNameFromUUID(downloadFile.getName(), "\\$\\$");// UUID 떼고 $$떼어 원본 파일 명만 가져옴
		
		// 유형 별 처리 (한글 깨짐 방지 :ISO-8859-1)
		String header = request.getHeader("User-Agent");
		if(header.contains("MSIE")) { // 익스플로러
			sendFileName = URLEncoder.encode(sendFileName,"UTF-8"); //브라우저 별 관리
		} else {
			sendFileName = new String(sendFileName.getBytes("utf-8"),"ISO-8859-1"); // 한글 깨짐 방지 => 윈도우 OS 인코딩 설정 : ISO-8859-1
		}
		
		String headerValue = String.format("attachment; filename=\"%s\"", sendFileName);
		response.setHeader(headerKey, headerValue);
		
		// 읽으면서 파일 내보내기 (자원이 response만 존재함)
		OutputStream outStream = response.getOutputStream();
		byte[] buffer = new byte[4096]; // 파일 내보내기 (4KB 단위)
		int bytesRead = -1;
		
		while((bytesRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}
		
		inStream.close();
		outStream.close();
	}
	
}
