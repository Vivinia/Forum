package update;
import java.util.*;
import java.sql.*;

import register.user;

public class userInfoUpdate {
	public int updateInfo(user us,String name){
		int updateLine=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="update userinfo set usex=?,uemail=?,ubirthday=?,uaddress=? where uname=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,us.getUsersex());
			pstmt.setString(2,us.getUseremail());
			pstmt.setString(3,us.getUserbirthday());
			pstmt.setString(4,us.getUseraddress());
			pstmt.setString(4,us.getUseraddress());
			pstmt.setString(5,name);
			updateLine=pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
					pstmt.close();
				else if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		return updateLine;
	}
	

	public int updatePass(user us,String name){
		int updateLine=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="update userinfo set upass=? where uname=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,us.getUserpass());
			pstmt.setString(2,name);
			updateLine=pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
					pstmt.close();
				else if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		return updateLine;
	}
	
}
