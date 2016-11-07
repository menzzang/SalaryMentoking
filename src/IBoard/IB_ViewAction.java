package IBoard;

import com.opensymphony.xwork2.ActionSupport;

import IBoard.IB_VO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

public class IB_ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private IB_VO paramClass = new IB_VO(); //�Ķ���͸� ������ ��ü
	private IB_VO resultClass = new IB_VO(); //���� ��� ���� ������ ��ü
	
	private int currentPage;
	private int iboard_no;
	private String iboard_passwd;
	


	

	private String fileUploadPath = "C:\\Java\\upload\\iboard\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// ������
		public IB_ViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
			reader.close();
		}
		
		// �󼼺���
		public String execute() throws Exception {
			// �ش� ���� ��ȸ�� +1.
			paramClass.setIboard_no(getIboard_no());
			sqlMapper.update("iboardUpdateReadHit", paramClass);
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass=(IB_VO)sqlMapper.queryForObject("iboardSelectOne" , getIboard_no());
			//System.out.println(getIBoard_no());
			return SUCCESS;
		}
		
		// ��й�ȣ üũ ��
		public String checkForm() throws Exception {

			return SUCCESS;
		}
		
		// ��й�ȣ üũ �׼�
		public String checkAction() throws Exception {
			
			// ��й�ȣ �Է°� �Ķ���� ����.
			paramClass.setIboard_no(getIboard_no());
			paramClass.setIboard_passwd(getIboard_passwd());
			
			// ���� ���� ��й�ȣ ��������.
			resultClass = (IB_VO) sqlMapper.queryForObject("iboardselectPasswd",
					paramClass);
			
			// �Է��� ��й�ȣ�� Ʋ���� ERROR ����.
			if (resultClass == null)
				return ERROR;

			return SUCCESS;
		}
			
		
		
		
		

		// ÷�� ���� �ٿ�ε�
		public String download() throws Exception {
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass=(IB_VO)sqlMapper.queryForObject("iboardSelectOne" , getIboard_no());
			
			// ���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
			File fileInfo = new File(fileUploadPath + resultClass.getIboard_filesav());

			// �ٿ�ε� ���� ���� ����.
			setContentLength(fileInfo.length());
			setContentDisposition("attachment;filename="
					+ URLEncoder.encode(resultClass.getIboard_fileorg(), "UTF-8"));
			setInputStream(new FileInputStream(fileUploadPath
					+ resultClass.getIboard_filesav()));

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

		public String getIboard_passwd() {
			return iboard_passwd;
		}

		public void setIboard_passwd(String iboard_passwd) {
			this.iboard_passwd = iboard_passwd;
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
			
		
		
	

}