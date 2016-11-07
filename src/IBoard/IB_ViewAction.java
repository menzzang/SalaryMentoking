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
	
	private IB_VO paramClass = new IB_VO(); //파라미터를 저장할 객체
	private IB_VO resultClass = new IB_VO(); //쿼리 결과 값을 저장할 객체
	
	private int currentPage;
	private int iboard_no;
	private String iboard_passwd;
	


	

	private String fileUploadPath = "C:\\Java\\upload\\iboard\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// 생성자
		public IB_ViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
			reader.close();
		}
		
		// 상세보기
		public String execute() throws Exception {
			// 해당 글의 조회수 +1.
			paramClass.setIboard_no(getIboard_no());
			sqlMapper.update("iboardUpdateReadHit", paramClass);
			
			// 해당 번호의 글을 가져온다.
			resultClass=(IB_VO)sqlMapper.queryForObject("iboardSelectOne" , getIboard_no());
			//System.out.println(getIBoard_no());
			return SUCCESS;
		}
		
		// 비밀번호 체크 폼
		public String checkForm() throws Exception {

			return SUCCESS;
		}
		
		// 비밀번호 체크 액션
		public String checkAction() throws Exception {
			
			// 비밀번호 입력값 파라미터 설정.
			paramClass.setIboard_no(getIboard_no());
			paramClass.setIboard_passwd(getIboard_passwd());
			
			// 현재 글의 비밀번호 가져오기.
			resultClass = (IB_VO) sqlMapper.queryForObject("iboardselectPasswd",
					paramClass);
			
			// 입력한 비밀번호가 틀리면 ERROR 리턴.
			if (resultClass == null)
				return ERROR;

			return SUCCESS;
		}
			
		
		
		
		

		// 첨부 파일 다운로드
		public String download() throws Exception {
			
			// 해당 번호의 글을 가져온다.
			resultClass=(IB_VO)sqlMapper.queryForObject("iboardSelectOne" , getIboard_no());
			
			// 파일 경로와 파일명을 file 객체에 넣는다.
			File fileInfo = new File(fileUploadPath + resultClass.getIboard_filesav());

			// 다운로드 파일 정보 설정.
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