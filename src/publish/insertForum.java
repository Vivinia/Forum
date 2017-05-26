package publish;
import java.sql.*;
import java.util.*;

import traceForum.trace;
import forum.forum;
public class insertForum {
	public int insert(forum fr){
		int flag=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		//1.注册驱动，加载驱动包
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动");
			e.printStackTrace();
		}
		
		try {//2.获取数据库连接
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
			//3.获取Statement对象，执行sql语句
			String sql="insert into forum(fcreator,ftitle,fcontent,fclassid,fcreatetime) values(?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,fr.getForumcreator());
			pstmt.setString(2,fr.getForumtitle());
			pstmt.setString(3,fr.getForumcontent());
			pstmt.setInt(4,fr.getForumclassid());			
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));			
			flag=pstmt.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null){
					pstmt.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

}
