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
	
	private String fileUploadPath="C:\\Users\\Yun\\Desktop\\프로젝트\\윤호철\\upload\\";
	private int mentor_no;
	private String mentor_image;
	private String mentor_imagesav;
	
	
	public MTor_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	// 게시글 글 삭제
	public String execute() throws Exception {
		
		//파라미터와 리절트 객체 생성.
		paramClass = new MTor_VO();
		resultClass = new MTor_VO();
		
		// 해당 번호의 글을 가져온다.
		resultClass = (MTor_VO) sqlMapper.queryForObject("mentorSelectOne", getMentor_no());
		
		//서버 파일 삭제
		File deleteFile = new File(fileUploadPath + resultClass.getMentor_imagesav());
		deleteFile.delete();

		// 삭제할 항목 설정.
		paramClass.setMentor_no(getMentor_no());
				
		// 삭제 쿼리 수행.
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
