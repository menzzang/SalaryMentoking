package Apply;

import java.util.Date;

public class AP_VO {
	
	public String getApply_job() {
		return apply_job;
	}
	public void setApply_job(String apply_job) {
		this.apply_job = apply_job;
	}
	public String getApply_achievement() {
		return apply_achievement;
	}
	public void setApply_achievement(String apply_achievement) {
		this.apply_achievement = apply_achievement;
	}
	public String getApply_content() {
		return apply_content;
	}
	public void setApply_content(String apply_content) {
		this.apply_content = apply_content;
	}
	public Date getApply_regdate() {
		return apply_regdate;
	}
	public void setApply_regdate(Date apply_regdate) {
		this.apply_regdate = apply_regdate;
	}
	public String getApply_djob() {
		return apply_djob;
	}
	public void setApply_djob(String apply_djob) {
		this.apply_djob = apply_djob;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getApply_no() {
		return apply_no;
	}
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}
	
	public String getApply_passwd() {
		return apply_passwd;
	}
	public void setApply_passwd(String apply_passwd) {
		this.apply_passwd = apply_passwd;
	}
	
	private String apply_passwd;
	private String apply_job;
	private String apply_achievement;
	private String apply_content;
	private Date apply_regdate;
	private String apply_djob;
	private int member_no;
	private int schedule_no;
	private int apply_no;
	
}
