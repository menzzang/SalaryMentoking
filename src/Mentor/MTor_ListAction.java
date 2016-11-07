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
	
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	
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
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 9;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private String area1;
	private String address;
	private int member_index;
	Map<String,Object> session;
	private MTor_PagingAction page; 	// 페이징 클래스
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
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
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
		// 모든 글을 가져와 list에 넣는다.
		else if (session.get("member_no")==null )  {
			//  session값이 없을경우 list만 실행
		list = sqlMapper.queryForList("mentorSelectAll");
		}
		totalCount = list.size(); // 전체 글 갯수를 구한다.
		// pagingAction 객체 생성.
		page = new MTor_PagingAction(currentPage, totalCount, blockCount, blockPage); 
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
		//lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);
		
		//substring 사용
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
	
	//스케줄 리스트 가져오는 곳
	public String schedule() throws Exception {
		//등록 폼.
		
		String are = getArea1();
		String add = getAddress();
		param.put("schedule_addr1", are);
		param.put("schedule_addr2", add);
		
		list = sqlMapper.queryForList("mentorSchedule" , param);
		
		//substring 사용
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
		//등록 폼.
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

