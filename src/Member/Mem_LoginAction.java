package Member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Mem_LoginAction extends ActionSupport {
	
	public static Reader reader; 
	public static SqlMapClient sqlMapper; 

	private Mem_VO paramClass; 
	private Mem_VO resultClass;  
	
	private int pno;
	
	private String member_id;
	private String member_passwd;
	private int loginCheck;
	Map<String,Object> session;
	
	
	public Mem_LoginAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  
		reader.close();
	}
	
	public String form() throws Exception{
		
		return SUCCESS;
		
	}
	
	public String execute() throws Exception {
		
			
		paramClass = new Mem_VO();
		resultClass = new Mem_VO();
		
		resultClass = (Mem_VO) sqlMapper.queryForObject("memberIdCheck", member_id);

		if(resultClass == null){
			loginCheck = 0;	
			return ERROR;
		}
		else {
			if(resultClass.getMember_passwd().equals(member_passwd)) {
				loginCheck = 1;		
				
				ActionContext context = ActionContext.getContext();
				session = context.getSession();
				session.put("member_id", member_id);
				session.put("member_no", resultClass.getMember_no());
				session.put("member_index", resultClass.getMember_index());
				System.out.println(session);
				return SUCCESS;
			}
			else {
				loginCheck = -1;	

				return ERROR;
			}
		}
	}
	
	public String logout() throws Exception{
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		if(session.get("member_id") != null){
			session.remove("member_id");
			session.remove("member_no");
			session.remove("member_index");
			System.out.println(session);
			
			return SUCCESS;
		}
		
		return ERROR;
		
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


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
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


	public int getLoginCheck() {
		return loginCheck;
	}


	public void setLoginCheck(int loginCheck) {
		this.loginCheck = loginCheck;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	
	

}