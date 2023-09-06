package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Report;

/**
 * Servlet implementation class BoardReportController
 */
@WebServlet("/reportBoard.bo")
public class BoardReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int reportedUserNo = Integer.parseInt(request.getParameter("reportedUserNo"));
		int reportUserNo = Integer.parseInt(request.getParameter("reportUserNo"));
		String guilty = request.getParameter("report");
		String reportContent = request.getParameter("reportContent");
		String boardNo = request.getParameter("bno");
		
		Report r = new Report();
		r.setReportedUno(reportedUserNo);
		r.setReportNo(reportUserNo);
		r.setGuilty(guilty);
		r.setReportContent(reportContent);
		r.setBoardNo(boardNo);
		
		int result = new BoardService().reportBoard(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 신고가 접수되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "게시글 신고에 실패하셨습니다..");
		}
		
		if(boardNo.charAt(0) == 'B') {
			response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + boardNo.substring(1));			
		}else if(boardNo.charAt(0) == 'T') {
			response.sendRedirect(request.getContextPath() + "/detail.tg?tno=" + boardNo);						
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
