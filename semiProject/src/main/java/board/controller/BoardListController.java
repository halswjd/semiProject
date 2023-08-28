package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Category;
import common.model.vo.PageInfo;


/**
 * Servlet implementation class BoardListViewController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리
		int listCount; // DB 총 게시글 개수
		int currentPage; // 사용자가 요청한 페이지
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대가수(단위)
		int boardLimit; // 한 페이지내에 보여질 게시글 최대 개수(단위)
		
		int maxPage; // 가장 마지막페이지버튼
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝수
		
		
		
		listCount= new BoardService().selectBoardListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 5;
		
		boardLimit = 10;
		
//		boardLimit = Integer.parseInt(request.getParameter("test"));
		
		
		maxPage = (int) Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		/*
		if(request.getParameter("categoryNo") == null) {
		}else {
			int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
			
			System.out.println(categoryNo);
			
			ArrayList<Board> list = new BoardService().selectSubjectList(pi, categoryNo);
			request.setAttribute("list", list);
			
		}
		*/
		ArrayList<Board> list = new BoardService().selectBoardList(pi);
		request.setAttribute("list", list);
		
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/board/boardListView.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
