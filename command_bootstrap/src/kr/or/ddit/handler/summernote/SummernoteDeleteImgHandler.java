package kr.or.ddit.handler.summernote;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.command.SummernoteDeleteImgCommand;
import kr.or.ddit.handler.Handler;
import kr.or.ddit.utils.GetUploadPath;

public class SummernoteDeleteImgHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		ObjectMapper mapper = new ObjectMapper();
		
		//request.getReader()가 JSON 데이터를 읽어서 SummernoteDeleteImgCommand.class 인스턴스에 할당하여 줌
		SummernoteDeleteImgCommand delReq = mapper.readValue(request.getReader(), SummernoteDeleteImgCommand.class);
		
		String savePath = GetUploadPath.getUploadPath("summernote.img");
		String fileName = delReq.getFileName();
		
		//File로 형성되어야 exists나 delete 등을 사용할 수 있음
		File target = new File(savePath + File.separator + fileName);
		
		response.setContentType("text/plain;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if (!target.exists()) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}else {
			target.delete();
			out.print(fileName + "이미지를 삭제했습니다.");
		}
		return url;
	}
}
