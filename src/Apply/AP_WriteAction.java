package Apply;

import com.opensymphony.xwork2.ActionSupport;

import Apply.AP_VO;
import Schedule.S_VO;
import CBoard.CB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;


public class AP_WriteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AP_WriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AP_WriteAction.sqlMapper = sqlMapper;
	}

	public String getApply_job() {
		return apply_job;
	}

	public void setApply_job(String apply_job) {
		this.apply_job = apply_job;
	}

	public String getApply_djob() {
		return apply_djob;
	}

	public void setApply_djob(String apply_djob) {
		this.apply_djob = apply_djob;
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

	public String getApply_passwd() {
		return apply_passwd;
	}

	public void setApply_passwd(String apply_passwd) {
		this.apply_passwd = apply_passwd;
	}

	public AP_VO getAPparamClass() {
		return APparamClass;
	}

	public void setAPparamClass(AP_VO aPparamClass) {
		APparamClass = aPparamClass;
	}

	public AP_VO getAPresultClass() {
		return APresultClass;
	}

	public void setAPresultClass(AP_VO aPresultClass) {
		APresultClass = aPresultClass;
	}
	
	public S_VO getSresultClass() {
		return SresultClass;
	}

	public void setSresultClass(S_VO aResultClass) {
		SresultClass = aResultClass;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}


	private int schedule_no;
	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	
	private int member_no;

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	public int getSchedule_apply_count() {
		return schedule_apply_count;
	}

	public void setSchedule_apply_count(int schedule_apply_count) {
		this.schedule_apply_count = schedule_apply_count;
	}
	
	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	private int apply_no;
	Map<String,Object> session;
	private S_VO SresultClass;
	private AP_VO APparamClass;
	private AP_VO APresultClass;
	private int schedule_apply_count;
	private String apply_job;
	private String apply_djob;
	private String apply_achievement;
	private String apply_content;
	private String apply_passwd;
	Calendar today = Calendar.getInstance();
	
	public AP_WriteAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{
		
		SresultClass = new S_VO();
		SresultClass=(S_VO)sqlMapper.queryForObject("scheduleSelectForApplyModify", getSchedule_no());
		APresultClass = new AP_VO();
		APresultClass = (AP_VO)sqlMapper.queryForObject("applySelectOne", getApply_no());
	
	return SUCCESS;
	}
	
	public String execute() throws Exception {
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
	      
	    APparamClass=new AP_VO();
	    APparamClass.setMember_no((Integer)session.get("member_no"));
		APparamClass.setApply_job(getApply_job());
		APparamClass.setApply_djob(getApply_djob());
		APparamClass.setApply_job(getApply_job());
		APparamClass.setApply_achievement(getApply_achievement());
		APparamClass.setApply_passwd(getApply_passwd());
		APparamClass.setApply_content(getApply_content());
		APparamClass.setApply_regdate(today.getTime());
		APparamClass.setSchedule_no(getSchedule_no());
		
		sqlMapper.update("addToScheduleCount", getSchedule_no());
		sqlMapper.insert("applyInsert", APparamClass);

		return SUCCESS;
	}
}
