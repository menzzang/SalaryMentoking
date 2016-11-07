package Notice;

import com.opensymphony.xwork2.ActionSupport;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
 
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import Notice.N_PagingAction;
import java.net.*;

public class N_ListAction extends ActionSupport {
	
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<N_VO> list = new ArrayList<N_VO>();

	private List<N_VO> list2 = new ArrayList<N_VO>();
		
	


	private String searchKeyword;	//검색 키워드
	private int searchNum;			//검색번호 : 0-제목, 1-내용

	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private N_PagingAction page; 	// 페이징 클래스


	private int num = 0;
	

	public N_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
		
	}
	
	public String execute() throws Exception {
		
		if(getSearchKeyword() != null){
			return search();
		}
		
		// 모든 글을 가져와 list에 넣는다.
				list = sqlMapper.queryForList("noticeSelectAll");
				list2 = sqlMapper.queryForList("noticeSelectAll2");
			
				
				
				
				totalCount = list.size(); // 전체 글 갯수를 구한다.
				// pagingAction 객체 생성.
				page = new N_PagingAction(currentPage, totalCount, blockCount, blockPage, num, ""); 
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
	



	
	
	
	
	public String search() throws Exception{
		
		if(searchNum == 0){
			list = sqlMapper.queryForList("noticeSearchS", "%" +getSearchKeyword()+ "%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("noticeSearchC", "%" +getSearchKeyword()+ "%");
		}
		
		totalCount = list.size();
		page = new N_PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public List<N_VO> getList() {
		return list;
	}

	public void setList(List<N_VO> list) {
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public N_PagingAction getPage() {
		return page;
	}

	public void setPage(N_PagingAction page) {
		this.page = page;
	}
	public List<N_VO> getList2() {
		return list2;
	}

	public void setList2(List<N_VO> list2) {
		this.list2 = list2;
	}
	
}