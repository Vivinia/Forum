package collect;
import java.sql.*;
import java.util.*;
import forum.forum;
public class collectSelect {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	public int insertCollect(collect c){
		int insertLine=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="insert into collect(cid,cname,cfid,ctime) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,c.getCid());
			pstmt.setString(2,c.getCname());
			pstmt.setInt(3,c.getCfid());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			insertLine=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return insertLine;
	}
	
	public List<collect> selectCollectId(String name){
		List<collect> allcollectId=new ArrayList<collect>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="select * from collect where cname=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next()){
				collect c=new collect();
				c.setCfid(rs.getInt("cfid"));
				allcollectId.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return allcollectId;
	}
	
	
	public List<forum> selectCollectTitle(int id){
		List<forum> allcollectTitle=new ArrayList<forum>();
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
			while(rs.next()){
				forum f=new forum();
				f.setForumtitle(rs.getString("ftitle"));
				f.setForumclassid(rs.getInt("fclassid"));
				allcollectTitle.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return allcollectTitle;
	}
	
	public int showOrHideCollect(String name,int id){
		int selectName=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="select * from collect where cname=? and cfid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				selectName=1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return selectName;
	}
	
	
	public int deleteCollect(int deleteId){
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
			String sql="delete from collect where cfid=?";
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
