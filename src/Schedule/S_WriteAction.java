package Schedule;

import Schedule.S_VO;
import Member.Mem_VO;
import Mentor.MTor_VO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class S_WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	public int getMentor_no() {
		return mentor_no;
	}

	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}
	private int mentor_no;
	private int schedule_no;
	private String schedule_time;
	private String schedule_day;
	private String schedule_addr1;
	private String schedule_addr2;
	private String schedule_addr3;
	private String schedule_addr4;
	private String schedule_subject;
	private String schedule_content;
	private int schedule_count;
	private String schedule_passwd;
	private Date schedule_regdate;


	Calendar today = Calendar.getInstance();
	Map<String,Object> session;

	private S_VO paramClass;
	private S_VO resultClass;
	private MTor_VO MTorresultClass;
	
	public S_WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		MTorresultClass= new MTor_VO();
		resultClass = new S_VO();
		resultClass=(S_VO)sqlMapper.queryForObject("scheduleSelectOne", getSchedule_no());
		MTorresultClass = (MTor_VO)sqlMapper.queryForObject("scheduleSelectMentorNo", (Integer)session.get("member_no"));
		return SUCCESS;
	}

	
	public String execute() throws Exception {
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		paramClass = new S_VO();
		resultClass = new S_VO();
		paramClass.setSchedule_time(getSchedule_time());
		paramClass.setSchedule_day(getSchedule_day());
		paramClass.setSchedule_addr1(getSchedule_addr1());
		paramClass.setSchedule_addr2(getSchedule_addr2());
		paramClass.setSchedule_addr3(getSchedule_addr3());
		paramClass.setSchedule_addr4(getSchedule_addr4());
		paramClass.setSchedule_subject(getSchedule_subject());
		paramClass.setSchedule_content(getSchedule_content());
		paramClass.setSchedule_count(getSchedule_count());
		paramClass.setSchedule_passwd(getSchedule_passwd());
		paramClass.setSchedule_regdate(today.getTime());
		paramClass.setMentor_no(getMentor_no());
		paramClass.setMember_no((Integer)session.get("member_no"));
		
		sqlMapper.insert("scheduleInsert", paramClass);
		
		return SUCCESS;

	}
	

	public MTor_VO getMTorresultClass() {
		return MTorresultClass;
	}

	public void setMTorresultClass(MTor_VO mTorresultClass) {
		MTorresultClass = mTorresultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	
	public String getSchedule_time() {
		return schedule_time;
	}

	public void setSchedule_time(String schedule_time) {
		this.schedule_time = schedule_time;
	}

	public String getSchedule_day() {
		return schedule_day;
	}

	public void setSchedule_day(String schedule_day) {
		this.schedule_day = schedule_day;
	}

	public String getSchedule_addr1() {
		return schedule_addr1;
	}

	public void setSchedule_addr1(String schedule_addr1) {
		this.schedule_addr1 = schedule_addr1;
	}

	public String getSchedule_addr2() {
		return schedule_addr2;
	}

	public void setSchedule_addr2(String schedule_addr2) {
		this.schedule_addr2 = schedule_addr2;
	}

	public String getSchedule_addr3() {
		return schedule_addr3;
	}

	public void setSchedule_addr3(String schedule_addr3) {
		this.schedule_addr3 = schedule_addr3;
	}

	public String getSchedule_addr4() {
		return schedule_addr4;
	}

	public void setSchedule_addr4(String schedule_addr4) {
		this.schedule_addr4 = schedule_addr4;
	}

	public String getSchedule_subject() {
		return schedule_subject;
	}

	public void setSchedule_subject(String schedule_subject) {
		this.schedule_subject = schedule_subject;
	}

	public String getSchedule_content() {
		return schedule_content;
	}

	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}

	public String getSchedule_passwd() {
		return schedule_passwd;
	}

	public void setSchedule_passwd(String schedule_passwd) {
		this.schedule_passwd = schedule_passwd;
	}

	public Date getSchedule_regdate() {
		return schedule_regdate;
	}

	public void setSchedule_regdate(Date schedule_regdate) {
		this.schedule_regdate = schedule_regdate;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public S_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(S_VO paramClass) {
		this.paramClass = paramClass;
	}

	public S_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(S_VO resultClass) {
		this.resultClass = resultClass;
	}

	public int getSchedule_count() {
		return schedule_count;
	}

	public void setSchedule_count(int schedule_count) {
		this.schedule_count = schedule_count;
	}

	



}