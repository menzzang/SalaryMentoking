package Mentor;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;
import Mentor.MTor_VO;



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


public class MTor_ViewAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MTor_VO paramClass=new MTor_VO();
	private MTor_VO resultClass=new MTor_VO();
	

	private int currentPage;
	private int member_index;
	private int mentor_no;
	private String mentor_passwd;
	


	private String fileUploadPath = "C:\\Users\\Yun\\git\\Yun\\WebContent\\image\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	// ������
	public MTor_ViewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	// �󼼺���
			public String execute() throws Exception {
				// �ش� ��ȣ�� ���� �����´�.
				resultClass=(MTor_VO)sqlMapper.queryForObject("mentorSelectOne" , getMentor_no());
				
				return SUCCESS;
			}
			
			// ��й�ȣ üũ ��
			public String checkForm() throws Exception {

				return SUCCESS;
			}
			
			// ��й�ȣ üũ �׼�
			public String checkAction() throws Exception {
				
				// ��й�ȣ �Է°� �Ķ���� ����.
				paramClass.setMentor_no(getMentor_no());
				paramClass.setMentor_passwd(getMentor_passwd());
				
				// ���� ���� ��й�ȣ ��������.
				resultClass = (MTor_VO) sqlMapper.queryForObject("mentorSelectPasswd",
						paramClass);
				
				//mentorSelectOne���� mentor_no��ȣ�� �����;� mentorSelectPasswd�������� 
				//mentor_no��ȣ�� ã�Ƽ� ���� �ִ�.
				
				
				// �Է��� ��й�ȣ�� Ʋ���� ERROR ����.
				if (resultClass == null)
					return ERROR;

				return SUCCESS;
			}
			

			
			


			
			
			public MTor_VO getParamClass() {
				return paramClass;
			}

			public void setParamClass(MTor_VO paramClass) {
				this.paramClass = paramClass;
			}

			public MTor_VO getResultClass() {
				return resultClass;
			}

			public void setResultClass(MTor_VO resultClass) {
				this.resultClass = resultClass;
			}

			public int getCurrentPage() {
				return currentPage;
			}

			public void setCurrentPage(int currentPage) {
				this.currentPage = currentPage;
			}

			public int getMentor_no() {
				return mentor_no;
			}

			public void setMentor_no(int mentor_no) {
				this.mentor_no = mentor_no;
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
			
			public String getMentor_passwd() {
				return mentor_passwd;
			}

			public void setMentor_passwd(String mentor_passwd) {
				this.mentor_passwd = mentor_passwd;
			}
			
			public int getMember_index() {
				return member_index;
			}

			public void setMember_index(int member_index) {
				this.member_index = member_index;
			}
	

}
