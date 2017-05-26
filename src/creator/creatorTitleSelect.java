package creator;
import java.util.*;
import java.sql.*;
import forum.forum;
import register.user;
public class creatorTitleSelect {
	public List<forum> titleSelect(String name){
		List<forum> creatorTitle=new ArrayList<forum>();
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
			String sql="select * from forum where fcreator=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum f=new forum();
				f.setForumtitle(rs.getString("ftitle"));
				f.setForumid(rs.getInt("fid"));
				creatorTitle.add(f);
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
		return creatorTitle;
		
	}
}
