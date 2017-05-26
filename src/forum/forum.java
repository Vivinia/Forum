package forum;
import java.util.*;
public class forum {
	private int Forumid;
	private String Forumcreator;
	private String Forumtitle;
	private String Forumcontent;
	private int Forumclassid;	
	private Date Forumcreatetime;
	public forum(int Forumid,String Forumcreator,String Forumtitle,String Forumcontent,int Forumclassid,Date Forumcreatetime){
		super();
		this.Forumid=Forumid;
		this.Forumcreator=Forumcreator;
		this.Forumtitle=Forumtitle;
		this.Forumcontent=Forumcontent;
		this.Forumclassid=Forumclassid;		
		this.Forumcreatetime=Forumcreatetime;
	}
	public int getForumid() {
		return Forumid;
	}
	public void setForumid(int Forumid) {
		this.Forumid = Forumid;
	}
	public String getForumcreator() {
		return Forumcreator;
	}
	public void setForumcreator(String Forumcreator) {
		this.Forumcreator = Forumcreator;
	}
	public String getForumtitle() {
		return Forumtitle;
	}
	public void setForumtitle(String Forumtitle) {
		this.Forumtitle = Forumtitle;
	}
	public String getForumcontent() {
		return Forumcontent;
	}
	public void setForumcontent(String Forumcontent) {
		this.Forumcontent = Forumcontent;
	}
	public int getForumclassid() {
		return Forumclassid;
	}
	public void setForumclassid(int Forumclassid) {
		this.Forumclassid = Forumclassid;
	}	
	public Date getForumcreatetime() {
		return Forumcreatetime;
	}
	public void setForumcreatetime(Date Forumcreatetime) {
		this.Forumcreatetime = Forumcreatetime;
	}
	public forum(){}
}
