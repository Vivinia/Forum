package publish;
import java.util.*;
import java.sql.*;
public class classifySelect {
	public List<forumClassify> getAllclassify(){
		List<forumClassify> allclassify=new ArrayList<forumClassify>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
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
			String sql="select * from forumClassify";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				forumClassify fc=new forumClassify();
				fc.setClassifyId(rs.getInt("id"));
				fc.setClassifyName(rs.getString("classify"));				
				allclassify.add(fc);
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
		return allclassify;		
	}
}


