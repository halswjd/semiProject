package board.model.vo;

public class Report {

	private int reportNo;
	private String guilty;
	private String reportContent;
	private String process;
	private String boardNo;
	private int reportUno;
	private int reportedUno;

	public Report() {}

	public Report(int reportNo, String guilty, String reportContent, String process, String boardNo, int reportUno,
			int reportedUno) {
		super();
		this.reportNo = reportNo;
		this.guilty = guilty;
		this.reportContent = reportContent;
		this.process = process;
		this.boardNo = boardNo;
		this.reportUno = reportUno;
		this.reportedUno = reportedUno;
	}
	
	

	public Report(int reportNo, String guilty, String reportContent, String boardNo, int reportUno, int reportedUno) {
		super();
		this.reportNo = reportNo;
		this.guilty = guilty;
		this.reportContent = reportContent;
		this.boardNo = boardNo;
		this.reportUno = reportUno;
		this.reportedUno = reportedUno;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getGuilty() {
		return guilty;
	}

	public void setGuilty(String guilty) {
		this.guilty = guilty;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public int getReportUno() {
		return reportUno;
	}

	public void setReportUno(int reportUno) {
		this.reportUno = reportUno;
	}

	public int getReportedUno() {
		return reportedUno;
	}

	public void setReportedUno(int reportedUno) {
		this.reportedUno = reportedUno;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", guilty=" + guilty + ", reportContent=" + reportContent + ", process="
				+ process + ", boardNo=" + boardNo + ", reportUno=" + reportUno + ", reportedUno=" + reportedUno + "]";
	}
	
	
}
