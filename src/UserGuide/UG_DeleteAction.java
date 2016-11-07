
package UserGuide;


import com.opensymphony.xwork2.ActionSupport;


import UserGuide.UG_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class UG_DeleteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
    

    
	private UG_VO paramClass; 
	private UG_VO resultClass; 

	private int currentPage;	


	private int userguide_no;
	
	private String fileUploadPath = "C:\\java\\workspace\\new\\WebContent\\Img\\";
	
	public UG_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}


	public String execute() throws Exception {
		
		
		paramClass = new UG_VO();
		resultClass = new UG_VO();
		
		resultClass = (UG_VO) sqlMapper.queryForObject("userguideSelectOne", getUserguide_no());

	
	
		File deleteFile = new File(fileUploadPath + resultClass.getUserguide_filesav());
		deleteFile.delete();

		paramClass.setUserguide_no(getUserguide_no());
		
				
		// 삭제 쿼리 수행.
		sqlMapper.update("userguideDelete", paramClass);

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
	public int getUserguide_no() {
		return userguide_no;
	}


	public void setUserguide_no(int userguide_no) {
		this.userguide_no = userguide_no;
	}


	public String getFileUploadPath() {
		return fileUploadPath;
	}


	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	