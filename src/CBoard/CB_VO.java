package CBoard;

import java.util.Date;

public class CB_VO {
	
	private int cboard_no;
	private int member_no;
	private String cboard_subject;
	private String cboard_content;
	private String cboard_fileorg;
	private String cboard_filesav;
	private String cboard_readhit;
	private Date cboard_regdate;
	private String cboard_passwd;
	private int cboard_index;
	private String member_id;
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getCboard_passwd() {
		return cboard_passwd;
	}
	public void setCboard_passwd(String cboard_passwd) {
		this.cboard_passwd = cboard_passwd;
	}
	public int getCboard_no() {
		return cboard_no;
	}
	public void setCboard_no(int cboard_no) {
		this.cboard_no = cboard_no;
	}
	public String getCboard_subject() {
		return cboard_subject;
	}
	public void setCboard_subject(String cboard_subject) {
		this.cboard_subject = cboard_subject;
	}
	public String getCboard_content() {
		return cboard_content;
	}
	public void setCboard_content(String cboard_content) {
		this.cboard_content = cboard_content;
	}
	public String getCboard_fileorg() {
		return cboard_fileorg;
	}
	public void setCboard_fileorg(String cboard_fileorg) {
		this.cboard_fileorg = cboard_fileorg;
	}
	public String getCboard_filesav() {
		return cboard_filesav;
	}
	public void setCboard_filesav(String cboard_savorg) {
		this.cboard_filesav = cboard_savorg;
	}
	public String getCboard_readhit() {
		return cboard_readhit;
	}
	public void setCboard_readhit(String cboard_readhit) {
		this.cboard_readhit = cboard_readhit;
	}
	public Date getCboard_regdate() {
		return cboard_regdate;
	}
	public void setCboard_regdate(Date cboard_regdate) {
		this.cboard_regdate = cboard_regdate;
	}
	public int getCboard_index() {
		return cboard_index;
	}
	public void setCboard_index(int cboard_index) {
		this.cboard_index = cboard_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
}
