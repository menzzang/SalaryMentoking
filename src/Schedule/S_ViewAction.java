package Schedule;

import Schedule.S_VO;
import Mentor.MTor_VO;
import Member.Mem_VO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.*;

public class S_ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		S_ViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		S_ViewAction.sqlMapper = sqlMapper;
	}

	public S_VO getSparamClass() {
		return SparamClass;
	}

	public void setSparamClass(S_VO sparamClass) {
		SparamClass = sparamClass;
	}

	public S_VO getSresultClass() {
		return SresultClass;
	}

	public void setSresultClass(S_VO sresultClass) {
		SresultClass = sresultClass;
	}

	public S_VO getSv() {
		return sv;
	}

	public void setSv(S_VO sv) {
		this.sv = sv;
	}

	public MTor_VO getMTorresultClass() {
		return MTorresultClass;
	}

	public void setMTorresultClass(MTor_VO mTorresultClass) {
		MTorresultClass = mTorresultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMentor_no() {
		return mentor_no;
	}

	public void setMentor_no(int mentor_no) {
		this.mentor_no = mentor_no;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public Date getSchedule_time() {
		return schedule_time;
	}

	public void setSchedule_time(Date schedule_time) {
		this.schedule_time = schedule_time;
	}

	public String getSchedule_day() {
		return schedule_day;
	}

	public void setSchedule_day(String schedule_day) {
		this.schedule_day = schedule_day;
	}

	public String getSchedule_addr1() {
		return schedule_addr1;
	}

	public void setSchedule_addr1(String schedule_addr1) {
		this.schedule_addr1 = schedule_addr1;
	}

	public String getSchedule_addr2() {
		return schedule_addr2;
	}

	public void setSchedule_addr2(String schedule_addr2) {
		this.schedule_addr2 = schedule_addr2;
	}

	public String getSchedule_addr3() {
		return schedule_addr3;
	}

	public void setSchedule_addr3(String schedule_addr3) {
		this.schedule_addr3 = schedule_addr3;
	}

	public String getSchedule_addr4() {
		return schedule_addr4;
	}

	public void setSchedule_addr4(String schedule_addr4) {
		this.schedule_addr4 = schedule_addr4;
	}

	public String getSchedule_subject() {
		return schedule_subject;
	}

	public void setSchedule_subject(String schedule_subject) {
		this.schedule_subject = schedule_subject;
	}

	public String getSchedule_content() {
		return schedule_content;
	}

	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}

	public String getSchedule_passwd() {
		return schedule_passwd;
	}

	public void setSchedule_passwd(String schedule_passwd) {
		this.schedule_passwd = schedule_passwd;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	private S_VO SparamClass; //파라미터를 저장할 객체
	private S_VO SresultClass; //쿼리 결과 값을 저장할 객체
	private S_VO sv = new S_VO(); //스케쥴 신청 현황
	
	private MTor_VO MTorresultClass;
	public Mem_VO getMemresultClass() {
		return MemresultClass;
	}

	public void setMemresultClass(Mem_VO memresultClass) {
		MemresultClass = memresultClass;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	private Mem_VO MemresultClass;
	
	private int currentPage;
	
	private int mentor_no;
	
	private int schedule_no;
	private Date schedule_time;
	private String schedule_day;
	private String schedule_addr1;
	private String schedule_addr2;
	private String schedule_addr3;
	private String schedule_addr4;
	private String schedule_subject;
	private String schedule_content;
	private String schedule_passwd;
	Map<String,Object> session;
	
	Calendar today = Calendar.getInstance();

	public S_ViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
			reader.close();
		}
		
		// 상세보기
		public String execute() throws Exception {
			
			ActionContext context = ActionContext.getContext();
			session = context.getSession();
			
			MTorresultClass= new MTor_VO();
			MTorresultClass = (MTor_VO) sqlMapper.queryForObject("scheduleSelectMentor", getMentor_no());
			
			//
			MemresultClass = new Mem_VO();
			MemresultClass = (Mem_VO)sqlMapper.queryForObject("scheduleSelectMember", getMentor_no());
			//
			
			SresultClass=(S_VO)sqlMapper.queryForObject("scheduleSelectOne", getSchedule_no());

			return SUCCESS;
		}

		public String checkForm() throws Exception {

			return SUCCESS;
		}
		
		// 비밀번호 체크 액션
		public String checkAction() throws Exception {

			
			SparamClass=new S_VO();
			SresultClass=new S_VO();
			// 비밀번호 입력값 파라미터 설정.
			SparamClass.setSchedule_no(getSchedule_no());
			SparamClass.setSchedule_passwd(getSchedule_passwd());
		
			// 현재 글의 비밀번호 가져오기.
			SresultClass = (S_VO) sqlMapper.queryForObject("scheduleSelectPasswd", SparamClass);
			
			// 입력한 비밀번호가 틀리면 ERROR 리턴.
			if (SresultClass == null)
				return ERROR;

			return SUCCESS;
		}
}