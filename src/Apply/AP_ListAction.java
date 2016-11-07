package Apply;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
 
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import Apply.AP_PagingAction;
import Mypage.MP_VO;

import java.net.*;

public class AP_ListAction extends ActionSupport{
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AP_ListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AP_ListAction.sqlMapper = sqlMapper;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	private String member_index;
	public String getmember_index() {
		return member_index;
	}

	public void setmember_index(String member_index) {
		this.member_index = member_index;
	}

	public List<MP_VO> getList() {
		return list;
	}

	public void setList(List<MP_VO> list) {
		this.list = list;
	}
	
	Map<String,Object> session;
	private List<MP_VO> list = new ArrayList<MP_VO>();
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 5;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private AP_PagingAction page; 	// 페이징 클래스
	
	private int num = 0;
	
	public AP_ListAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
	      
				list = sqlMapper.queryForList("menteeApplySelectMypage", (Integer)session.get("member_no"));
				
				totalCount = list.size(); // 전체 글 갯수를 구한다.
				// pagingAction 객체 생성.
				page = new AP_PagingAction(currentPage, totalCount, blockCount, blockPage);
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
	
	/*##$$*/
	@SuppressWarnings("unchecked")
	public String execute2() throws Exception{
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
	      
		
		// 모든 글을 가져와 list에 넣는다.
				list = sqlMapper.queryForList("mentorApplySelectMypage", (Integer)session.get("member_no"));
				
				totalCount = list.size(); // 전체 글 갯수를 구한다.
				// pagingAction 객체 생성.
				page = new AP_PagingAction(currentPage, totalCount, blockCount, blockPage);
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
	
}
