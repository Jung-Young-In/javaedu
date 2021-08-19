package kr.or.ddit.exerBoard.vo;

public class ExerBoardVO {

	private long exerBoardNum;
	private String memId;
	private String exerBoardTitle;
	private String exerBoardContent;
	private String exerBoardDate;
	private long exerBoardReple;
	private long exerBoardCount;
	private String exerBoardPath;

	private long atchFileId = -1;

	public long getExerBoardNum() {
		return exerBoardNum;
	}

	public void setExerBoardNum(long exerBoardNum) {
		this.exerBoardNum = exerBoardNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getExerBoardTitle() {
		return exerBoardTitle;
	}

	public void setExerBoardTitle(String exerBoardTitle) {
		this.exerBoardTitle = exerBoardTitle;
	}

	public String getExerBoardContent() {
		return exerBoardContent;
	}

	public void setExerBoardContent(String exerBoardContent) {
		this.exerBoardContent = exerBoardContent;
	}

	public String getExerBoardDate() {
		return exerBoardDate;
	}

	public void setExerBoardDate(String exerBoardDate) {
		this.exerBoardDate = exerBoardDate;
	}

	public long getExerBoardReple() {
		return exerBoardReple;
	}

	public void setExerBoardReple(long exerBoardReple) {
		this.exerBoardReple = exerBoardReple;
	}

	public long getExerBoardCount() {
		return exerBoardCount;
	}

	public void setExerBoardCount(long exerBoardCount) {
		this.exerBoardCount = exerBoardCount;
	}

	public String getExerBoardPath() {
		return exerBoardPath;
	}

	public void setExerBoardPath(String exerBoardPath) {
		this.exerBoardPath = exerBoardPath;
	}

	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

}
