package creator;

import java.sql.*;
import java.util.*;

import forum.forum;

public class creatorTraceTitleSelect {
	public List<forum> titleSelect(int id){
		List<forum> traceTitle=new ArrayList<forum>();
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
			String sql="select * from forum where fid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				forum f=new forum();
				f.setForumtitle(rs.getString("ftitle"));
				traceTitle.add(f);
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
		return traceTitle;
		
	}
}
