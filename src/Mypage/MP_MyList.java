package Mypage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import org.apache.catalina.Session;

import java.io.Reader;
import java.io.IOException;

import RBoard.RB_PagingAction;
import RComment.RC_PagingAction;

import RBoard.RB_VO;
import RComment.RC_VO;
import CBoard.CB_VO;
import CComment.CC_VO;

public class MP_MyList extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List list = new ArrayList();
	
	RB_VO rb_vo = new RB_VO();
	RC_VO rc_vo = new RC_VO();
	
	CB_VO cb_vo = new CB_VO();
	CC_VO cc_vo = new CC_VO();
	
	Map<String,Object> session;
	Map<String,Object> map;
	
	int totalCount;
	
	private String rcomment_passwd;			//���������� ������������ �ӽ÷� passwd �÷��� �������� 
											//���� ������ �����ϱ����� �̸��� �Ȱ��� passwd���� ����(getRcomment_passwd()�� ��������..)
	private int member_no;
	private String searchKeyword = "";
	private int searchNum;
	
	private int currentPage = 1;	//���� ������
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	
	private String pagingHtml; 	//����¡�� ������ HTML
	
	private MP_PagingAction page; 	// ����¡ Ŭ����
	private int startCount;
	private int endCount;

	
	public MP_MyList() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		if(getSearchKeyword() != ""){
			return search();
		}
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		//-----------------------------------------------------------------------//
		//�ı�Խ��� �� �ҷ�����
		rb_vo.setMember_no((Integer)session.get("member_no"));
		list = sqlMapper.queryForList("SelectAllMyList", rb_vo);
		totalCount = list.size();
		System.out.println("totalCount : "+totalCount);
		
		// pagingAction ��ü ����.
		page = new MP_PagingAction(currentPage, totalCount, blockCount, blockPage); 
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
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		if(getSearchNum() == 0){
			map = new HashMap();
			map.put("member_no", (Integer)session.get("member_no"));
			map.put("searchKeyword", "%" +getSearchKeyword()+ "%");
			
			list = sqlMapper.queryForList("SelectMyListSubject", map);
			totalCount = list.size();
			
			//
			page = new MP_PagingAction(currentPage, totalCount, blockCount, blockPage); 
			pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.
			
			// ���� ���������� ������ ������ ���� ��ȣ ����.
			int lastCount = totalCount;

			// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
			//lastCount�� +1 ��ȣ�� ����.
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
			list = list.subList(page.getStartCount(), lastCount);
			
		}else if(getSearchNum() == 1){
			map = new HashMap();
			map.put("member_no", (Integer)session.get("member_no"));
			map.put("searchKeyword", "%" +getSearchKeyword()+ "%");
			
			list = sqlMapper.queryForList("SelectMyListContent", map);
			totalCount = list.size();

			//
			page = new MP_PagingAction(currentPage, totalCount, blockCount, blockPage); 
			pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.
			
			// ���� ���������� ������ ������ ���� ��ȣ ����.
			int lastCount = totalCount;

			// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
			//lastCount�� +1 ��ȣ�� ����.
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
			list = list.subList(page.getStartCount(), lastCount);
			
		}
		
		return SUCCESS;
	
	}
	
	public String execute2() throws Exception{
		
		if(getSearchKeyword() != ""){
			return search2();
		}
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		rc_vo.setMember_no((Integer)session.get("member_no"));
		list = sqlMapper.queryForList("cSelectAllMyList", rc_vo);
		totalCount = list.size();
		
		System.out.println("totalCount : "+totalCount);
		System.out.println("rboard_subject : " + getRcomment_passwd());
		
		// pagingAction ��ü ����.
		page = new MP_PagingAction(currentPage, totalCount, blockCount, blockPage); 
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
	
	public String search2() throws Exception{
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		if(getSearchNum() == 0){
			map = new HashMap();
			map.put("member_no", (Integer)session.get("member_no"));
			map.put("searchKeyword", "%" +getSearchKeyword()+ "%");
			
			list = sqlMapper.queryForList("cSelectMyListSubject", map);
			totalCount = list.size();
			
			//
			page = new MP_PagingAction(currentPage, totalCount, blockCount, blockPage); 
			pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.
			
			// ���� ���������� ������ ������ ���� ��ȣ ����.
			int lastCount = totalCount;

			// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
			//lastCount�� +1 ��ȣ�� ����.
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
			list = list.subList(page.getStartCount(), lastCount);
			
		}else if(getSearchNum() == 1){
			map = new HashMap();
			map.put("member_no", (Integer)session.get("member_no"));
			map.put("searchKeyword", "%" +getSearchKeyword()+ "%");
			
			list = sqlMapper.queryForList("cSelectMyListContent", map);
			totalCount = list.size();

			//
			page = new MP_PagingAction(currentPage, totalCount, blockCount, blockPage); 
			pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.
			
			// ���� ���������� ������ ������ ���� ��ȣ ����.
			int lastCount = totalCount;

			// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
			//lastCount�� +1 ��ȣ�� ����.
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
			list = list.subList(page.getStartCount(), lastCount);
			
		}
		
		return SUCCESS;
	}




	public RB_VO getRb_vo() {
		return rb_vo;
	}

	public void setRb_vo(RB_VO rb_vo) {
		this.rb_vo = rb_vo;
	}



	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
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

	public CB_VO getCb_vo() {
		return cb_vo;
	}

	public void setCb_vo(CB_VO cb_vo) {
		this.cb_vo = cb_vo;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public RC_VO getRc_vo() {
		return rc_vo;
	}

	public void setRc_vo(RC_VO rc_vo) {
		this.rc_vo = rc_vo;
	}
	
	public CC_VO getCc_vo() {
		return cc_vo;
	}

	public void setCc_vo(CC_VO cc_vo) {
		this.cc_vo = cc_vo;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public MP_PagingAction getPage() {
		return page;
	}

	public void setPage(MP_PagingAction page) {
		this.page = page;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public String getRcomment_passwd() {
		return rcomment_passwd;
	}

	public void setRcomment_passwd(String rcomment_passwd) {
		this.rcomment_passwd = rcomment_passwd;
	}


}
