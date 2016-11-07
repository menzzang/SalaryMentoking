package Member;

import com.opensymphony.xwork2.ActionSupport;

public class Mem_SelectAction extends ActionSupport{
	
	public int getMember_index() {
		return member_index;
	}
	public void setMem_index(int member_index) {
		this.member_index = member_index;
	}
	private int member_index;
	
	public String form() throws Exception{
		return SUCCESS;
	}
	public String execute() throws Exception{
		return SUCCESS;
	}
}
