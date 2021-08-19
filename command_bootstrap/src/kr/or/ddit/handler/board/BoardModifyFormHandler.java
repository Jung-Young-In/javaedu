package kr.or.ddit.handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dto.BoardVO;
import kr.or.ddit.handler.Handler;
import kr.or.ddit.service.BoardService;

public class BoardModifyFormHandler implements Handler {

	private BoardService boardService;
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = "board/modify";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		//그냥 getBoard하면 조회수 올라가므로 따로 만들어둔 getBoardForModify 메서드 사용해야 함
		BoardVO board = boardService.getBoardForModify(bno);
		
		request.setAttribute("board", board);
		
		return url;
	}
}
