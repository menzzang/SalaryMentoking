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

	// ������
	public UG_ViewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	public String execute() throws Exception {
	
		// �ش� ��ȣ�� ���� �����´�.
		resultClass=(UG_VO)sqlMapper.queryForObject("userguideSelectOne" , getUserguide_no());
		//System.out.println(getCboard_no());
		
		return SUCCESS;
		}
		
	// ��й�ȣ üũ ��
	public String checkForm() throws Exception {

		return SUCCESS;
	}
	
	// ��й�ȣ üũ �׼�
	public String checkAction() throws Exception {
		
		// ��й�ȣ �Է°� �Ķ���� ����.
		paramClass.setUserguide_no(getUserguide_no());
		paramClass.setUserguide_passwd(getUserguide_passwd());
		
		// ���� ���� ��й�ȣ ��������.
		resultClass = (UG_VO) sqlMapper.queryForObject("userguideselectPasswd",
				paramClass);
		
		// �Է��� ��й�ȣ�� Ʋ���� ERROR ����.
		if (resultClass == null)
			return ERROR;

		return SUCCESS;
	}

	// ÷�� ���� �ٿ�ε�
	public String download() throws Exception {

		// �ش� ��ȣ�� ���� ������ �����´�.
		resultClass = (UG_VO) sqlMapper.queryForObject("userguideSelectOne",  getUserguide_no());

		// ���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
		File fileInfo = new File(fileUploadPath + resultClass.getUserguide_filesav());

		// �ٿ�ε� ���� ���� ����.
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
	

	