package RBoard;

import com.opensymphony.xwork2.ActionSupport;

import RComment.RC_PagingAction;
import RBoard.RB_VO;
import RComment.RC_VO;

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

public class RB_ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	


	private int rcomment_no;
	private String rcomment_passwd;
	
	private List<RC_VO> commentlist = new ArrayList<RC_VO>();
	private RC_VO rcClass = new RC_VO();
	private RC_VO rcResult = new RC_VO();
	private RC_PagingAction page; 	// 페이징 클래스
	
	public RC_PagingAction getPage() {
		return page;
	}

	public void setPage(RC_PagingAction page) {
		this.page = page;
	}

	private RB_VO paramClass = new RB_VO(); //파라미터를 저장할 객체
	private RB_VO resultClass = new RB_VO(); //쿼리 결과 값을 저장할 객체
	
	private int currentPage;
	private int mentor_no;
	private int rboard_no;
	private String rboard_passwd;
	
	private String fileUploadPath = "C:\\java\\upload\\rboard\\";
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	
	

	// 생성자
		public RB_ViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}
		
		// 상세보기
		public String execute() throws Exception {
			paramClass.setMentor_no(getMentor_no());
			paramClass.setRboard_no(getRboard_no());
			sqlMapper.update("rboardUpdateReadHit", paramClass);
			
			resultClass=(RB_VO)sqlMapper.queryForObject("rboardSelectOne" , getRboard_no());
			
			int rboard_no = getRboard_no();
			commentlist = sqlMapper.queryForList("rcommentSelectAll", getRboard_no());
			totalCount = commentlist.size(); 
			page = new RC_PagingAction(currentPage, totalCount, blockCount, blockPage, rboard_no,mentor_no);
			pagingHtml = page.getPagingHtml().toString(); 

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			commentlist = commentlist.subList(page.getStartCount(), lastCount);
			return SUCCESS;
		}
		
		// 비밀번호 체크 폼
		public String checkForm() throws Exception {

			return SUCCESS;
		}
		
		// 비밀번호 체크 액션
		public String checkAction() throws Exception {
			
			// 비밀번호 입력값 파라미터 설정.
			paramClass.setRboard_no(getRboard_no());
			paramClass.setRboard_passwd(getRboard_passwd());
			
			// 현재 글의 비밀번호 가져오기.
			resultClass = (RB_VO) sqlMapper.queryForObject("rboardselectPasswd",
					paramClass);
			
			// 입력한 비밀번호가 틀리면 ERROR 리턴.
			if (resultClass == null)
				return ERROR;

			return SUCCESS;
		}
			
		//비밀번호 체크액션-코멘트
		public String checkAction2() throws Exception{
			
			rcClass.setRcomment_no(getRcomment_no());
			rcClass.setRcomment_passwd(getRcomment_passwd());
			
			rcResult = (RC_VO) sqlMapper.queryForObject("rcommentselectPasswd", rcClass);
			
			if(rcResult == null)
				return ERROR;
			
			return SUCCESS;
		}
		
		// 첨부 파일 다운로드
		public String download() throws Exception {
			
			// 해당 번호의 글을 가져온다.
			resultClass=(RB_VO)sqlMapper.queryForObject("rboardSelectOne" , getRboard_no());
			
			// 파일 경로와 파일명을 file 객체에 넣는다.
			File fileInfo = new File(fileUploadPath + resultClass.getRboard_filesav());

			// 다운로드 파일 정보 설정.
			setContentLength(fileInfo.length());
			setContentDisposition("attachment;filename="
					+ URLEncoder.encode(resultClass.getRboard_fileorg(), "UTF-8"));
			setInputStream(new FileInputStream(fileUploadPath
					+ resultClass.getRboard_filesav()));

			return SUCCESS;
		}
		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			RB_ViewAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			RB_ViewAction.sqlMapper = sqlMapper;
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

		public int getRboard_no() {
			return rboard_no;
		}

		public void setRboard_no(int rboard_no) {
			this.rboard_no = rboard_no;
		}

		public String getRboard_passwd() {
			return rboard_passwd;
		}

		public void setRboard_passwd(String rboard_passwd) {
			this.rboard_passwd = rboard_passwd;
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
		
		public List<RC_VO> getCommentlist() {
			return commentlist;
		}

		public void setCommentlist(List<RC_VO> commentlist) {
			this.commentlist = commentlist;
		}

		public int getRcomment_no() {
			return rcomment_no;
		}

		public void setRcomment_no(int rcomment_no) {
			this.rcomment_no = rcomment_no;
		}

		public String getRcomment_passwd() {
			return rcomment_passwd;
		}

		public void setRcomment_passwd(String rcomment_passwd) {
			this.rcomment_passwd = rcomment_passwd;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}

		public int getBlockCount() {
			return blockCount;
		}

		public void setBlockCount(int blockCount) {
			this.blockCount = blockCount;
		}

		public int getBlockPage() {
			return blockPage;
		}

		public void setBlockPage(int blockPage) {
			this.blockPage = blockPage;
		}

		public String getPagingHtml() {
			return pagingHtml;
		}

		public void setPagingHtml(String pagingHtml) {
			this.pagingHtml = pagingHtml;
		}

		public int getMentor_no() {
			return mentor_no;
		}

		public void setMentor_no(int mentor_no) {
			this.mentor_no = mentor_no;
		}
		
}