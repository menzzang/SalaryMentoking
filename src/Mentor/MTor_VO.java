package Mentor;

import java.util.Date;

public class MTor_VO {
	
	private int member_index;
	private String mentor_passwd;
	private String member_name;
	
	private String member_email;
	private String area1;
	private String address;

	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private int mentor_no;
	private String mentor_intro;
	private String mentor_university;
	private String mentor_carrer;
	private String mentor_job;
	private String mentor_etc;
	private String mentor_image;
	private int member_no; 
	private String mentor_imagesav;
	
	public String getMentor_imagesav() {
		return mentor_imagesav;
	}
	public void setMentor_imagesav(String mentor_imagesav) {
		this.mentor_imagesav = mentor_imagesav;
	}
	public int getMember_no() {
		return member_no;
	}
	public int getMentor_no() {
		return mentor_no;
	}
	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMentor_intro() {
		return mentor_intro;
	}
	public void setMentor_intro(String mentor_intro) {
		this.mentor_intro = mentor_intro;
	}
	public String getMentor_university() {
		return mentor_university;
	}
	public void setMentor_university(String mentor_university) {
		this.mentor_university = mentor_university;
	}
	public String getMentor_carrer() {
		return mentor_carrer;
	}
	public void setMentor_carrer(String mentor_carrer) {
		this.mentor_carrer = mentor_carrer;
	}
	public String getMentor_job() {
		return mentor_job;
	}
	public void setMentor_job(String mentor_job) {
		this.mentor_job = mentor_job;
	}
	public String getMentor_etc() {
		return mentor_etc;
	}
	public void setMentor_etc(String mentor_etc) {
		this.mentor_etc = mentor_etc;
	}
	public String getMentor_image() {
		return mentor_image;
	}
	public void setMentor_image(String mentor_image) {
		this.mentor_image = mentor_image;
	}
	//member 테이블에서 join시킨 컬럼
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String getMentor_passwd() {
		return mentor_passwd;
	}
	public void setMentor_passwd(String mentor_passwd) {
		this.mentor_passwd = mentor_passwd;
	}
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}

}

