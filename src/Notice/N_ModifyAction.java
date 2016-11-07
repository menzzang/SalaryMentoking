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
	
	private N_VO paramClass; //파라미터를 저장할 객체
	private N_VO resultClass; //쿼리 결과 값을 저장할 객체
	
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
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "C:\\java\\upload\\notice\\"; //업로드 경로.

	
public N_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

//게시글 수정
public String execute() throws Exception {
	
	//파라미터와 리절트 객체 생성.
	paramClass=new N_VO();
	resultClass=new N_VO();
	
	//수정할 항목 설정.
	paramClass.setNotice_no(getNotice_no());
	paramClass.setNotice_subject(getNotice_subject());
	paramClass.setNotice_passwd(getNotice_passwd());
	paramClass.setNotice_content(getNotice_content());
	paramClass.setNotice_hot(getNotice_hot());
	
	
	// 일단 항목만 수정한다.
			sqlMapper.update("noticeUpdate", paramClass);

			// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
			if (getUpload() != null) {
				
				//실제 서버에 저장될 파일 이름과 확장자 설정.
				String file_name = "file_" + getNotice_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//이전 파일 삭제
				File deleteFile = new File(fileUploadPath + getNotice_fileorg());
				deleteFile.delete();
				
				//새 파일 업로드
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//파일 정보 파라미터 설정.
				paramClass.setNotice_fileorg(getUploadFileName());
				paramClass.setNotice_filesav(file_name + "." + file_ext);
				
				//파일 정보 업데이트.
				sqlMapper.update("noticeUpdateFile", paramClass);
			}

			// 수정이 끝나면 view 페이지로 이동.
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

















