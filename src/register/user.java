package register;
import java.util.*;
public class user {
	private int Userid;
	private String Username;
	private String Userpass;
	private String Usersex;
	private String Useremail;
	private String Userbirthday;
	private String Useraddress;
	private Date Usercreatedate;
	public user(int Userid,String Username,String Userpass,String Usersex,String Useremail,String Userbirthday,String Useraddress,Date Usercreatedate){
		super();
		this.Userid=Userid;
		this.Username=Username;
		this.Userpass=Userpass;
		this.Usersex=Usersex;
		this.Useremail=Useremail;
		this.Userbirthday=Userbirthday;
		this.Useraddress=Useraddress;
		this.Usercreatedate=Usercreatedate;
	}
	public int getUserid() {
		return Userid;
	}
	public void setUserid(int Userid) {
		this.Userid = Userid;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String Username) {
		this.Username = Username;
	}
	public String getUserpass() {
		return Userpass;
	}
	public void setUserpass(String Userpass) {
		this.Userpass = Userpass;
	}
	public String getUsersex() {
		return Usersex;
	}
	public void setUsersex(String Usersex) {
		this.Usersex = Usersex;
	}	
	public String getUseremail() {
		return Useremail;
	}
	public void setUseremail(String useremail) {
		Useremail = useremail;
	}
	public String getUserbirthday() {
		return Userbirthday;
	}
	public void setUserbirthday(String userbirthday) {
		Userbirthday = userbirthday;
	}
	public String getUseraddress() {
		return Useraddress;
	}
	public void setUseraddress(String useraddress) {
		Useraddress = useraddress;
	}
	public Date getUsercreatedate() {
		return Usercreatedate;
	}
	public void setUsercreatedate(Date usercreatedate) {
		Usercreatedate = usercreatedate;
	}
	public user(){}
	
}

