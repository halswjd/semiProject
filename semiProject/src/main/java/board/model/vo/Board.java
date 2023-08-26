package board.model.vo;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String hashtag;
	private int count;
	private String boardWriter;
	private String category;
	private int boardType;
	private String createDate;
	private String status;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, String hashtag, int count, String boardWriter,
			String category, int boardType, String createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.hashtag = hashtag;
		this.count = count;
		this.boardWriter = boardWriter;
		this.category = category;
		this.boardType = boardType;
		this.createDate = createDate;
		this.status = status;
	}
	

	

	public Board(int boardNo, String boardTitle, int count, String boardWriter, String category, String createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.count = count;
		this.boardWriter = boardWriter;
		this.category = category;
		this.createDate = createDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
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

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", hashtag=" + hashtag + ", count=" + count + ", boardWriter=" + boardWriter + ", category="
				+ category + ", boardType=" + boardType + ", createDate=" + createDate + ", status=" + status + "]";
	};
	
	
	
}

