package IBoard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
 
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import IBoard.IB_PagingAction;
import IBoard.IB_PagingAction;

import java.net.*;

public class IB_ListAction extends ActionSupport {
	
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<IB_VO> list = new ArrayList<IB_VO>();
	
	//�˻�
	private String searchKeyword;
	private int searchNum;

	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private IB_PagingAction page; 	// ����¡ Ŭ����
	
	private int num = 0;
	
	public IB_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
		
	}
	
	public String execute() throws Exception {
		
		
		if(getSearchKeyword() != null){
			return search();
		}
		
		
		// ��� ���� ������ list�� �ִ´�.
				list = sqlMapper.queryForList("iboardSelectAll");
				
				totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
				// pagingAction ��ü ����.
				page = new IB_PagingAction(currentPage, totalCount, blockCount, blockPage, num, ""); 
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
		if(searchNum == 1){
			list = sqlMapper.queryForList("iboardSearchS", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 2){
			list = sqlMapper.queryForList("iboardSearchC", "%"+getSearchKeyword()+"%");
		}
		
		
		totalCount = list.size();
		page = new IB_PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() +1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public List<IB_VO> getList() {
		return list;
	}

	public void setList(List<IB_VO> list) {
		this.list = list;
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

	public IB_PagingAction getPage() {
		return page;
	}

	public void setPage(IB_PagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	

	

}

