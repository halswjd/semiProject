package today.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;

import static common.JDBCTemplate.*;

import today.model.dao.TodayDao;
import today.model.vo.Today;

public class TodayService {
	
	public ArrayList<Today> selectTogetherList(){
		
		Connection conn = getConnection();
		
		ArrayList<Today> list = new TodayDao().selectTogetherList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int increaseCount(String tno) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().increaseCount(conn, tno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}

	public Today selectTogether(String tno) {
		
		Connection conn = getConnection();
		
		Today t = new TodayDao().selectTogether(conn, tno);
		
		close(conn);
		
		return t;
	}
	
	public int insertTogether(Today t) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().insertTogether(conn, t);
		int result2 = 0;
		
		if(result > 0) {
			int uno = Integer.parseInt(t.getTodayWriter());
			result2 = new TodayDao().insertEnrollTogether(conn, uno);			
		}
		
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int deleteTogether(String tno) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().deleteTogether(conn, tno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	
	}
	
	public int enrollTogether(int uno, String tno) {
		
		Connection conn = getConnection();
		
		int result1 = new TodayDao().enrollTogether(conn, uno, tno);
		int result2 = 0;
		if(result1 > 0) {
			result2 = new TodayDao().togetherCount(conn, tno);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public ArrayList<Integer> togetherMemList(String boardNo){
		
		Connection conn = getConnection();
		
		ArrayList<Integer> list = new TodayDao().togetherMemList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	public int togetherDropOut(int uno, String tno) {
		
		Connection conn = getConnection();
		
		int result1 = new TodayDao().togetherDropOut(conn, uno, tno);
			
		int result2 = 0;
		if(result1 > 0) {
			result2 = new TodayDao().countDecrease(conn, tno);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int updateTogether(Today t) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().updateTogether(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}

