package CBoard;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;
import CComment.CC_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class CB_DeleteAction extends ActionSupport  {
	

	public CC_VO getCcClass() {
		return ccClass;
	}

	public void setCcClass(CC_VO ccClass) {
		this.ccClass = ccClass;
	}

	public CC_VO getCcResult() {
		return ccResult;
	}

	public void setCcResult(CC_VO ccResult) {
		this.ccResult = ccResult;
	}

	public int getCcomment_no() {
		return ccomment_no;
	}

	public void setCcomment_no(int ccomment_no) {
		this.ccomment_no = ccomment_no;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CB_DeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CB_DeleteAction.sqlMapper = sqlMapper;
	}

	private CC_VO ccClass = new CC_VO();
	private CC_VO ccResult = new CC_VO();
	private int ccomment_no;
	
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CB_VO paramClass;
	private CB_VO resultClass;
	
	private int currentPage;
	
	private String fileUploadPath="C:\\Users\\Yun\\Desktop\\프로젝트\\윤호철\\upload\\";
	private int cboard_no;
	
	public CB_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	// 게시글 글 삭제
		public String execute() throws Exception {
			
			//파라미터와 리절트 객체 생성.
			paramClass = new CB_VO();
			resultClass = new CB_VO();
			
			// 해당 번호의 글을 가져온다.
			resultClass = (CB_VO) sqlMapper.queryForObject("cboardSelectOne", getCboard_no());

			//서버 파일 삭제
			File deleteFile = new File(fileUploadPath + resultClass.getCboard_filesav());
			deleteFile.delete();

			// 삭제할 항목 설정.
			paramClass.setCboard_no(getCboard_no());
					
			// 삭제 쿼리 수행.
			sqlMapper.update("cboardDelete", paramClass);

			return SUCCESS;
			
		}
		
		public String execute2() throws Exception{
			
			ccClass.setCcomment_no(getCcomment_no());
			
			sqlMapper.update("ccommentDelete", ccClass);
			
			return SUCCESS;
		}

		public CB_VO getParamClass() {
			return paramClass;
		}

		public void setParamClass(CB_VO paramClass) {
			this.paramClass = paramClass;
		}

		public CB_VO getResultClass() {
			return resultClass;
		}

		public void setResultClass(CB_VO resultClass) {
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

		public int getCboard_no() {
			return cboard_no;
		}

		public void setCboard_no(int cboard_no) {
			this.cboard_no = cboard_no;
		}

}
