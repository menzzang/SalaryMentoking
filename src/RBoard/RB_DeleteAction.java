package RBoard;

import com.opensymphony.xwork2.ActionSupport;

import RBoard.RB_VO;
import RComment.RC_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class RB_DeleteAction extends ActionSupport  {
	

	public RC_VO getRcClass() {
		return rcClass;
	}

	public void setRcClass(RC_VO rcClass) {
		this.rcClass = rcClass;
	}

	public RC_VO getRcResult() {
		return rcResult;
	}

	public void setRcResult(RC_VO rcResult) {
		this.rcResult = rcResult;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RB_DeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RB_DeleteAction.sqlMapper = sqlMapper;
	}

	private RC_VO rcClass = new RC_VO();
	private RC_VO rcResult = new RC_VO();
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RB_VO paramClass;
	private RB_VO resultClass;
	
	private int currentPage;
	
	private String fileUploadPath="C:\\java\\upload\\rboard\\";
	private int rboard_no;
	private int rcomment_no;
	
	public int getRcomment_no() {
		return rcomment_no;
	}

	public void setRcomment_no(int rcomment_no) {
		this.rcomment_no = rcomment_no;
	}

	public RB_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	// 게시글 글 삭제
		public String execute() throws Exception {
			
			//파라미터와 리절트 객체 생성.
			paramClass = new RB_VO();
			resultClass = new RB_VO();
			
			// 해당 번호의 글을 가져온다.
			resultClass = (RB_VO) sqlMapper.queryForObject("rboardSelectOne", getRboard_no());

			//서버 파일 삭제
			File deleteFile = new File(fileUploadPath + resultClass.getRboard_filesav());
			deleteFile.delete();

			// 삭제할 항목 설정.
			paramClass.setRboard_no(getRboard_no());
					
			// 삭제 쿼리 수행.
			sqlMapper.update("rboardDelete", paramClass);

			return SUCCESS;
			
		}
		//코멘트 삭제
		public String execute2() throws Exception{
			
			rcClass.setRcomment_no(getRcomment_no());
			
			sqlMapper.update("rcommentDelete", rcClass);
			
			return SUCCESS;
		}
		

		public RB_VO getParamClass() {
			return paramClass;
		}

		public void setParamClass(RB_VO paramClass) {
			this.paramClass = paramClass;
		}

		public RB_VO getResultClass() {
			return resultClass;
		}

		public void setResultClass(RB_VO resultClass) {
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

		public int getRboard_no() {
			return rboard_no;
		}

		public void setRboard_no(int rboard_no) {
			this.rboard_no = rboard_no;
		}

}
