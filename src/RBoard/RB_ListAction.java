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
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<RB_VO> list = new ArrayList<RB_VO>();
	
	private String searchKeyword;	//�˻� Ű����
	private int searchNum;	
	
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private RB_PagingAction page; 	// ����¡ Ŭ����
		//�˻���ȣ : 0-����, 1-����
	
	private int num = 0;
	
	public RB_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
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
				
			totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
				// pagingAction ��ü ����.
				page = new RB_PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", mentor_no);
				pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.

				// ���� ���������� ������ ������ ���� ��ȣ ����.
				int lastCount = totalCount;

				// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
				//lastCount�� +1 ��ȣ�� ����.
				if (page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;

				// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
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