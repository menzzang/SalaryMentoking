package Notice;

import java.util.Date;

public class N_VO{
	
	private int notice_no;
	private String notice_subject;
	private String notice_content;
	private String notice_fileorg;
	private String notice_filesav;
	private String notice_readhit;
	private Date notice_regdate;
	private String notice_passwd;

	private String notice_hot;
	
	

	public String getNotice_hot() {
		return notice_hot;
	}
	public void setNotice_hot(String notice_hot) {
		this.notice_hot = notice_hot;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_fileorg() {
		return notice_fileorg;
	}
	public void setNotice_fileorg(String notice_fileorg) {
		this.notice_fileorg = notice_fileorg;
	}
	public String getNotice_filesav() {
		return notice_filesav;
	}
	public void setNotice_filesav(String notice_filesav) {
		this.notice_filesav = notice_filesav;
	}
	public String getNotice_readhit() {
		return notice_readhit;
	}
	public void setNotice_readhit(String notice_readhit) {
		this.notice_readhit = notice_readhit;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public String getNotice_passwd() {
		return notice_passwd;
	}
	public void setNotice_passwd(String notice_passwd) {
		this.notice_passwd = notice_passwd;
	}
	
}