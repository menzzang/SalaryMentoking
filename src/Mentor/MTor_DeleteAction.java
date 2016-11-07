package Mentor;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class MTor_DeleteAction extends ActionSupport {
	
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MTor_VO paramClass;
	private MTor_VO resultClass;
	
	private int currentPage;
	
	private String fileUploadPath="C:\\Users\\Yun\\Desktop\\������Ʈ\\��ȣö\\upload\\";
	private int mentor_no;
	private String mentor_image;
	private String mentor_imagesav;
	
	
	public MTor_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	// �Խñ� �� ����
	public String execute() throws Exception {
		
		//�Ķ���Ϳ� ����Ʈ ��ü ����.
		paramClass = new MTor_VO();
		resultClass = new MTor_VO();
		
		// �ش� ��ȣ�� ���� �����´�.
		resultClass = (MTor_VO) sqlMapper.queryForObject("mentorSelectOne", getMentor_no());
		
		//���� ���� ����
		File deleteFile = new File(fileUploadPath + resultClass.getMentor_imagesav());
		deleteFile.delete();

		// ������ �׸� ����.
		paramClass.setMentor_no(getMentor_no());
				
		// ���� ���� ����.
		sqlMapper.update("mentorDelete", paramClass);

		return SUCCESS;
		
	}
	
	

	public String getMentor_image() {
		return mentor_image;
	}

	public void setMentor_image(String mentor_image) {
		this.mentor_image = mentor_image;
	}

	public String getMentor_imagesav() {
		return mentor_imagesav;
	}

	public void setMentor_imagesav(String mentor_imagesav) {
		this.mentor_imagesav = mentor_imagesav;
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
	
	
}
