package Schedule;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Mentor.MTor_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

 
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import Schedule.S_PagingAction;

import java.net.*;

import Schedule.S_VO;

public class S_ListAction extends ActionSupport {
	
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<S_VO> list = new ArrayList<S_VO>();
	Map<String,Object> session;
	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private S_PagingAction page; 	// 페이징 클래스
	
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		S_ListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		S_ListAction.sqlMapper = sqlMapper;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	
	public S_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(S_VO resultClass) {
		this.resultClass = resultClass;
	}

	
	public MTor_VO getMTorresultClass() {
		return MTorresultClass;
	}

	public void setMTorresultClass(MTor_VO mTorresultClass) {
		MTorresultClass = mTorresultClass;
	}


	private MTor_VO MTorresultClass; 
	private int mentor_no;
	private S_VO resultClass;
	private int num = 0;
	public int getMentor_no() {
		return mentor_no;
	}

	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}

	public S_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
		
	}
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		MTorresultClass = new MTor_VO();
		MTorresultClass = (MTor_VO)sqlMapper.queryForObject("scheduleSelectMentorNo", (Integer)session.get("member_no"));
		
		int mentor_no = getMentor_no();
		list = sqlMapper.queryForList("scheduleSelectAll", getMentor_no());
			
		totalCount = list.size(); // 전체 글 갯수를 구한다.
			// pagingAction 객체 생성.
			page = new S_PagingAction(currentPage, totalCount, blockCount, blockPage, mentor_no); 
			pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

			// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
			int lastCount = totalCount;

			// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
			//lastCount를 +1 번호로 설정.
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
			list = list.subList(page.getStartCount(), lastCount);

			return SUCCESS;
	}

	public List<S_VO> getList() {
		return list;
	}

	public void setList(List<S_VO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public S_PagingAction getPage() {
		return page;
	}

	public void setPage(S_PagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
	

}

