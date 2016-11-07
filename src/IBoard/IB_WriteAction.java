package IBoard;

import com.opensymphony.xwork2.ActionSupport;

import IBoard.IB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class IB_WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	private IB_VO paramClass;
	private IB_VO resultClass;
	
	

	private String iboard_passwd;


	private int iboard_no;
	private String iboard_subject;
	
	

	private String iboard_content;
	private String iboard_fileorg;
	private String iboard_filesav;
	Calendar today = Calendar.getInstance();
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\Java\\upload\\iboard\\";
	

	
	public IB_WriteAction() throws IOException {
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
		
		paramClass=new IB_VO();
		resultClass=new IB_VO();
		
		//등록할 항목 설정.
		paramClass.setIboard_subject(getIboard_subject());
		paramClass.setIboard_passwd(getIboard_passwd());
		paramClass.setIboard_content(getIboard_content());
		paramClass.setIboard_regdate(today.getTime());		
		
		
		sqlMapper.insert("iboardInsert", paramClass);
		
		// 첨부파일을 선택했다면 파일을 업로드한다.
		if (getUpload() != null) {
			
			resultClass = (IB_VO) sqlMapper.queryForObject("iboardSelectLastNo");
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + resultClass.getIboard_no();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			//서버에 파일 저장.
			File destFile = new File(fileUploadPath + file_name + "."
					+ file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			//파일 정보 파라미터 설정.
			paramClass.setIboard_no(resultClass.getIboard_no());
			paramClass.setIboard_fileorg(getUploadFileName());		//원래 파일 이름
			paramClass.setIboard_filesav(file_name + "." + file_ext);	//서버에 저장한 파일 이름

			//파일 정보 업데이트.
			sqlMapper.update("iboardUpdateFile", paramClass);
			
			
			
		}
		return SUCCESS;

	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public String getIboard_passwd() {
		return iboard_passwd;
	}

	public void setIboard_passwd(String iboard_passwd) {
		this.iboard_passwd = iboard_passwd;
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

	public String getIboard_filesav() {
		return iboard_filesav;
	}

	public void setIboard_filesav(String iboard_filesav) {
		this.iboard_filesav = iboard_filesav;
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
	
	

}