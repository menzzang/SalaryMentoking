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
	
	private IB_VO paramClass; //파라미터를 저장할 객체
	private IB_VO resultClass; //쿼리 결과 값을 저장할 객체
	
	private int currentPage;
	private int iboard_no;
	

	private String iboard_subject;
	private String iboard_passwd;
	private String iboard_content;
	private String iboard_fileorg;
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "C:\\Java\\upload\\iboard\\";

	
public IB_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

//게시글 수정
public String execute() throws Exception {
	
	//파라미터와 리절트 객체 생성.
	paramClass=new IB_VO();
	resultClass=new IB_VO();
	
	//수정할 항목 설정.
	paramClass.setIboard_no(getIboard_no());
	paramClass.setIboard_subject(getIboard_subject());
	paramClass.setIboard_passwd(getIboard_passwd());
	paramClass.setIboard_content(getIboard_content());
	
	// 일단 항목만 수정한다.
			sqlMapper.update("iboardUpdate", paramClass);

			// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
			if (getUpload() != null) {
				
				//실제 서버에 저장될 파일 이름과 확장자 설정.
				String file_name = "file_" + getIboard_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//이전 파일 삭제
				File deleteFile = new File(fileUploadPath + getIboard_fileorg());
				deleteFile.delete();
				
				//새 파일 업로드
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//파일 정보 파라미터 설정.
				paramClass.setIboard_fileorg(getUploadFileName());
				paramClass.setIboard_filesav(file_name + "." + file_ext);
				
				//파일 정보 업데이트.
				sqlMapper.update("iboardUpdateFile", paramClass);
			}

			// 수정이 끝나면 view 페이지로 이동.
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

















