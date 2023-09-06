package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Category;
import board.model.vo.Reply;
import board.model.vo.Report;
import common.model.vo.PageInfo;

import static common.JDBCTemplate.*;

public class BoardService {
	

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
	
	public int insertLike(int userNo, String boardNo) {
		
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
	
	public int deleteLike(int userNo, String boardNo) {
		
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
	
	public int checkLike(int userNo, String boardNo) {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().checkLike(conn, userNo, boardNo);
		
		close(conn);
		
		return count;
		
	}
	
	public int insertBook(int userNo, String boardNo) {
		
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
	
	public int deleteBook(int userNo, String boardNo) {
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
	
	public int checkBook(int userNo, String boardNo) {
		
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
	
	public ArrayList<Reply> selectReplyList(String boardNo){
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	public int deleteReply(int replyNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReply(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			close(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int insertReply(String boardNo, int userNo, String comment) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, boardNo, userNo, comment);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int reportBoard(Report r) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().reportBoard(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int deleteBoard(String boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int countReply(String boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().countReply(conn, boardNo);
		
		close(conn);
		
		return result;
		
	}
	
	public int insertBoard(Board b, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		
		int result2 = 1;
		
		System.out.println("fileList 있냐 없냐" + list.isEmpty());
		if(!list.isEmpty()) {
			result2 = new BoardDao().insertAttachmentList(conn, list);
			System.out.println("result2값 : " + result2);
		}
		
		if(result1 > 0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public ArrayList<Attachment> boardImgList(String boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDao().boardImgList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	public int updateBoard(Board b, ArrayList<Attachment> list, ArrayList<Integer> deleteList) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		int result3 = 1;
		
		if(list.size() != 0) {
			result2 = new BoardDao().insertNewAttachment(conn, list);
		}
		if(deleteList.size() != 0) {
			result3 = new BoardDao().deleteAttachment(conn, deleteList);			
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
	}
	
	public int deleteAttachment(int fileNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteAttachment(conn, fileNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result; 
	}
	
	public ArrayList<Board> searchBoard(int option, String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchBoard(conn, option, keyword);
		
		close(conn);
		
		return list;
		
	}
	
	public int countLike(String boardNo) {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().countLike(conn, boardNo);
		
		close(conn);
		
		return count;
	}
}





