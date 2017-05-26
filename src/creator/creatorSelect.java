package creator;
import java.util.*;
import java.sql.*;

import register.user;
public class creatorSelect {
	public List<user> select(String name){
		List<user> creatorUser=new ArrayList<user>();
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
			String sql="select * from userinfo where uname=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				user u=new user();
				u.setUserid(rs.getInt("uid"));
				u.setUsername(rs.getString("uname"));
				u.setUsersex(rs.getString("usex"));
				u.setUseremail(rs.getString("uemail"));
				//u.setUserbirthday(rs.getString("ubirthday"));
				u.setUseraddress(rs.getString("uaddress"));
				creatorUser.add(u);
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
		return creatorUser;
		
	}

}
