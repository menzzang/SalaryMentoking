package CComment;

import com.opensymphony.xwork2.ActionSupport;

import RComment.RC_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class CC_DeleteAction extends ActionSupport{
	

	public CC_VO getCcClass() {
		return ccClass;
	}

	public void setCcClass(CC_VO ccClass) {
		this.ccClass = ccClass;
	}

	public CC_VO getCcResult() {
		return ccResult;
	}

	public void setCcResult(CC_VO ccResult) {
		this.ccResult = ccResult;
	}

	public int getCcomment_no() {
		return ccomment_no;
	}

	public void setCcomment_no(int ccomment_no) {
		this.ccomment_no = ccomment_no;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CC_DeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CC_DeleteAction.sqlMapper = sqlMapper;
	}

	private CC_VO ccClass = new CC_VO();
	private CC_VO ccResult = new CC_VO();	
	private int ccomment_no;
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public CC_DeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		ccClass = new CC_VO();
		ccResult = new CC_VO();
		
		ccClass.setCcomment_no(getCcomment_no());
		
		sqlMapper.update("ccommentDelete",ccClass);
		
		return SUCCESS;
	}

}
