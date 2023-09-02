package board.model.vo;

public class Reply {

	private int replyNo;
	private String replyContent;
	private String createDate;
	private String status;
	private int boardNo;
	private String replyWriter;
	
	private int userNo;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, String createDate, String status, int boardNo, String replyWriter) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
	}
	

	

	public Reply(int replyNo, String replyContent, String createDate, String replyWriter, int userNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.replyWriter = replyWriter;
		this.userNo = userNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", status=" + status + ", boardNo=" + boardNo + ", replyWriter=" + replyWriter + "]";
	}
	
	
	
}
