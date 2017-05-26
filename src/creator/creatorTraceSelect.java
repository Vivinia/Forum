package creator;

import java.sql.*;
import java.util.*;

import traceForum.trace;

public class creatorTraceSelect {
	public List<trace> traceSelect(String name){
		List<trace> creatorTrace=new ArrayList<trace>();
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
			String sql="select * from trace where tcreator=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			while(rs.next()){
				trace t=new trace();
				t.setTcontent(rs.getString("tcontent"));
				t.setTfid(rs.getInt("tfid"));
				creatorTrace.add(t);
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
		return creatorTrace;
		
	}
}
