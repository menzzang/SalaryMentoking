package RComment;

import com.opensymphony.xwork2.ActionSupport;

import RComment.RC_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class RC_DeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RC_DeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RC_DeleteAction.sqlMapper = sqlMapper;
	}
	
	public int getRcomment_no() {
		return rcomment_no;
	}

	public void setRcomment_no(int rcomment_no) {
		this.rcomment_no = rcomment_no;
	}

	public RC_VO getRcClass() {
		return rcClass;
	}

	public void setRcClass(RC_VO rcClass) {
		this.rcClass = rcClass;
	}

	public RC_VO getRcResult() {
		return rcResult;
	}

	public void setRcResult(RC_VO rcResult) {
		this.rcResult = rcResult;
	}

	private RC_VO rcClass = new RC_VO();
	private RC_VO rcResult = new RC_VO();
	
	private int rcomment_no;
	
	
	
	public RC_DeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		rcClass = new RC_VO();
		rcResult = new RC_VO();
		
		rcClass.setRcomment_no(getRcomment_no());
		
		sqlMapper.update("rcommentDelete",rcClass);
		
		return SUCCESS;
	}

}
