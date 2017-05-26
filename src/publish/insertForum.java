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
		//1.ע������������������
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ�������");
			e.printStackTrace();
		}
		
		try {//2.��ȡ���ݿ�����
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
			//3.��ȡStatement����ִ��sql���
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
