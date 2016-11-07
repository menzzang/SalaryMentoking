package Member;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class Mem_JoinAction extends ActionSupport{
	

	private Mem_VO paramClass;
	private Mem_VO resultClass;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_email;
	private String member_email1;
	private String member_phone2;
	private String member_phone3;
	private String member_zipcode;
	private String member_address;
	private String member_address1;
	private Date member_regdate;
	private String member_birthdate;
	private String member_sex;
	private int member_index;
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		Mem_JoinAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		Mem_JoinAction.sqlMapper = sqlMapper;
	}

	public Mem_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(Mem_VO paramClass) {
		this.paramClass = paramClass;
	}

	public Mem_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(Mem_VO resultClass) {
		this.resultClass = resultClass;
	}

	Calendar today=Calendar.getInstance();
	
	public Mem_JoinAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//공통 회원가입 폼
	public String form() throws Exception{
		return SUCCESS;
	}
	
	//회원가입 입력 액션
	public String execute() throws Exception{
		paramClass=new Mem_VO();
		resultClass=new Mem_VO();
		paramClass.setMember_id(getMember_id());
		resultClass=(Mem_VO)sqlMapper.queryForObject("memberSelectOne", paramClass); //회원가입여부체크
		if(resultClass != null){
			return ERROR;
		}else{
			paramClass.setMember_name(getMember_name()); 
			resultClass=(Mem_VO)sqlMapper.queryForObject("sameMemberChk", paramClass); //아이디중복체크
			if(resultClass != null){
				return INPUT;
			}else{
				paramClass.setMember_id(getMember_id());
				paramClass.setMember_passwd(getMember_passwd());
				paramClass.setMember_email(getMember_email()+"@"+getMember_email1());
				paramClass.setMember_name(getMember_name());
				paramClass.setMember_phone("010"+"-"+getMember_phone2()+"-"+getMember_phone3());
				paramClass.setMember_zipcode(getMember_zipcode());
				paramClass.setMember_address(getMember_address() + getMember_address1());
				paramClass.setMember_index(member_index);
				paramClass.setMember_regdate(today.getTime());
				paramClass.setMember_birthdate(getMember_birthdate());
				paramClass.setMember_sex(getMember_sex());
				paramClass.setMember_index(getMember_index());
				
				//연령구하기
				//DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
				//Date tempDate = sdFormat.parse(getBirthdate());
				//long tempAge = System.currentTimeMillis() - tempDate.getTime();
				//int age = (int) (tempAge / (1000*60*60*24) / 365);
				
				sqlMapper.insert("insertMember",paramClass);
				
				return SUCCESS;
			}
		}
		
	}
	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

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
	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}


	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	public int getMember_index() {
		return member_index;
	}

	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}

	public String getMember_birthdate() {
		return member_birthdate;
	}

	public void setMember_birthdate(String member_birthdate) {
		this.member_birthdate = member_birthdate;
	}

	public String getMember_sex() {
		return member_sex;
	}

	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}

	public String getMember_email1() {
		return member_email1;
	}

	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_phone2() {
		return member_phone2;
	}

	public void setMember_phone2(String member_phone2) {
		this.member_phone2 = member_phone2;
	}

	public String getMember_phone3() {
		return member_phone3;
	}

	public void setMember_phone3(String member_phone3) {
		this.member_phone3 = member_phone3;
	}
}
