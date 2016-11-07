package CComment;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class CC_WriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CC_WriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CC_WriteAction.sqlMapper = sqlMapper;
	}

	public CC_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(CC_VO paramClass) {
		this.paramClass = paramClass;
	}

	public CC_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(CC_VO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCcomment_no() {
		return ccomment_no;
	}

	public void setCcomment_no(int ccomment_no) {
		this.ccomment_no = ccomment_no;
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

	public String getCcomment_passwd() {
		return ccomment_passwd;
	}

	public void setCcomment_passwd(String ccomment_passwd) {
		this.ccomment_passwd = ccomment_passwd;
	}

	public String getCcomment_content() {
		return ccomment_content;
	}

	public void setCcomment_content(String ccomment_content) {
		this.ccomment_content = ccomment_content;
	}

	public int getCboard_no() {
		return cboard_no;
	}

	public void setCboard_no(int cboard_no) {
		this.cboard_no = cboard_no;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	private CC_VO paramClass;
	private CC_VO resultClass;

	private int ccomment_no;
	private int currentPage;
	private int member_no;
	private String ccomment_passwd;
	private String ccomment_content;
	private int cboard_no;

	Calendar today = Calendar.getInstance();

	public CC_WriteAction() throws IOException
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
		
		paramClass = new CC_VO();
		resultClass = new CC_VO();
		
		paramClass.setCboard_no(getCboard_no());
		paramClass.setCcomment_passwd(getCcomment_passwd());
		paramClass.setCcomment_no(getCcomment_no());
		paramClass.setCcomment_content(getCcomment_content());
		paramClass.setCcomment_regdate(today.getTime());
		paramClass.setMember_no(getMember_no());
		
		sqlMapper.insert("ccommentInsert", paramClass);
		
		return SUCCESS;
	}

}
