package today.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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
		
		if(result > 0) {
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
}
