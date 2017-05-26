package register;
import java.util.*;
import java.sql.*;
public class userInsert {
	public int userinsert(user us){
		int flag=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
			String sql="insert into userinfo(uname,upass,usex,uemail,ubirthday,uaddress,ucreatetime) values(?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,us.getUsername());
			pstmt.setString(2,us.getUserpass());
			pstmt.setString(3,us.getUsersex());
			pstmt.setString(4,us.getUseremail());
			pstmt.setString(5,us.getUserbirthday());
			pstmt.setString(6,us.getUseraddress());
			pstmt.setTimestamp(7,new Timestamp(System.currentTimeMillis()));
			flag=pstmt.executeUpdate();			
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
		return flag;
	}
}