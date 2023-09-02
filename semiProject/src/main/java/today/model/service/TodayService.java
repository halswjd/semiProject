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
		
		return result;
		
	}
	
}
