package member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.*;
import member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd){
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
								rset.getString("user_id"),
								rset.getString("user_pwd"),
								rset.getString("user_name"),
								rset.getString("nickname"),
								rset.getString("email"),
								rset.getString("gender"),
								rset.getString("phone"),
								rset.getString("description"),
								rset.getString("profile_img"),
								rset.getInt("grade_no"),
								rset.getString("status"),
								rset.getString("complete_mt"),
								rset.getString("insta_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
			
	public int idCheck(Connection conn, String checkId)	{	
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return count;
		
	}
		
		public int insertMember(Connection conn, Member m) {
			int result = 0;
			
			PreparedStatement pstmt = null;
			String spl = prop.getProperty("insertMember");
			
			try {
				pstmt = conn.prepareStatement(spl);
				
				pstmt.setString(1, m.getUserId());
				pstmt.setString(2, m.getUserPwd());
				pstmt.setString(3, m.getUserName());
				pstmt.setString(4, m.getNickname());
				pstmt.setString(5, m.getEmail());
				pstmt.setString(6, m.getGender());
				pstmt.setString(7, m.getPhone());
				pstmt.setString(8, m.getDescription());
				pstmt.setString(9, m.getProfileImg());
				pstmt.setInt(10, m.getGradeNo());
				pstmt.setString(11, m.getInstaId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			 return result;
		}
		
		public int nickCheck(Connection conn, String checkNick) {
			int count = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("nickCheck");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, checkNick);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					count = rset.getInt("count");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return count;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
