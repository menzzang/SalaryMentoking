package Notice;

import com.opensymphony.xwork2.ActionSupport;

import Notice.N_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class N_WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	private N_VO paramClass;
	private N_VO resultClass;
	
	

	private String notice_passwd;


	private int notice_no;
	private String notice_subject;
	private String notice_hot;
	
	

	public String getNotice_hot() {
		return notice_hot;
	}
	public void setNotice_hot(String notice_hot) {
		this.notice_hot = notice_hot;
	} String notice_content;
	private String notice_fileorg;
	private String notice_filesav;
	Calendar today = Calendar.getInstance();
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\java\\upload\\notice\\";
	

	
	public N_WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		//등록 폼.
		return SUCCESS;
	}
	// struts에서 form메소드를 찾을 시에..
	
	public String execute() throws Exception {
		
		paramClass=new N_VO();
		resultClass=new N_VO();
		
		//등록할 항목 설정.
		paramClass.setNotice_subject(getNotice_subject());
		paramClass.setNotice_passwd(getNotice_passwd());
		paramClass.setNotice_content(getNotice_content());
		paramClass.setNotice_hot(getNotice_hot());
		paramClass.setNotice_regdate(today.getTime());		
		
		
		sqlMapper.insert("noticeInsert", paramClass);
		
		// 첨부파일을 선택했다면 파일을 업로드한다.
		if (getUpload() != null) {
			
			resultClass = (N_VO) sqlMapper.queryForObject("noticeSelectLastNo");
		
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + resultClass.getNotice_no();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			//서버에 파일 저장.
			File destFile = new File(fileUploadPath + file_name + "."
					+ file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			//파일 정보 파라미터 설정.
			paramClass.setNotice_no(resultClass.getNotice_no());
			paramClass.setNotice_fileorg(getUploadFileName());		//원래 파일 이름
			paramClass.setNotice_filesav(file_name + "." + file_ext);	//서버에 저장한 파일 이름

			//파일 정보 업데이트.
			sqlMapper.update("noticeUpdateFile", paramClass);
			
			
			
		}
		return SUCCESS;

	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public String getNotice_passwd() {
		return notice_passwd;
	}

	public void setNotice_passwd(String notice_passwd) {
		this.notice_passwd = notice_passwd;
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

	public String getNotice_filesav() {
		return notice_filesav;
	}

	public void setNotice_filesav(String notice_filesav) {
		this.notice_filesav = notice_filesav;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
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