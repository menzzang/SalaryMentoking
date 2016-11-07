package Mypage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.Reader;
import java.util.Map;
import java.io.IOException;

import Mentor.MTor_VO;
import Mentor.MTor_ViewAction;

public class MP_MypageAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	Map<String,Object> session;
	
	MTor_VO paramClass = new MTor_VO();
	MTor_VO resultClass = new MTor_VO();
	int mentor_no = 0;
	int member_no;
	int currentPage;
	int result = 0;
	
	public MP_MypageAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}

	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	public String mentorGetNo() throws Exception{
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		if( sqlMapper.queryForObject("SelectMentorNo",(Integer)session.get("member_no")) == null){
			result = -1;
			return ERROR;
		}

		mentor_no = (Integer)sqlMapper.queryForObject("SelectMentorNo",(Integer)session.get("member_no"));
		
		paramClass.setMentor_no(mentor_no);
		
		return mentorView();
	}
	
	public String mentorView() throws Exception {
		// 해당 번호의 글을 가져온다.

		resultClass=(MTor_VO)sqlMapper.queryForObject("mentorSelectOne" , paramClass.getMentor_no());
		currentPage = 1;

		
		return SUCCESS;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getResult() {
		return result;
	}


	public void setResult(int result) {
		this.result = result;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public MTor_VO getParamClass() {
		return paramClass;
	}


	public void setParamClass(MTor_VO paramClass) {
		this.paramClass = paramClass;
	}


	public MTor_VO getResultClass() {
		return resultClass;
	}


	public void setResultClass(MTor_VO resultClass) {
		this.resultClass = resultClass;
	}


	public int getMentor_no() {
		return mentor_no;
	}


	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}

}
