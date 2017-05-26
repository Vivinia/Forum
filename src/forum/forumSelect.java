package forum;
import java.sql.*;
import java.util.*;
import forum.forum;
public class forumSelect {
	public List<forum> getAllForumSubject(){
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
			String sql="select * from forum where fclassid='1'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();	
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));	
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
	
	
	public List<forum> getAllForumChefdoeuvre(){
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
			String sql="select * from forum where fclassid='2'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();	
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));				
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
	
	
	public List<forum> getAllForumNovel(){
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
			String sql="select * from forum where fclassid='3'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();		
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));				
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
	
	
	public List<forum> getAllForumMind(){
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
			String sql="select * from forum where fclassid='4'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();	
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));				
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
	
	
	public List<forum> getAllForumTechnology(){
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
			String sql="select * from forum where fclassid='5'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();		
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));				
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
	
	
	public List<forum> getAllForumThesis(){
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
			String sql="select * from forum where fclassid='6'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();		
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));				
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
	
	
	public List<forum> getAllForumAncient(){
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
			String sql="select * from forum where fclassid='7'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();	
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));	
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
	
	
	public List<forum> getAllForumForeign(){
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
			String sql="select * from forum where fclassid='8'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forum fr=new forum();
				fr.setForumid(rs.getInt("fid"));
				fr.setForumtitle(rs.getString("ftitle"));
				fr.setForumcreator(rs.getString("fcreator"));				
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
