package Mentor;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class MTor_ModifyAction  extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MTor_VO paramClass; //파라미터를 저장할 객체
	private MTor_VO resultClass; //쿼리 결과 값을 저장할 객체
	
	private int currentPage;
	private int mentor_no;
	
	private String mentor_image;
	private String mentor_imagesav;
	private String mentor_job;
	private String mentor_carrer;
	private String mentor_passwd;
	private String mentor_etc;
	private String mentor_intro;
	private String mentor_university;
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath="C:\\Users\\Yun\\git\\Yun\\WebContent\\image\\";
	
	
	public MTor_ModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	//게시글 수정
	public String execute() throws Exception {
		
		//파라미터와 리절트 객체 생성.
		paramClass=new MTor_VO();
		resultClass=new MTor_VO();
		
		//수정할 항목 설정.
		paramClass.setMentor_no(getMentor_no());
		paramClass.setMentor_image(getMentor_image());
		paramClass.setMentor_imagesav(getMentor_imagesav());
		paramClass.setMentor_job(getMentor_job());
		paramClass.setMentor_carrer(getMentor_carrer());
		paramClass.setMentor_etc(getMentor_etc());
		paramClass.setMentor_intro(getMentor_intro());
		paramClass.setMentor_university(getMentor_university());
		paramClass.setMentor_passwd(getMentor_passwd());
		
		// 일단 항목만 수정한다.
		sqlMapper.update("updateMentor", paramClass);
		
		// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
		if (getUpload() != null) {
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + getMentor_no();
		    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
			
			//이전 파일 삭제
			File deleteFile = new File(fileUploadPath + getMentor_image());
			deleteFile.delete();
			
			//새 파일 업로드
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정.
			paramClass.setMentor_image(getUploadFileName());
			paramClass.setMentor_imagesav(file_name + "." + file_ext);
			
			//파일 정보 업데이트.
			sqlMapper.update("updateFile", paramClass);
		}

		// 수정이 끝나면 view 페이지로 이동.
		resultClass = (MTor_VO) sqlMapper.queryForObject("mentorSelectOne", getMentor_no());

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

	public String getMentor_job() {
		return mentor_job;
	}
	public void setMentor_job(String mentor_job) {
		this.mentor_job = mentor_job;
	}
	public String getMentor_carrer() {
		return mentor_carrer;
	}
	public void setMentor_carrer(String mentor_carrer) {
		this.mentor_carrer = mentor_carrer;
	}
	public String getMentor_etc() {
		return mentor_etc;
	}
	public void setMentor_etc(String mentor_etc) {
		this.mentor_etc = mentor_etc;
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
	
	public String getMentor_intro() {
		return mentor_intro;
	}

	public void setMentor_intro(String mentor_intro) {
		this.mentor_intro = mentor_intro;
	}

	public String getMentor_university() {
		return mentor_university;
	}

	public void setMentor_university(String mentor_university) {
		this.mentor_university = mentor_university;
	}
	
	public String getMentor_passwd() {
		return mentor_passwd;
	}

	public void setMentor_passwd(String mentor_passwd) {
		this.mentor_passwd = mentor_passwd;
	}
	

}


















