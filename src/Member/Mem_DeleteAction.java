package Member;
/*È¸¿ø Å»Åð Action*/

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class Mem_DeleteAction extends ActionSupport{
	
	private Mem_VO paramClass;
	private Mem_VO resultClass;
	private String member_id;
	private String member_passwd;
	Map<String,Object> session;
	
	int deleteResult;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public Mem_DeleteAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{
		
		return SUCCESS;
		
	}
	
	public String execute() throws Exception{		
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		paramClass = new Mem_VO();
		paramClass.setMember_passwd(getMember_passwd());
		paramClass.setMember_no((Integer)session.get("member_no"));
		
		resultClass = (Mem_VO)sqlMapper.queryForObject("memberSelectPassword", paramClass);

		if(resultClass == null){
			
			deleteResult = -1;
			
			return ERROR;
			
		}
		else if(resultClass.getMember_passwd().equals(member_passwd)){
			
			deleteResult = 1;
			
			sqlMapper.delete("deleteMember", paramClass);
			session.remove("member_id");
			session.remove("member_no");
			session.remove("member_index");
		}
		
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

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getDeleteResult() {
		return deleteResult;
	}

	public void setDeleteResult(int deleteResult) {
		this.deleteResult = deleteResult;
	}
}