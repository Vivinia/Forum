package publish;
import java.util.*;
public class forumClassify {
	private int classifyId;
	private String classifyName;
	private Date classifyCreateTime;
	public forumClassify(int classifyId,String classifyName,Date classifyCreateTime){
		super();
		this.classifyId=classifyId;
		this.classifyName=classifyName;
		this.classifyCreateTime=classifyCreateTime;
	}
	public int getClassifyId() {
		return classifyId;
	}
	public void setClassifyId(int classifyId) {
		this.classifyId = classifyId;
	}
	public String getClassifyName() {
		return classifyName;
	}
	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}
	public Date getClassifyCreateTime() {
		return classifyCreateTime;
	}
	public void setClassifyCreateTime(Date classifyCreateTime) {
		this.classifyCreateTime = classifyCreateTime;
	}
	public forumClassify(){}
}
