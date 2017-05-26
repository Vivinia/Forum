package everyClassify;
import java.sql.*;
import java.util.*;
import forum.forum;
public class contentSelect {
	public List<forum> getForum(int id){
		List<forum> forum=new ArrayList<forum>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
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
			String sql="select fcontent,fid from forum where fid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();	
				fr.setForumcontent(rs.getString("fcontent"));
				fr.setForumid(rs.getInt("fid"));
				forum.add(fr);
			}
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
		return forum;
	}
}
