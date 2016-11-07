package Member;
import com.opensymphony.xwork2.ActionContext;
/*회원 정보 수정 Action*/
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class Mem_ModifyAction extends ActionSupport{
	
	Map<String,Object> session;
	
	private Mem_VO paramClass;
	private Mem_VO resultClass;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_zipcode;
	private String member_address;
	private String member_addr_detail;
	private Date member_regdate;
	private String member_birthdate;
	private String member_sex;
	private int member_index;
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	Calendar today = Calendar.getInstance();
	
	public Mem_ModifyAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{
		
		paramClass = new Mem_VO();
		resultClass = new Mem_VO();
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		paramClass.setMember_no((Integer)session.get("member_no"));
		resultClass = (Mem_VO)sqlMapper.queryForObject("memberSelectOne", paramClass);
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		paramClass = new Mem_VO();
		resultClass = new Mem_VO();
		
		System.out.println("member_id : "+ getMember_id());
		
		paramClass.setMember_id(getMember_id());
		paramClass.setMember_passwd(getMember_passwd());
		paramClass.setMember_name(getMember_name());
		paramClass.setMember_sex(getMember_sex());
		paramClass.setMember_email(getMember_email());
		paramClass.setMember_phone(getMember_phone());
		paramClass.setMember_zipcode(getMember_zipcode());
		paramClass.setMember_address(getMember_address());
		paramClass.setMember_birthdate(getMember_birthdate());
		
		sqlMapper.update("updateMember", paramClass);
		
		return SUCCESS;
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
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
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
	public String getMember_addr_detail() {
		return member_addr_detail;
	}
	public void setMember_addr_detail(String member_addr_detail) {
		this.member_addr_detail = member_addr_detail;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
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
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	
	
}