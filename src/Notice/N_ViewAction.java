package Notice;

import com.opensymphony.xwork2.ActionSupport;

import Notice.N_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class N_ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private N_VO paramClass = new N_VO(); //�Ķ���͸� ������ ��ü
	private N_VO resultClass = new N_VO(); //���� ��� ���� ������ ��ü
	
	private int currentPage;
	private int notice_no;
	private String notice_passwd;
	private String notice_hot;
	
	

	public String getNotice_hot() {
		return notice_hot;
	}
	public void setNotice_hot(String notice_hot) {
		this.notice_hot = notice_hot;
	}

	private int ncomment_no;
	private String ncomment_passwd;
	

	private String fileUploadPath = "C:\\java\\upload\\notice\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// ������
		public N_ViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
			reader.close();
		}
		
		// �󼼺���
		public String execute() throws Exception {
			// �ش� ���� ��ȸ�� +1.
			paramClass.setNotice_no(getNotice_no());
			sqlMapper.update("noticeUpdateReadHit", paramClass);
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass=(N_VO)sqlMapper.queryForObject("noticeSelectOne" , getNotice_no());
			
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
			paramClass.setNotice_no(getNotice_no());
			paramClass.setNotice_passwd(getNotice_passwd());
			
			// ���� ���� ��й�ȣ ��������.
			resultClass = (N_VO) sqlMapper.queryForObject("noticeselectPasswd",
					paramClass);
			
			// �Է��� ��й�ȣ�� Ʋ���� ERROR ����.
			if (resultClass == null)
				return ERROR;

			return SUCCESS;
		}

		// ÷�� ���� �ٿ�ε�
		public String download() throws Exception {
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass=(N_VO)sqlMapper.queryForObject("noticeSelectOne" , getNotice_no());
			
			// ���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
			File fileInfo = new File(fileUploadPath + resultClass.getNotice_filesav());

			// �ٿ�ε� ���� ���� ����.
			setContentLength(fileInfo.length());
			setContentDisposition("attachment;filename="
					+ URLEncoder.encode(resultClass.getNotice_fileorg(), "UTF-8"));
			setInputStream(new FileInputStream(fileUploadPath
					+ resultClass.getNotice_filesav()));

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

		public String getNotice_passwd() {
			return notice_passwd;
		}

		public void setNotice_passwd(String notice_passwd) {
			this.notice_passwd = notice_passwd;
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

		public int getNcomment_no() {
			return ncomment_no;
		}

		public void setNcomment_no(int ncomment_no) {
			this.ncomment_no = ncomment_no;
		}

		public String getNcomment_passwd() {
			return ncomment_passwd;
		}

		public void setNcomment_passwd(String ncomment_passwd) {
			this.ncomment_passwd = ncomment_passwd;
		}

}