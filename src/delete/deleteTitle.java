package delete;
import java.util.*;
import java.sql.*;

import register.user;
public class deleteTitle {
	public int delete(int deleteId){
		int deleteLine=0;
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
			String sql="delete from forum where fid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,deleteId);
			deleteLine=pstmt.executeUpdate();			
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
		return deleteLine;
		
	}
}
