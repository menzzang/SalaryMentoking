package Apply;

import com.opensymphony.xwork2.ActionSupport;

import Apply.AP_VO;
import Schedule.S_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class AP_ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AP_ModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AP_ModifyAction.sqlMapper = sqlMapper;
	}

	public S_VO getSresultClass() {
		return SresultClass;
	}

	public void setSresultClass(S_VO sresultClass) {
		SresultClass = sresultClass;
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

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
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
	
	private int apply_no;

	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	private S_VO SresultClass;
	private AP_VO APparamClass;
	private AP_VO APresultClass; 

	private int member_no;
	private String apply_job;
	private String apply_djob;
	private String apply_achievement;
	private String apply_content;
	
public AP_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); 
		reader.close();
	}

public String form() throws Exception{
	
	SresultClass = new S_VO();
	SresultClass=(S_VO)sqlMapper.queryForObject("scheduleSelectForApplyModify", getApply_no());
	APresultClass = new AP_VO();
	APresultClass = (AP_VO)sqlMapper.queryForObject("applySelectOne", getApply_no());
	
	return SUCCESS;
}

public String execute() throws Exception {
	
	APparamClass=new AP_VO();
	APresultClass=new AP_VO();
	
	APparamClass.setApply_no(getApply_no());
	APparamClass.setApply_job(getApply_job());
	APparamClass.setApply_djob(getApply_djob());
	APparamClass.setApply_achievement(getApply_achievement());
	APparamClass.setApply_content(getApply_content());
	
	sqlMapper.update("applyUpdate", APparamClass);
	APresultClass = (AP_VO) sqlMapper.queryForObject("applySelectOne", getApply_no());

	return SUCCESS;
	}
}

















