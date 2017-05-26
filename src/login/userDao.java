package login;
import java.util.*;
import java.sql.*;

public class userDao {
	public boolean getUser(String name,String pass){
		boolean flag=false;
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
			String sql="select * from userinfo where uname=? and upass=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,pass);
			rs=pstmt.executeQuery();
			if(rs.next())
				flag=true;
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
		return flag;
	}

}
