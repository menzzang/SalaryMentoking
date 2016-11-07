package IBoard;

import com.opensymphony.xwork2.ActionSupport;

import IBoard.IB_VO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class IB_ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private IB_VO paramClass; //�Ķ���͸� ������ ��ü
	private IB_VO resultClass; //���� ��� ���� ������ ��ü
	
	private int currentPage;
	private int iboard_no;
	

	private String iboard_subject;
	private String iboard_passwd;
	private String iboard_content;
	private String iboard_fileorg;
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "C:\\Java\\upload\\iboard\\";

	
public IB_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

//�Խñ� ����
public String execute() throws Exception {
	
	//�Ķ���Ϳ� ����Ʈ ��ü ����.
	paramClass=new IB_VO();
	resultClass=new IB_VO();
	
	//������ �׸� ����.
	paramClass.setIboard_no(getIboard_no());
	paramClass.setIboard_subject(getIboard_subject());
	paramClass.setIboard_passwd(getIboard_passwd());
	paramClass.setIboard_content(getIboard_content());
	
	// �ϴ� �׸� �����Ѵ�.
			sqlMapper.update("iboardUpdate", paramClass);

			// ������ ������ ���ε� �Ǿ��ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
			if (getUpload() != null) {
				
				//���� ������ ����� ���� �̸��� Ȯ���� ����.
				String file_name = "file_" + getIboard_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//���� ���� ����
				File deleteFile = new File(fileUploadPath + getIboard_fileorg());
				deleteFile.delete();
				
				//�� ���� ���ε�
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//���� ���� �Ķ���� ����.
				paramClass.setIboard_fileorg(getUploadFileName());
				paramClass.setIboard_filesav(file_name + "." + file_ext);
				
				//���� ���� ������Ʈ.
				sqlMapper.update("iboardUpdateFile", paramClass);
			}

			// ������ ������ view �������� �̵�.
			resultClass = (IB_VO) sqlMapper.queryForObject("iboardSelectOne", getIboard_no());

			return SUCCESS;
		}

public IB_VO getParamClass() {
	return paramClass;
}

public void setParamClass(IB_VO paramClass) {
	this.paramClass = paramClass;
}

public IB_VO getResultClass() {
	return resultClass;
}

public void setResultClass(IB_VO resultClass) {
	this.resultClass = resultClass;
}

public int getCurrentPage() {
	return currentPage;
}

public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}

public int getIboard_no() {
	return iboard_no;
}

public void setIboard_no(int iboard_no) {
	this.iboard_no = iboard_no;
}

public String getIboard_subject() {
	return iboard_subject;
}

public void setIboard_subject(String iboard_subject) {
	this.iboard_subject = iboard_subject;
}

public String getIboard_passwd() {
	return iboard_passwd;
}

public void setIboard_passwd(String iboard_passwd) {
	this.iboard_passwd = iboard_passwd;
}

public String getIboard_content() {
	return iboard_content;
}

public void setIboard_content(String iboard_content) {
	this.iboard_content = iboard_content;
}

public String getIboard_fileorg() {
	return iboard_fileorg;
}

public void setIboard_fileorg(String iboard_fileorg) {
	this.iboard_fileorg = iboard_fileorg;
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





}

















