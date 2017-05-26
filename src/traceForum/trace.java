package traceForum;
import java.util.*;
public class trace {
	private int tid;
	private String tcreator;
	private int tfid;
	private String tcontent;
	private Date tcreatetime;
	public trace(int tid,String tcreator,int tfid,String tcontent,Date tcreatetime){
		this.tid=tid;
		this.tcreator=tcreator;
		this.tfid=tfid;
		this.tcontent=tcontent;
		this.tcreatetime=tcreatetime;
	}
	public trace(){}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTcreator() {
		return tcreator;
	}
	public void setTcreator(String tcreator) {
		this.tcreator = tcreator;
	}
	public int getTfid() {
		return tfid;
	}
	public void setTfid(int tfid) {
		this.tfid = tfid;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public Date getTcreatetime() {
		return tcreatetime;
	}
	public void setTcreatetime(Date tcreatetime) {
		this.tcreatetime = tcreatetime;
	}
}
