package RComment;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;


import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class RC_WriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RC_WriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RC_WriteAction.sqlMapper = sqlMapper;
	}

	public RC_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(RC_VO paramClass) {
		this.paramClass = paramClass;
	}

	public RC_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(RC_VO resultClass) {
		this.resultClass = resultClass;
	}

	public int getRcomment_no() {
		return rcomment_no;
	}

	public void setRcomment_no(int rcomment_no) {
		this.rcomment_no = rcomment_no;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getRcomment_passwd() {
		return rcomment_passwd;
	}

	public void setRcomment_passwd(String rcomment_passwd) {
		this.rcomment_passwd = rcomment_passwd;
	}

	public String getRcomment_content() {
		return rcomment_content;
	}

	public void setRcomment_content(String rcomment_content) {
		this.rcomment_content = rcomment_content;
	}

	public int getRboard_no() {
		return rboard_no;
	}

	public void setRboard_no(int rboard_no) {
		this.rboard_no = rboard_no;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	
	Map<String,Object> session;
	private RC_VO paramClass;
	private RC_VO resultClass;

	private int rcomment_no;
	private int currentPage;
	private int member_no;
	private String rcomment_passwd;
	private String rcomment_content;
	private int rboard_no;

	Calendar today = Calendar.getInstance();

	public RC_WriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		return SUCCESS;
		
	}

	public String execute() throws Exception {
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
	
		paramClass = new RC_VO();
		resultClass = new RC_VO();
		
		
		paramClass.setRboard_no(getRboard_no());
		paramClass.setRcomment_passwd(getRcomment_passwd());
		paramClass.setRcomment_no(getRcomment_no());
		paramClass.setRcomment_content(getRcomment_content());
		paramClass.setRcomment_regdate(today.getTime());
	    paramClass.setMember_no((Integer)session.get("member_no"));
		sqlMapper.insert("rcommentInsert", paramClass);
		
		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
