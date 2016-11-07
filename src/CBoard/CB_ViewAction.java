package CBoard;

import com.opensymphony.xwork2.ActionSupport;

import CBoard.CB_VO;
import CComment.CC_PagingAction;
import CComment.CC_VO;
import Member.Mem_VO;

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

public class CB_ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private CB_VO paramClass = new CB_VO(); //�Ķ���͸� ������ ��ü
	private CB_VO resultClass = new CB_VO(); //���� ��� ���� ������ ��ü
	private List<CC_VO> commentlist = new ArrayList<CC_VO>();
	private CC_PagingAction page; 	// ����¡ Ŭ����	
	private CC_VO ccClass = new CC_VO();
	private CC_VO ccResult = new CC_VO();
	private Mem_VO memClass= new Mem_VO();
	
	private int currentPage = 1;	//���� ������
	private int cc_currentPage = 1;
	private int cboard_no;
	private String cboard_passwd;
	private String fileUploadPath = "C:\\java\\upload\\cboard\\";
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	
	public int getCcomment_no() {
		return ccomment_no;
	}

	public void setCcomment_no(int ccomment_no) {
		this.ccomment_no = ccomment_no;
	}

	public String getCcomment_passwd() {
		return ccomment_passwd;
	}

	public void setCcomment_passwd(String ccomment_passwd) {
		this.ccomment_passwd = ccomment_passwd;
	}

	private int ccomment_no;
	private String ccomment_passwd;

	// ������
		public CB_ViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
			reader.close();
		}
		
		// �󼼺���
		public String execute() throws Exception {
			// �ش� ���� ��ȸ�� +1.
			paramClass.setCboard_no(getCboard_no());
			sqlMapper.update("cboardUpdateReadHit", paramClass);
			
			resultClass=(CB_VO)sqlMapper.queryForObject("cboardSelectOne" , getCboard_no());
			
			int cboard_no = getCboard_no();
			commentlist = sqlMapper.queryForList("ccommentSelectAll", getCboard_no());
			totalCount = commentlist.size(); 
			page = new CC_PagingAction(currentPage, totalCount, blockCount, blockPage, cboard_no);
			pagingHtml = page.getPagingHtml().toString(); 

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			commentlist = commentlist.subList(page.getStartCount(), lastCount);
			
			return SUCCESS;
		}
		
		// ��й�ȣ üũ ��
		public String checkForm() throws Exception {

			return SUCCESS;
		}
		
		// ��й�ȣ üũ �׼�
		public String checkAction() throws Exception {
			
			// ��й�ȣ �Է°� �Ķ���� ����.
			paramClass.setCboard_no(getCboard_no());
			paramClass.setCboard_passwd(getCboard_passwd());
			
			// ���� ���� ��й�ȣ ��������.
			resultClass = (CB_VO) sqlMapper.queryForObject("cboardselectPasswd",
					paramClass);
			
			// �Է��� ��й�ȣ�� Ʋ���� ERROR ����.
			if (resultClass == null)
				return ERROR;

			return SUCCESS;
		}
		
		public String checkAction2() throws Exception{
			
			ccClass.setCcomment_no(getCcomment_no());
			ccClass.setCcomment_passwd(getCcomment_passwd());
			
			ccResult = (CC_VO) sqlMapper.queryForObject("ccommentselectPasswd", ccClass);
			
			if(ccResult == null)
				return ERROR;
			
			return SUCCESS;
		}
			
		// ÷�� ���� �ٿ�ε�
		public String download() throws Exception {
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass=(CB_VO)sqlMapper.queryForObject("cboardSelectOne" , getCboard_no());
			
			// ���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
			File fileInfo = new File(fileUploadPath + resultClass.getCboard_filesav());

			// �ٿ�ε� ���� ���� ����.
			setContentLength(fileInfo.length());
			setContentDisposition("attachment;filename="
					+ URLEncoder.encode(resultClass.getCboard_fileorg(), "UTF-8"));
			setInputStream(new FileInputStream(fileUploadPath
					+ resultClass.getCboard_filesav()));

			return SUCCESS;
		}
			
		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getCboard_no() {
			return cboard_no;
		}

		public void setCboard_no(int cboard_no) {
			this.cboard_no = cboard_no;
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
		
		public String getCboard_passwd() {
			return cboard_passwd;
		}

		public void setCboard_passwd(String cboard_passwd) {
			this.cboard_passwd = cboard_passwd;
		}
		
		public CC_VO getcClass() {
			return ccClass;
		}

		public void setcClass(CC_VO ccClass) {
			this.ccClass = ccClass;
		}

		public CC_VO getcResult() {
			return ccResult;
		}

		public void setcResult(CC_VO ccResult) {
			this.ccResult = ccResult;
		}
		
		public List<CC_VO> getCommentlist() {
			return commentlist;
		}

		public void setCommentlist(List<CC_VO> commentlist) {
			this.commentlist = commentlist;
		}

		public int getCc_currentPage() {
			return cc_currentPage;
		}

		public void setCc_currentPage(int cc_currentPage) {
			this.cc_currentPage = cc_currentPage;
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			CB_ViewAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			CB_ViewAction.sqlMapper = sqlMapper;
		}

		public CC_PagingAction getPage() {
			return page;
		}

		public void setPage(CC_PagingAction page) {
			this.page = page;
		}

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

		public Mem_VO getMemClass() {
			return memClass;
		}

		public void setMemClass(Mem_VO memClass) {
			this.memClass = memClass;
		}
		
		

}