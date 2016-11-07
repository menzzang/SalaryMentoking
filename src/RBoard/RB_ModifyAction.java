package RBoard;

import com.opensymphony.xwork2.ActionSupport;

import RBoard.RB_VO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class RB_ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RB_ModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RB_ModifyAction.sqlMapper = sqlMapper;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public String getRboard_passwd() {
		return rboard_passwd;
	}

	public void setRboard_passwd(String rboard_passwd) {
		this.rboard_passwd = rboard_passwd;
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

	private RB_VO paramClass; //파라미터를 저장할 객체
	private RB_VO resultClass; //쿼리 결과 값을 저장할 객체
	
	private int currentPage;
	private int rboard_no;
	
	private String rboard_subject;
	private String rboard_passwd;
	private String rboard_content;
	private String rboard_fileorg;
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "C:\\java\\upload\\rboard\\"; //업로드 경로.

	
public RB_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

//게시글 수정
public String execute() throws Exception {
	
	//파라미터와 리절트 객체 생성.
	paramClass=new RB_VO();
	resultClass=new RB_VO();
	
	//수정할 항목 설정.
	paramClass.setRboard_no(getRboard_no());
	paramClass.setRboard_subject(getRboard_subject());
	paramClass.setRboard_passwd(getRboard_passwd());
	paramClass.setRboard_content(getRboard_content());
	
	// 일단 항목만 수정한다.
			sqlMapper.update("rboardUpdate", paramClass);

			// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
			if (getUpload() != null) {
				
				//실제 서버에 저장될 파일 이름과 확장자 설정.
				String file_name = "file_" + getRboard_no();
			    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
				
				//이전 파일 삭제
				File deleteFile = new File(fileUploadPath + getRboard_fileorg());
				deleteFile.delete();
				
				//새 파일 업로드
				File destFile = new File(fileUploadPath + file_name + "." + file_ext);
				FileUtils.copyFile(getUpload(), destFile);
				
				//파일 정보 파라미터 설정.
				paramClass.setRboard_fileorg(getUploadFileName());
				paramClass.setRboard_filesav(file_name + "." + file_ext);
				
				//파일 정보 업데이트.
				sqlMapper.update("rboardUpdateFile", paramClass);
			}

			// 수정이 끝나면 view 페이지로 이동.
			resultClass = (RB_VO) sqlMapper.queryForObject("rboardSelectOne", getRboard_no());

			return SUCCESS;
		}
}

















