package today.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.*;
import today.model.vo.Today;

public class TodayDao {
	
private Properties prop = new Properties();
	
	public TodayDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(TodayDao.class.getResource("/db/sql/together-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Today> selectTogetherList(Connection conn){
		
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Today(rset.getString("today_no"),
								   rset.getString("today_title"),
								   rset.getString("today_name"),
								   rset.getString("today_time"),
								   rset.getString("nickname"),
								   rset.getInt("mem_count"),
								   rset.getString("lev"),
								   rset.getString("today_date")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int increaseCount(Connection conn, String tno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("toincreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public Today selectTogether(Connection conn, String tno) {
		
		Today t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Today(rset.getString("today_no"),
						      rset.getString("today_title"), 
						      rset.getString("today_content"), 
						      rset.getString("today_name"), 
						      rset.getString("today_date"), 
						      rset.getString("today_time"), 
						      rset.getString("today_course"),
						      rset.getString("lev"), 
						      rset.getString("today_vehicle"), 
						      rset.getString("nickname"), 
						      rset.getString("create_date"), 
						      rset.getInt("mem_count"), 
						      rset.getInt("reply_count"),
						      rset.getInt("user_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}
	
	public int insertTogether(Connection conn, Today t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTodayTitle());
			pstmt.setString(2, t.getTodayContent());
			pstmt.setString(3, t.getTodayName());
			pstmt.setString(4, t.getTodayDate());
			pstmt.setString(5, t.getTodayTime());
			pstmt.setString(6, t.getTodayCourse());
			pstmt.setString(7, t.getTodayVehicle());
			pstmt.setInt(8, Integer.parseInt(t.getTodayWriter()));
			pstmt.setString(9, t.getLev());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int deleteTogether(Connection conn, String tno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int enrollTogether(Connection conn, int uno, String tno){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			pstmt.setInt(2, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int togetherCount(Connection conn, String tno) {
		
		int result = 0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("togetherCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Integer> togetherMemList(Connection conn, String boardNo){
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("togetherMemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(rset.getInt("mem_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int insertEnrollTogether(Connection conn, int uno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEnrollTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	
	public int togetherDropOut(Connection conn, int uno, String tno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("togetherDropOut");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setString(2, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int countDecrease(Connection conn, String tno) {
		
		int result = 0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("countDecrease");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateTogether(Connection conn, Today t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTodayTitle());
			pstmt.setString(2, t.getTodayContent());
			pstmt.setString(3, t.getTodayName());
			pstmt.setString(4, t.getTodayDate());
			pstmt.setString(5, t.getTodayTime());
			pstmt.setString(6, t.getTodayCourse());
			pstmt.setString(7, t.getLev());
			pstmt.setString(8, t.getTodayVehicle());
			pstmt.setString(9, t.getTodayNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}







