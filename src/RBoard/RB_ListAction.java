package RBoard;

import com.opensymphony.xwork2.ActionSupport;


import RBoard.RB_PagingAction;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
 
import java.util.*;
import java.io.Reader;
import java.io.IOException;


import java.net.*;

public class RB_ListAction extends ActionSupport {
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RB_ListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RB_ListAction.sqlMapper = sqlMapper;
	}

	public RB_PagingAction getPage() {
		return page;
	}

	public void setPage(RB_PagingAction page) {
		this.page = page;
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
	
	public int getMentor_no() {
		return mentor_no;
	}

	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}

	
	public RB_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(RB_VO resultClass) {
		this.resultClass = resultClass;
	}



	private RB_VO resultClass;


	private int mentor_no;
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<RB_VO> list = new ArrayList<RB_VO>();
	
	private String searchKeyword;	//검색 키워드
	private int searchNum;	
	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private RB_PagingAction page; 	// 페이징 클래스
		//검색번호 : 0-제목, 1-내용
	
	private int num = 0;
	
	public RB_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();	
	}
	
	public String execute() throws Exception {
		resultClass=new RB_VO();
		
		if(getSearchKeyword() != null)
		{
			return search();
		}
		System.out.println(getMentor_no());
		resultClass.setMentor_no(getMentor_no());
	
				list = sqlMapper.queryForList("rboardSelect", resultClass);
				
			totalCount = list.size(); // 전체 글 갯수를 구한다.
				// pagingAction 객체 생성.
				page = new RB_PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", mentor_no);
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
			list = sqlMapper.queryForList("rboardSearchS", "%" +getSearchKeyword()+ "%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("rboardSearchW", "%" +getSearchKeyword()+ "%");
		}
		if(searchNum == 2){
			list = sqlMapper.queryForList("rboardSearchC", "%" +getSearchKeyword()+ "%");
		}
		
		int mentor_no = getMentor_no();
		totalCount = list.size();
		page = new RB_PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword(), mentor_no);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		

		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public List<RB_VO> getList() {
		return list;
	}

	public void setList(List<RB_VO> list) {
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
}