package collect;
import java.util.*;;
public class collect {
	private int cid;
	private String cname;
	private int cfid;
	private Date ctime;
	public collect(int cid,String cname,int cfid,Date ctime){
		this.cid=cid;
		this.cname=cname;
		this.cfid=cfid;
		this.ctime=ctime;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCfid() {
		return cfid;
	}
	public void setCfid(int cfid) {
		this.cfid = cfid;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	public collect(){}
}
