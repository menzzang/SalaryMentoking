package Apply;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Apply.AP_VO;
import Mentor.MTor_VO;
import Member.Mem_VO;
import Schedule.S_VO;

import com.opensymphony.xwork2.ActionContext;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class AP_ViewAction extends ActionSupport{
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

	public MTor_VO getMTresultClass() {
		return MTresultClass;
	}

	public void setMTresultClass(MTor_VO mTresultClass) {
		MTresultClass = mTresultClass;
	}

	public Mem_VO getMemresultClass() {
		return MemresultClass;
	}

	public void setMemresultClass(Mem_VO memresultClass) {
		MemresultClass = memresultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	private MTor_VO MTresultClass;
	private Mem_VO MemresultClass;

	
	private int apply_no;
	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public S_VO getSresultClass() {
		return SresultClass;
	}

	public void setSresultClass(S_VO sresultClass) {
		SresultClass = sresultClass;
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

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	private int schedule_no;
	private int mentor_no;
	private int member_no;
	private S_VO SresultClass;
	private AP_VO APparamClass;
	private AP_VO APresultClass;

	
	private String apply_job;
	private String apply_djob;
	private String apply_achievement;
	private String apply_content;
	private String apply_passwd;
	Calendar today = Calendar.getInstance();
	
	public int no;
	
	public AP_ViewAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		Map<String,Object> session;

		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
		
		MemresultClass = new Mem_VO();
		MTresultClass = new MTor_VO();
		SresultClass = new S_VO();
		 System.out.println(getMentor_no());
		MemresultClass = (Mem_VO)sqlMapper.queryForObject("memberSelectForApply", getMentor_no());
		MTresultClass = (MTor_VO)sqlMapper.queryForObject("mentorSelectForApply", getMentor_no());
		SresultClass=(S_VO)sqlMapper.queryForObject("scheduleSelectForApply", getSchedule_no());
		APresultClass=(AP_VO)sqlMapper.queryForObject("applyNoCurrval", (Integer)session.get("member_no"));
		System.out.println(APresultClass.getApply_job());
		return SUCCESS;
	}
	
	public String checkForm() throws Exception {

		return SUCCESS;
	}
	
	public String checkAction() throws Exception {
		APparamClass = new AP_VO();
		System.out.println(getApply_passwd());
		System.out.println(getApply_no());
		APparamClass.setApply_no(getApply_no());
		APparamClass.setApply_passwd(getApply_passwd());

		APresultClass = (AP_VO) sqlMapper.queryForObject("applySelectPasswd", APparamClass);

		if (APresultClass == null)
			return ERROR;

		return SUCCESS;
	}
	
}
