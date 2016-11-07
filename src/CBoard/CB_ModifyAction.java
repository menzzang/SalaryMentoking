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
	
	private CB_VO paramClass; //파라미터를 저장할 객체
	private CB_VO resultClass; //쿼리 결과 값을 저장할 객체
	
	private int currentPage;
	private int cboard_no;
	
	private String cboard_subject;
	private String cboard_passwd;
	private String cboard_content;
	private String cboard_fileorg;
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "C:\\Users\\Yun\\Desktop\\프로젝트\\윤호철\\upload\\"; //업로드 경로.

	
public CB_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

//게시글 수정
public String execute() throws Exception {
	
	//파라미터와 리절트 객체 생성.
	paramClass=new CB_VO();
	resultClass=new CB_VO();
	
	//수정할 항목 설정.
	paramClass.setCboard_no(getCboard_no());
	paramClass.setCboard_subject(getCboard_subject());
	paramClass.setCboard_passwd(getCboard_passwd());
	paramClass.setCboard_content(getCboard_content());
	
	// 일단 항목만 수정한다.
			sqlMapper.update("cboardUpdate", paramClass);

			// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
			if (getUpload() != null) {
				
				//실제 서버에 저장될 파일 이름과 확장자 설정.
				String file_name = "file_" + getCboard_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//이전 파일 삭제
				File deleteFile = new File(fileUploadPath + getCboard_fileorg());
				deleteFile.delete();
				
				//새 파일 업로드
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//파일 정보 파라미터 설정.
				paramClass.setCboard_fileorg(getUploadFileName());
				paramClass.setCboard_filesav(file_name + "." + file_ext);
				
				//파일 정보 업데이트.
				sqlMapper.update("cboardUpdateFile", paramClass);
			}

			// 수정이 끝나면 view 페이지로 이동.
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

















