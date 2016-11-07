package UserGuide;

import com.opensymphony.xwork2.ActionSupport;

import UserGuide.UG_VO;



import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class UG_WriteAction extends ActionSupport {

	public static Reader reader; //���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private UG_VO paramClass; //�Ķ���͸� ������ ��ü
	

	private UG_VO resultClass; //���� ��� ���� ������ ��ü

	private int currentPage; //���� ������


	Calendar today = Calendar.getInstance(); //���� ��¥ ���ϱ�.
	
	private String userguide_passwd;
	


	private String userguide_content;
	

	private String userguide_content2;
	private String userguide_content3;
	private String userguide_fileorg; //���ε� ������ ���� �̸�
	private String userguide_filesav; //������ ������ ���ε� ������ �̸�. ���� ��ȣ�� �����Ѵ�.
	private int userguide_no;




	private List<File> upload = new ArrayList<File>();
	private List<String> uploadContentType = new ArrayList<String>(); // ������ Ÿ��
	private List<String> uploadFileName = new ArrayList<String>(); // ���� �̸�
	private String fileUploadPath = "C:\\java\\workspace\\new\\WebContent\\Img\\";
	private int index;



	public UG_WriteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); 
		reader.close();
	}

	public String form() throws Exception {

		return SUCCESS;
	}

	// �Խ��� WRITE �׼�
	public String execute() throws Exception {

		//�Ķ���Ϳ� ����Ʈ ��ü ����.
		paramClass = new UG_VO();
		resultClass = new UG_VO();


		paramClass.setUserguide_passwd(getUserguide_passwd());
		paramClass.setUserguide_content(getUserguide_content());
		paramClass.setUserguide_content2(getUserguide_content3());
		paramClass.setUserguide_content3(getUserguide_content3());
		paramClass.setUserguide_regdate(today.getTime());

		// ��� ���� ����.
		sqlMapper.insert("userguideInsert", paramClass);
		
		

		// ÷�������� �����ߴٸ� ������ ���ε��Ѵ�.


			resultClass = (UG_VO) sqlMapper.queryForObject("userguideSelectLastNo");
			if (getUpload() != null) {
				for (int i = 0; i < upload.size(); i++) {
					File destFile = new File(fileUploadPath
							+ getUploadFileName().get(i));
					FileUtils.copyFile((getUpload()).get(i), destFile);
				}
				if (upload.size() > 0){
					userguide_filesav = getUploadFileName().get(0) + ",";
					for (int i = 1; i < upload.size(); i++){
						userguide_filesav += getUploadFileName().get(i) + ",";
					}
					index = userguide_filesav.lastIndexOf(',');
					userguide_filesav = userguide_filesav.substring(0, index);
				}
			//���� ���� �Ķ���� ����.
			paramClass.setUserguide_no(resultClass.getUserguide_no());
			paramClass.setUserguide_fileorg(getUserguide_filesav()); // ���� ���� �̸�
			paramClass.setUserguide_filesav(getUserguide_filesav());
			
			
			//���� ���� ������Ʈ.
			sqlMapper.update("userguideUpdate", paramClass);
	/*		System.out.println(paramClass.getUserguide_no());*/
			userguide_no = paramClass.getUserguide_no();
		}

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

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	public String getUserguide_content() {
		return userguide_content;
	}

	public void setUserguide_content(String userguide_content) {
		this.userguide_content = userguide_content;
	}

	public String getUserguide_fileorg() {
		return userguide_fileorg;
	}

	public void setUserguide_fileorg(String userguide_fileorg) {
		this.userguide_fileorg = userguide_fileorg;
	}

	public String getUserguide_filesav() {
		return userguide_filesav;
	}

	public void setUserguide_filesav(String userguide_filesav) {
		this.userguide_filesav = userguide_filesav;
	}



	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	public int getUserguide_no() {
		return userguide_no;
	}

	public void setUserguide_no(int userguide_no) {
		this.userguide_no = userguide_no;
	}
	public String getUserguide_passwd() {
		return userguide_passwd;
	}

	public void setUserguide_passwd(String userguide_passwd) {
		this.userguide_passwd = userguide_passwd;
	}
	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
	public String getUserguide_content2() {
		return userguide_content2;
	}

	public void setUserguide_content2(String userguide_content2) {
		this.userguide_content2 = userguide_content2;
	}

	public String getUserguide_content3() {
		return userguide_content3;
	}

	public void setUserguide_content3(String userguide_content3) {
		this.userguide_content3 = userguide_content3;
	}
}













