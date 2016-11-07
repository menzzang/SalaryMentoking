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
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��
	
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
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 5;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private AP_PagingAction page; 	// ����¡ Ŭ����
	
	private int num = 0;
	
	public AP_ListAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
	      
				list = sqlMapper.queryForList("menteeApplySelectMypage", (Integer)session.get("member_no"));
				
				totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
				// pagingAction ��ü ����.
				page = new AP_PagingAction(currentPage, totalCount, blockCount, blockPage);
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
	
	/*##$$*/
	@SuppressWarnings("unchecked")
	public String execute2() throws Exception{
		
		ActionContext context = ActionContext.getContext();
	      session = context.getSession();
	      
		
		// ��� ���� ������ list�� �ִ´�.
				list = sqlMapper.queryForList("mentorApplySelectMypage", (Integer)session.get("member_no"));
				
				totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
				// pagingAction ��ü ����.
				page = new AP_PagingAction(currentPage, totalCount, blockCount, blockPage);
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
	
}
