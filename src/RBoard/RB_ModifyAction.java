package RBoard;

import com.opensymphony.xwork2.ActionSupport;

import RBoard.RB_VO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class RB_ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RB_ModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RB_ModifyAction.sqlMapper = sqlMapper;
	}

	public RB_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(RB_VO paramClass) {
		this.paramClass = paramClass;
	}

	public RB_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(RB_VO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRboard_no() {
		return rboard_no;
	}

	public void setRboard_no(int rboard_no) {
		this.rboard_no = rboard_no;
	}

	public String getRboard_subject() {
		return rboard_subject;
	}

	public void setRboard_subject(String rboard_subject) {
		this.rboard_subject = rboard_subject;
	}

	public String getRboard_passwd() {
		return rboard_passwd;
	}

	public void setRboard_passwd(String rboard_passwd) {
		this.rboard_passwd = rboard_passwd;
	}

	public String getRboard_content() {
		return rboard_content;
	}

	public void setRboard_content(String rboard_content) {
		this.rboard_content = rboard_content;
	}

	public String getRboard_fileorg() {
		return rboard_fileorg;
	}

	public void setRboard_fileorg(String rboard_fileorg) {
		this.rboard_fileorg = rboard_fileorg;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	private RB_VO paramClass; //�Ķ���͸� ������ ��ü
	private RB_VO resultClass; //���� ��� ���� ������ ��ü
	
	private int currentPage;
	private int rboard_no;
	
	private String rboard_subject;
	private String rboard_passwd;
	private String rboard_content;
	private String rboard_fileorg;
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "C:\\java\\upload\\rboard\\"; //���ε� ���.

	
public RB_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

//�Խñ� ����
public String execute() throws Exception {
	
	//�Ķ���Ϳ� ����Ʈ ��ü ����.
	paramClass=new RB_VO();
	resultClass=new RB_VO();
	
	//������ �׸� ����.
	paramClass.setRboard_no(getRboard_no());
	paramClass.setRboard_subject(getRboard_subject());
	paramClass.setRboard_passwd(getRboard_passwd());
	paramClass.setRboard_content(getRboard_content());
	
	// �ϴ� �׸� �����Ѵ�.
			sqlMapper.update("rboardUpdate", paramClass);

			// ������ ������ ���ε� �Ǿ��ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
			if (getUpload() != null) {
				
				//���� ������ ����� ���� �̸��� Ȯ���� ����.
				String file_name = "file_" + getRboard_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//���� ���� ����
				File deleteFile = new File(fileUploadPath + getRboard_fileorg());
				deleteFile.delete();
				
				//�� ���� ���ε�
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//���� ���� �Ķ���� ����.
				paramClass.setRboard_fileorg(getUploadFileName());
				paramClass.setRboard_filesav(file_name + "." + file_ext);
				
				//���� ���� ������Ʈ.
				sqlMapper.update("rboardUpdateFile", paramClass);
			}

			// ������ ������ view �������� �̵�.
			resultClass = (RB_VO) sqlMapper.queryForObject("rboardSelectOne", getRboard_no());

			return SUCCESS;
		}
}

















