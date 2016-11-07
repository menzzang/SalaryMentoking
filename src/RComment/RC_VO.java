package RComment;

import java.util.Date;

public class RC_VO {
	public int getRcomment_no() {
		return rcomment_no;
	}
	public void setRcomment_no(int rcomment_no) {
		this.rcomment_no = rcomment_no;
	}
	public int getRboard_no() {
		return rboard_no;
	}
	public void setRboard_no(int rboard_no) {
		this.rboard_no = rboard_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getRcomment_passwd() {
		return rcomment_passwd;
	}
	public void setRcomment_passwd(String rcomment_passwd) {
		this.rcomment_passwd = rcomment_passwd;
	}
	public String getRcomment_content() {
		return rcomment_content;
	}
	public void setRcomment_content(String rcomment_content) {
		this.rcomment_content = rcomment_content;
	}
	public Date getRcomment_regdate() {
		return rcomment_regdate;
	}
	public void setRcomment_regdate(Date rcomment_regdate) {
		this.rcomment_regdate = rcomment_regdate;
	}
	private int rcomment_no;
	private int rboard_no;
	private int member_no;
	private String rcomment_passwd;
	private String rcomment_content;
	private Date rcomment_regdate;
	private int rcomment_index;
	public int getRcomment_index() {
		return rcomment_index;
	}
	public void setRcomment_index(int rcomment_index) {
		this.rcomment_index = rcomment_index;
	}
}
