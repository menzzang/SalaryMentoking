package CBoard;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class CB_ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CB_VO paramClass; //�Ķ���͸� ������ ��ü
	private CB_VO resultClass; //���� ��� ���� ������ ��ü
	
	private int currentPage;
	private int cboard_no;
	
	private String cboard_subject;
	private String cboard_passwd;
	private String cboard_content;
	private String cboard_fileorg;
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "C:\\Users\\Yun\\Desktop\\������Ʈ\\��ȣö\\upload\\"; //���ε� ���.

	
public CB_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

//�Խñ� ����
public String execute() throws Exception {
	
	//�Ķ���Ϳ� ����Ʈ ��ü ����.
	paramClass=new CB_VO();
	resultClass=new CB_VO();
	
	//������ �׸� ����.
	paramClass.setCboard_no(getCboard_no());
	paramClass.setCboard_subject(getCboard_subject());
	paramClass.setCboard_passwd(getCboard_passwd());
	paramClass.setCboard_content(getCboard_content());
	
	// �ϴ� �׸� �����Ѵ�.
			sqlMapper.update("cboardUpdate", paramClass);

			// ������ ������ ���ε� �Ǿ��ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
			if (getUpload() != null) {
				
				//���� ������ ����� ���� �̸��� Ȯ���� ����.
				String file_name = "file_" + getCboard_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//���� ���� ����
				File deleteFile = new File(fileUploadPath + getCboard_fileorg());
				deleteFile.delete();
				
				//�� ���� ���ε�
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//���� ���� �Ķ���� ����.
				paramClass.setCboard_fileorg(getUploadFileName());
				paramClass.setCboard_filesav(file_name + "." + file_ext);
				
				//���� ���� ������Ʈ.
				sqlMapper.update("cboardUpdateFile", paramClass);
			}

			// ������ ������ view �������� �̵�.
			resultClass = (CB_VO) sqlMapper.queryForObject("cboardSelectOne", getCboard_no());

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

public int getCboard_no() {
	return cboard_no;
}

public void setCboard_no(int cboard_no) {
	this.cboard_no = cboard_no;
}

public String getCboard_subject() {
	return cboard_subject;
}

public void setCboard_subject(String cboard_subject) {
	this.cboard_subject = cboard_subject;
}

public String getCboard_passwd() {
	return cboard_passwd;
}

public void setCboard_passwd(String cboard_passwd) {
	this.cboard_passwd = cboard_passwd;
}

public String getCboard_content() {
	return cboard_content;
}

public void setCboard_content(String cboard_content) {
	this.cboard_content = cboard_content;
}

public String getCboard_fileorg() {
	return cboard_fileorg;
}

public void setCboard_fileorg(String cboard_fileorg) {
	this.cboard_fileorg = cboard_fileorg;
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

















