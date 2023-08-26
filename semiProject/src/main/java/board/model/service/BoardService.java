package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import common.model.vo.PageInfo;

import static common.JDBCTemplate.*;

public class BoardService {
	
	public int selectBoardListCount() {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().selectBoardListCount(conn);
		
		close(conn);
		
		return count;
		
	}

	public ArrayList<Board> selectBoardList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi);
		
		close(conn);
		
		return list;
	}
}
