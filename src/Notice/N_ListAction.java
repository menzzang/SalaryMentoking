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
	
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<N_VO> list = new ArrayList<N_VO>();

	private List<N_VO> list2 = new ArrayList<N_VO>();
		
	


	private String searchKeyword;	//�˻� Ű����
	private int searchNum;			//�˻���ȣ : 0-����, 1-����

	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private N_PagingAction page; 	// ����¡ Ŭ����


	private int num = 0;
	

	public N_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
		
	}
	
	public String execute() throws Exception {
		
		if(getSearchKeyword() != null){
			return search();
		}
		
		// ��� ���� ������ list�� �ִ´�.
				list = sqlMapper.queryForList("noticeSelectAll");
				list2 = sqlMapper.queryForList("noticeSelectAll2");
			
				
				
				
				totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
				// pagingAction ��ü ����.
				page = new N_PagingAction(currentPage, totalCount, blockCount, blockPage, num, ""); 
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