package IBoard;

import com.opensymphony.xwork2.ActionSupport;

import IBoard.IB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class IB_DeleteAction extends ActionSupport  {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private IB_VO paramClass;
	private IB_VO resultClass;
	
	private int currentPage;
	
	private String fileUploadPath="C:\\java\\upload\\iboard\\";
	private int iboard_no;
	
	public IB_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	// 게시글 글 삭제
		public String execute() throws Exception {
			
			//파라미터와 리절트 객체 생성.
			paramClass = new IB_VO();
			resultClass = new IB_VO();
			
			// 해당 번호의 글을 가져온다.
			resultClass = (IB_VO) sqlMapper.queryForObject("iboardSelectOne", getIboard_no());

			//서버 파일 삭제
			File deleteFile = new File(fileUploadPath + resultClass.getIboard_filesav());
			deleteFile.delete();

			// 삭제할 항목 설정.
			paramClass.setIboard_no(getIboard_no());
					
			// 삭제 쿼리 수행.
			sqlMapper.update("iboardDelete", paramClass);

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

		public String getFileUploadPath() {
			return fileUploadPath;
		}

		public void setFileUploadPath(String fileUploadPath) {
			this.fileUploadPath = fileUploadPath;
		}

		public int getIboard_no() {
			return iboard_no;
		}

		public void setIboard_no(int iboard_no) {
			this.iboard_no = iboard_no;
		}		
}
