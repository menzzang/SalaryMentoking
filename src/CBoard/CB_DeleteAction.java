package CBoard;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;
import CComment.CC_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class CB_DeleteAction extends ActionSupport  {
	

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
		CB_DeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CB_DeleteAction.sqlMapper = sqlMapper;
	}

	private CC_VO ccClass = new CC_VO();
	private CC_VO ccResult = new CC_VO();
	private int ccomment_no;
	
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CB_VO paramClass;
	private CB_VO resultClass;
	
	private int currentPage;
	
	private String fileUploadPath="C:\\Users\\Yun\\Desktop\\������Ʈ\\��ȣö\\upload\\";
	private int cboard_no;
	
	public CB_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	// �Խñ� �� ����
		public String execute() throws Exception {
			
			//�Ķ���Ϳ� ����Ʈ ��ü ����.
			paramClass = new CB_VO();
			resultClass = new CB_VO();
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass = (CB_VO) sqlMapper.queryForObject("cboardSelectOne", getCboard_no());

			//���� ���� ����
			File deleteFile = new File(fileUploadPath + resultClass.getCboard_filesav());
			deleteFile.delete();

			// ������ �׸� ����.
			paramClass.setCboard_no(getCboard_no());
					
			// ���� ���� ����.
			sqlMapper.update("cboardDelete", paramClass);

			return SUCCESS;
			
		}
		
		public String execute2() throws Exception{
			
			ccClass.setCcomment_no(getCcomment_no());
			
			sqlMapper.update("ccommentDelete", ccClass);
			
			return SUCCESS;
		}

		public CB_VO getParamClass() {
			return paramClass;
		}

		public void setParamClass(CB_VO paramClass) {
			this.paramClass = paramClass;
		}

		public CB_VO getResultClass() {
			return resultClass;
		}

		public void setResultClass(CB_VO resultClass) {
			this.resultClass = resultClass;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public String getFileUploadPath() {
			return fileUploadPath;
		}

		public void setFileUploadPath(String fileUploadPath) {
			this.fileUploadPath = fileUploadPath;
		}

		public int getCboard_no() {
			return cboard_no;
		}

		public void setCboard_no(int cboard_no) {
			this.cboard_no = cboard_no;
		}

}
