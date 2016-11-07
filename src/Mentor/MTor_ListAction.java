package Mentor;

import com.opensymphony.xwork2.ActionSupport;



import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.io.Reader;
import java.io.IOException;


public class MTor_ListAction extends ActionSupport {
	
	public static Reader reader;	//���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	
	private List<MTor_VO> list = new ArrayList<MTor_VO>();
	Map param = new HashMap();
	

	public Map getParam() {
		return param;
	}

	public void setParam(Map param) {
		this.param = param;
	}
	
	public MTor_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(MTor_VO paramClass) {
		this.paramClass = paramClass;
	}

	private MTor_VO paramClass;
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 9;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private String area1;
	private String address;
	private int member_index;
	Map<String,Object> session;
	private MTor_PagingAction page; 	// ����¡ Ŭ����
	private List equalid;
	private int num = 0;
	public List getEqualid() {
		return equalid;
	}

	public void setEqualid(List equalid) {
		this.equalid = equalid;
	}

	private String[] mentor_intro2;
	


	public MTor_ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
		
	}
	
	public String execute() throws Exception {
		
		paramClass=new MTor_VO();
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		if(session.get("member_no")!=null){
		paramClass.setMember_no((Integer)session.get("member_no"));
		
		
		list = sqlMapper.queryForList("mentorSelectAll");
		equalid = sqlMapper.queryForList("mentorexist" , paramClass);
		
		}
		// ��� ���� ������ list�� �ִ´�.
		else if (session.get("member_no")==null )  {
			//  session���� ������� list�� ����
		list = sqlMapper.queryForList("mentorSelectAll");
		}
		totalCount = list.size(); // ��ü �� ������ ���Ѵ�.
		// pagingAction ��ü ����.
		page = new MTor_PagingAction(currentPage, totalCount, blockCount, blockPage); 
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
		//lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(page.getStartCount(), lastCount);
		
		//substring ���
		mentor_intro2 = new String[list.size()];
		  for(int i = 0; i<list.size(); i++){
		     if(list.get(i).getMentor_intro().length()>=10){
		    	 mentor_intro2[i] = list.get(i).getMentor_intro().substring(0, 10) + "...";
		     }else{
		    	 mentor_intro2[i] = list.get(i).getMentor_intro();   
		     
		     }
     
  		}
		
		return SUCCESS;
	}
	
	//������ ����Ʈ �������� ��
	public String schedule() throws Exception {
		//��� ��.
		
		String are = getArea1();
		String add = getAddress();
		param.put("schedule_addr1", are);
		param.put("schedule_addr2", add);
		
		list = sqlMapper.queryForList("mentorSchedule" , param);
		
		//substring ���
		mentor_intro2 = new String[list.size()];
  for(int i = 0; i<list.size(); i++){
     if(list.get(i).getMentor_intro().length()>=10){
    	 mentor_intro2[i] = list.get(i).getMentor_intro().substring(0, 10) + "...";
     }else{
    	 mentor_intro2[i] = list.get(i).getMentor_intro();   
    	 
     }
     //System.out.println(mentor_intro2[i]);
  }
		return SUCCESS;
	}
	
	public String form() throws Exception {
		//��� ��.
		return SUCCESS;
	}
	
	
	
	public List<MTor_VO> getList() {
		return list;
	}

	public void setList(List<MTor_VO> list) {
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

	public MTor_PagingAction getPage() {
		return page;
	}

	public void setPage(MTor_PagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
	public String[] getMentor_intro2() {
		return mentor_intro2;
	}

	public void setMentor_intro2(String[] mentor_intro2) {
		this.mentor_intro2 = mentor_intro2;
	}
	
	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public int getMember_index() {
		return member_index;
	}

	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	
	
	
}

