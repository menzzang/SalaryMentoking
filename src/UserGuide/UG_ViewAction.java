package UserGuide;

import com.opensymphony.xwork2.ActionSupport;


import UserGuide.UG_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

public class UG_ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	

	private UG_VO paramClass = new UG_VO(); 
	private UG_VO resultClass = new UG_VO(); 
	private int currentPage;

	public int getUserguide_no() {
		return userguide_no;
	}

	public void setUserguide_no(int userguide_no) {
		this.userguide_no = userguide_no;
	}



	private int userguide_no=1;




	private String userguide_passwd;



	private String fileUploadPath = "C:\\java\\workspace\\new\\WebContent\\Img\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// 생성자
	public UG_ViewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	public String execute() throws Exception {
	
		// 해당 번호의 글을 가져온다.
		resultClass=(UG_VO)sqlMapper.queryForObject("userguideSelectOne" , getUserguide_no());
		//System.out.println(getCboard_no());
		
		return SUCCESS;
		}
		
	// 비밀번호 체크 폼
	public String checkForm() throws Exception {

		return SUCCESS;
	}
	
	// 비밀번호 체크 액션
	public String checkAction() throws Exception {
		
		// 비밀번호 입력값 파라미터 설정.
		paramClass.setUserguide_no(getUserguide_no());
		paramClass.setUserguide_passwd(getUserguide_passwd());
		
		// 현재 글의 비밀번호 가져오기.
		resultClass = (UG_VO) sqlMapper.queryForObject("userguideselectPasswd",
				paramClass);
		
		// 입력한 비밀번호가 틀리면 ERROR 리턴.
		if (resultClass == null)
			return ERROR;

		return SUCCESS;
	}

	// 첨부 파일 다운로드
	public String download() throws Exception {

		// 해당 번호의 파일 정보를 가져온다.
		resultClass = (UG_VO) sqlMapper.queryForObject("userguideSelectOne",  getUserguide_no());

		// 파일 경로와 파일명을 file 객체에 넣는다.
		File fileInfo = new File(fileUploadPath + resultClass.getUserguide_filesav());

		// 다운로드 파일 정보 설정.
		setContentLength(fileInfo.length());
		setContentDisposition("attachment;filename="
				+ URLEncoder.encode(resultClass.getUserguide_fileorg(), "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath
				+ resultClass.getUserguide_filesav()));

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


	public String getFileUploadPath() {
		return fileUploadPath;
	}


	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}


	public InputStream getInputStream() {
		return inputStream;
	}


	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}


	public String getContentDisposition() {
		return contentDisposition;
	}


	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}


	public long getContentLength() {
		return contentLength;
	}


	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}


	public String getUserguide_passwd() {
		return userguide_passwd;
	}



	public void setUserguide_passwd(String userguide_passwd) {
		this.userguide_passwd = userguide_passwd;
	}

	
	}
	

	