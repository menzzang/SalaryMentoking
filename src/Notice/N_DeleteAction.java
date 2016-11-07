package Notice;

import com.opensymphony.xwork2.ActionSupport;

import Notice.N_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class N_DeleteAction extends ActionSupport  {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private N_VO paramClass;
	private N_VO resultClass;
	
	private int currentPage;
	
	private String fileUploadPath="C:\\java\\upload\\notice\\";
	private int notice_no;
	
	public N_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	// �Խñ� �� ����
		public String execute() throws Exception {
			
			//�Ķ���Ϳ� ����Ʈ ��ü ����.
			paramClass = new N_VO();
			resultClass = new N_VO();
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass = (N_VO) sqlMapper.queryForObject("noticeSelectOne", getNotice_no());

			//���� ���� ����
			File deleteFile = new File(fileUploadPath + resultClass.getNotice_filesav());
			deleteFile.delete();

			// ������ �׸� ����.
			paramClass.setNotice_no(getNotice_no());
					
			// ���� ���� ����.
			sqlMapper.update("noticeDelete", paramClass);

			return SUCCESS;
			
		}

		public N_VO getParamClass() {
			return paramClass;
		}

		public void setParamClass(N_VO paramClass) {
			this.paramClass = paramClass;
		}

		public N_VO getResultClass() {
			return resultClass;
		}

		public void setResultClass(N_VO resultClass) {
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

		public int getNotice_no() {
			return notice_no;
		}

		public void setNotice_no(int notice_no) {
			this.notice_no = notice_no;
		}

}
