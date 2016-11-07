package RBoard;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import RBoard.RB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class RB_WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RB_WriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RB_WriteAction.sqlMapper = sqlMapper;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public String getRboard_passwd() {
		return rboard_passwd;
	}

	public void setRboard_passwd(String rboard_passwd) {
		this.rboard_passwd = rboard_passwd;
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

	public String getRboard_filesav() {
		return rboard_filesav;
	}

	public void setRboard_filesav(String rboard_filesav) {
		this.rboard_filesav = rboard_filesav;
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

	public int getMentor_no() {
		return mentor_no;
	}

	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	private int mentor_no;
	Map<String,Object> session;
	private int currentPage;
	private RB_VO paramClass;
	private RB_VO resultClass;

	private String rboard_passwd;
	private int rboard_no;
	private String rboard_subject;
	private String rboard_content;
	private String rboard_fileorg;
	private String rboard_filesav;
	Calendar today = Calendar.getInstance();
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\java\\upload\\rboard\\";
	
	public RB_WriteAction() throws IOException {
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
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
		
		paramClass=new RB_VO();
		resultClass=new RB_VO();
		System.out.println(getMentor_no());
		//등록할 항목 설정.
		paramClass.setRboard_subject(getRboard_subject());
	    paramClass.setMember_no((Integer)session.get("member_no"));
		paramClass.setRboard_passwd(getRboard_passwd());
		paramClass.setRboard_content(getRboard_content());
		paramClass.setRboard_regdate(today.getTime());
		paramClass.setMentor_no(getMentor_no());
		
		
		sqlMapper.insert("rboardInsert", paramClass);
		
		// 첨부파일을 선택했다면 파일을 업로드한다.
		if (getUpload() != null) {
			
			resultClass = (RB_VO) sqlMapper.queryForObject("rboardSelectLastNo");
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + resultClass.getRboard_no();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			//서버에 파일 저장.
			File destFile = new File(fileUploadPath + file_name + "."
					+ file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			//파일 정보 파라미터 설정.
			paramClass.setRboard_no(resultClass.getRboard_no());
			paramClass.setRboard_fileorg(getUploadFileName());		//원래 파일 이름
			paramClass.setRboard_filesav(file_name + "." + file_ext);	//서버에 저장한 파일 이름

			//파일 정보 업데이트.
			sqlMapper.update("rboardUpdateFile", paramClass);
		}
		
		return SUCCESS;

	}
	
	

}