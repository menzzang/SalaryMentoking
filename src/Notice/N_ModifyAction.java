package Notice;

import com.opensymphony.xwork2.ActionSupport;

import Notice.N_VO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class N_ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private N_VO paramClass; //�Ķ���͸� ������ ��ü
	private N_VO resultClass; //���� ��� ���� ������ ��ü
	
	private int currentPage;
	private int notice_no;
	
	private String notice_hot;
	
	

	public String getNotice_hot() {
		return notice_hot;
	}
	public void setNotice_hot(String notice_hot) {
		this.notice_hot = notice_hot;
	}

	private String notice_subject;
	private String notice_passwd;
	private String notice_content;
	private String notice_fileorg;
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "C:\\java\\upload\\notice\\"; //���ε� ���.

	
public N_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

//�Խñ� ����
public String execute() throws Exception {
	
	//�Ķ���Ϳ� ����Ʈ ��ü ����.
	paramClass=new N_VO();
	resultClass=new N_VO();
	
	//������ �׸� ����.
	paramClass.setNotice_no(getNotice_no());
	paramClass.setNotice_subject(getNotice_subject());
	paramClass.setNotice_passwd(getNotice_passwd());
	paramClass.setNotice_content(getNotice_content());
	paramClass.setNotice_hot(getNotice_hot());
	
	
	// �ϴ� �׸� �����Ѵ�.
			sqlMapper.update("noticeUpdate", paramClass);

			// ������ ������ ���ε� �Ǿ��ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
			if (getUpload() != null) {
				
				//���� ������ ����� ���� �̸��� Ȯ���� ����.
				String file_name = "file_" + getNotice_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//���� ���� ����
				File deleteFile = new File(fileUploadPath + getNotice_fileorg());
				deleteFile.delete();
				
				//�� ���� ���ε�
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//���� ���� �Ķ���� ����.
				paramClass.setNotice_fileorg(getUploadFileName());
				paramClass.setNotice_filesav(file_name + "." + file_ext);
				
				//���� ���� ������Ʈ.
				sqlMapper.update("noticeUpdateFile", paramClass);
			}

			// ������ ������ view �������� �̵�.
			resultClass = (N_VO) sqlMapper.queryForObject("noticeSelectOne", getNotice_no());

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

public int getNotice_no() {
	return notice_no;
}

public void setNotice_no(int notice_no) {
	this.notice_no = notice_no;
}

public String getNotice_subject() {
	return notice_subject;
}

public void setNotice_subject(String notice_subject) {
	this.notice_subject = notice_subject;
}

public String getNotice_passwd() {
	return notice_passwd;
}

public void setNotice_passwd(String notice_passwd) {
	this.notice_passwd = notice_passwd;
}

public String getNotice_content() {
	return notice_content;
}

public void setNotice_content(String notice_content) {
	this.notice_content = notice_content;
}

public String getNotice_fileorg() {
	return notice_fileorg;
}

public void setNotice_fileorg(String notice_fileorg) {
	this.notice_fileorg = notice_fileorg;
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



}

















