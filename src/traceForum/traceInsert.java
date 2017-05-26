package traceForum;
import java.util.*;
import java.sql.*;
public class traceInsert {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	public int insert(trace t){
		int traceLine=0;		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="insert into trace(tcreator,tfid,tcontent,tcreatetime) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,t.getTcreator());
			pstmt.setInt(2,t.getTfid());
			pstmt.setString(3,t.getTcontent());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			traceLine=pstmt.executeUpdate();
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
		return traceLine;
	}
	
	
	public List<trace> select(int id){
		List<trace> allTrace=new ArrayList<trace>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="select * from trace where tfid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				trace t=new trace();
				t.setTcontent(rs.getString("tcontent"));
				t.setTcreator(rs.getString("tcreator"));
				t.setTid(rs.getInt("tid"));
				allTrace.add(t);
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
		return allTrace;
	}

	
	public int delete(int id){
		int deleteLine=0;		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="delete from trace where tid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);			
			deleteLine=pstmt.executeUpdate();
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
		return deleteLine;
	}
}
