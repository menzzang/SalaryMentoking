//유저가이드는 하나의 페이지와 같으므로 int no부분은 다 삭제함

package UserGuide;

import com.opensymphony.xwork2.ActionSupport;

import UserGuide.UG_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class UG_ModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	

	private UG_VO paramClass;
	private UG_VO resultClass; 

	private int currentPage;	


	private int userguide_no;



	private String userguide_passwd;

	private String userguide_content;
	

	private String userguide_content2;
	private String userguide_content3;
	private String userguide_fileorg;

	private File upload; 
	private String uploadContentType; 
	private String uploadFileName; 
	private String fileUploadPath = "C:\\java\\workspace\\new\\WebContent\\Img\\"; 
	
	public UG_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

public String execute() throws Exception {
		

		paramClass = new UG_VO();
		resultClass = new UG_VO();

	
		paramClass.setUserguide_passwd(getUserguide_passwd());
		paramClass.setUserguide_no(getUserguide_no());
		paramClass.setUserguide_content(getUserguide_content());
		paramClass.setUserguide_content2(getUserguide_content2());
		paramClass.setUserguide_content3(getUserguide_content3());


		sqlMapper.update("userguideUpdate", paramClass);


		if (getUpload() != null) {
			
		
			String file_name = "file_" + getUserguide_no();
		    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
	
			File deleteFile = new File(fileUploadPath + getUserguide_fileorg());
			deleteFile.delete();
			
	
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
		
			paramClass.setUserguide_fileorg(getUploadFileName());
			paramClass.setUserguide_filesav(file_name + "." + file_ext);
			
	
			sqlMapper.update("userguideUpdateFile", paramClass);
		}

	
		resultClass = (UG_VO) sqlMapper.queryForObject("userguideSelectOne",getUserguide_no());

		return SUCCESS;
	}

public UG_VO getParamClass() {
	return paramClass;
}

public void setParamClass(UG_VO paramClass) {
	this.paramClass = paramClass;
}

public UG_VO getResultClass() {
	return resultClass;
}

public void setResultClass(UG_VO resultClass) {
	this.resultClass = resultClass;
}

public int getCurrentPage() {
	return currentPage;
}

public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
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
public int getUserguide_no() {
	return userguide_no;
}

public void setUserguide_no(int userguide_no) {
	this.userguide_no = userguide_no;
}

public String getUserguide_content() {
	return userguide_content;
}

public void setUserguide_content(String userguide_content) {
	this.userguide_content = userguide_content;
}

public String getUserguide_fileorg() {
	return userguide_fileorg;
}

public void setUserguide_fileorg(String userguide_fileorg) {
	this.userguide_fileorg = userguide_fileorg;
}


public String getUserguide_passwd() {
	return userguide_passwd;
}

public void setUserguide_passwd(String userguide_passwd) {
	this.userguide_passwd = userguide_passwd;
}
public String getUserguide_content2() {
	return userguide_content2;
}

public void setUserguide_content2(String userguide_content2) {
	this.userguide_content2 = userguide_content2;
}

public String getUserguide_content3() {
	return userguide_content3;
}

public void setUserguide_content3(String userguide_content3) {
	this.userguide_content3 = userguide_content3;
}


}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	