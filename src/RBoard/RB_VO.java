package RBoard;

import java.util.Date;

public class RB_VO {
	
	private String member_id;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRboard_no() {
		return rboard_no;
	}
	public void setRboard_no(int rboard_no) {
		this.rboard_no = rboard_no;
	}
	public String getRboard_subject() {
		return rboard_subject;
	}
	public void setRboard_subject(String rboard_subject) {
		this.rboard_subject = rboard_subject;
	}
	public String getRboard_content() {
		return rboard_content;
	}
	public void setRboard_content(String rboard_content) {
		this.rboard_content = rboard_content;
	}
	public String getRboard_fileorg() {
		return rboard_fileorg;
	}
	public void setRboard_fileorg(String rboard_fileorg) {
		this.rboard_fileorg = rboard_fileorg;
	}
	public String getRboard_filesav() {
		return rboard_filesav;
	}
	public void setRboard_filesav(String rboard_filesav) {
		this.rboard_filesav = rboard_filesav;
	}
	public String getRboard_readhit() {
		return rboard_readhit;
	}
	public void setRboard_readhit(String rboard_readhit) {
		this.rboard_readhit = rboard_readhit;
	}
	public Date getRboard_regdate() {
		return rboard_regdate;
	}
	public void setRboard_regdate(Date rboard_regdate) {
		this.rboard_regdate = rboard_regdate;
	}
	public String getRboard_passwd() {
		return rboard_passwd;
	}
	public void setRboard_passwd(String rboard_passwd) {
		this.rboard_passwd = rboard_passwd;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getMentor_no() {
		return mentor_no;
	}
	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}

	private int mentor_no;
	private int rboard_no;
	private int member_no;
	private String rboard_subject;
	private String rboard_content;
	private String rboard_fileorg;
	private String rboard_filesav;
	private String rboard_readhit;
	private Date rboard_regdate;
	private String rboard_passwd;
	private int rboard_index;

	public int getRboard_index() {
		return rboard_index;
	}
	public void setRboard_index(int rboard_index) {
		this.rboard_index = rboard_index;
	}
}
