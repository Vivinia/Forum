package creator;
import java.util.*;
import java.sql.*;

import publish.forumClassify;

import forum.forum;
public class creatorTitleClassifySelect {
	public List<forum> classifyIdSelect(String title){
		List<forum> classify=new ArrayList<forum>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="select * from forum where ftitle=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,title);
			rs=pstmt.executeQuery();
			if(rs.next()){
				forum f=new forum();
				f.setForumclassid(rs.getInt("fclassid"));
				classify.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)				
					rs.close();
				else if(pstmt!=null)
					pstmt.close();
				else
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		return classify;
		
	}
	
	
	public List<forumClassify> classifyTitleSelect(int id){
		List<forumClassify> classify=new ArrayList<forumClassify>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="select * from forumclassify where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				forumClassify f=new forumClassify();
				f.setClassifyName(rs.getString("classify"));
				classify.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)				
					rs.close();
				else if(pstmt!=null)
					pstmt.close();
				else
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		return classify;
		
	}
}
