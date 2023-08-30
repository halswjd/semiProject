package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Category;
import common.model.vo.PageInfo;

import static common.JDBCTemplate.*;

public class BoardService {
	
//	public int selectBoardListCount() {
//		
//		Connection conn = getConnection();
//		
//		int count = new BoardDao().selectBoardListCount(conn);
//		
//		close(conn);
//		
//		return count;
//		
//	}
//
//	public ArrayList<Board> selectBoardList(PageInfo pi){
//		
//		Connection conn = getConnection();
//		
//		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi);
//		
//		close(conn);
//		
//		return list;
//	}
//	
	public ArrayList<Board> ajaxBoardList(){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().ajaxBoardList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Category> selectCategoryList(){
		
		Connection conn = getConnection();
		
		ArrayList<Category> categoryList = new BoardDao().selectCategoryList(conn);
		
		close(conn);
		
		return categoryList;
	}
//	
//	public ArrayList<Board> selectSubjectList(PageInfo pi, int categoryNo){
//		
//		Connection conn = getConnection();
//		
//		ArrayList<Board> list = new BoardDao().selectSubjectList(conn, pi, categoryNo);
//		
//		close(conn);
//		
//		return list;
//	}
//	
	public int increaseCount(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
		
	}
	
	public int insertLike(int userNo, int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertLike(conn, userNo, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteLike(int userNo, int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteLike(conn, userNo, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int checkLike(int userNo, int boardNo) {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().checkLike(conn, userNo, boardNo);
		
		close(conn);
		
		return count;
		
	}
	
	public int insertBook(int userNo, int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBook(conn, userNo, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deleteBook(int userNo, int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBook(conn, userNo, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int checkBook(int userNo, int boardNo) {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().checkBook(conn, userNo, boardNo);
		
		close(conn);
		
		return count;
		
	}
	
	public ArrayList<Board> categoryBoardList(int categoryNo){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().categoryBoardList(conn, categoryNo);
		
		close(conn);
		
		return list;
	}
}
