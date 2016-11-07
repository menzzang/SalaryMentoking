package Mentor;

import com.opensymphony.xwork2.ActionSupport;

import Member.Mem_VO;
import Mentor.MTor_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class MTor_WriteAction extends ActionSupport  {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	private MTor_VO mtor_paramClass;
	private MTor_VO mtor_resultClass;
	private Mem_VO mem_paramClass;
	private Mem_VO mem_resultClass;
	
	private int mentor_no;
	private int member_no;
	private String mentor_intro;
	private String mentor_university;
	private String mentor_carrer;
	private String mentor_passwd;
	private String mentor_job;
	private String mentor_etc;
	private String mentor_image;
	private String mentor_imagesav;
	Calendar today = Calendar.getInstance();
	
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_email;
	private String member_email1;
	private String member_phone2;
	private String member_phone3;
	private String member_zipcode;
	private String member_address;
	private String member_address1;
	private Date member_regdate;
	private String member_birthdate;
	private String member_sex;
	private int member_index;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\Java\\upload";
	Map<String,Object> session;
	
	public MTor_WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		mem_resultClass= new Mem_VO();
		mem_resultClass = (Mem_VO) sqlMapper.queryForObject("memberNoForMTor");
		System.out.println(mem_resultClass.getMember_no());
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		mtor_paramClass=new MTor_VO();
		mtor_resultClass=new MTor_VO();

		/*ActionContext context = ActionContext.getContext();
		session = context.getSession();
		mtor_paramClass.setMember_no((Integer)session.get("member_no"));*/
		System.out.println(getMember_no());
		mtor_paramClass.setMember_no(getMember_no());
		mtor_paramClass.setMentor_intro(getMentor_intro());
		mtor_paramClass.setMentor_university(getMentor_university());
		mtor_paramClass.setMentor_carrer(getMentor_carrer());
		mtor_paramClass.setMentor_etc(getMentor_etc());
		mtor_paramClass.setMentor_job(getMentor_job());
		mtor_paramClass.setMentor_passwd(getMentor_passwd());
		//paramClass.setMentor_imagesav(getMentor_imagesav());
		
		sqlMapper.insert("mentorInsert", mtor_paramClass);

		// 첨부파일을 선택했다면 파일을 업로드한다.
		if (getUpload() != null) {
			mtor_resultClass = (MTor_VO) sqlMapper.queryForObject("mentorSelectLastNo");			
			String file_name = "file_" + mtor_resultClass.getMentor_no();
			System.out.println(getMentor_no());
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			File destFile = new File(fileUploadPath + file_name + "."
					+ file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			mtor_paramClass.setMentor_no(mtor_resultClass.getMentor_no());
			System.out.println(getMentor_no());
			mtor_paramClass.setMentor_image(getUploadFileName());	
			mtor_paramClass.setMentor_imagesav(file_name + "." + file_ext);

			sqlMapper.update("mentorUpdateFile", mtor_paramClass);
		}
		return SUCCESS;
	}
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		MTor_WriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MTor_WriteAction.sqlMapper = sqlMapper;
	}

	public MTor_VO getMtor_paramClass() {
		return mtor_paramClass;
	}

	public void setMtor_paramClass(MTor_VO mtor_paramClass) {
		this.mtor_paramClass = mtor_paramClass;
	}

	public MTor_VO getMtor_resultClass() {
		return mtor_resultClass;
	}

	public void setMtor_resultClass(MTor_VO mtor_resultClass) {
		this.mtor_resultClass = mtor_resultClass;
	}

	public Mem_VO getMem_paramClass() {
		return mem_paramClass;
	}

	public void setMem_paramClass(Mem_VO mem_paramClass) {
		this.mem_paramClass = mem_paramClass;
	}

	public Mem_VO getMem_resultClass() {
		return mem_resultClass;
	}

	public void setMem_resultClass(Mem_VO mem_resultClass) {
		this.mem_resultClass = mem_resultClass;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
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
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMentor_intro() {
		return mentor_intro;
	}
	public void setMentor_intro(String mentor_intro) {
		this.mentor_intro = mentor_intro;
	}
	public String getMentor_university() {
		return mentor_university;
	}
	public void setMentor_university(String mentor_university) {
		this.mentor_university = mentor_university;
	}
	public String getMentor_carrer() {
		return mentor_carrer;
	}
	public void setMentor_carrer(String mentor_carrer) {
		this.mentor_carrer = mentor_carrer;
	}
	public String getMentor_job() {
		return mentor_job;
	}
	public void setMentor_job(String mentor_job) {
		this.mentor_job = mentor_job;
	}
	public String getMentor_etc() {
		return mentor_etc;
	}
	public void setMentor_etc(String mentor_etc) {
		this.mentor_etc = mentor_etc;
	}
	public String getMentor_image() {
		return mentor_image;
	}
	public void setMentor_image(String mentor_image) {
		this.mentor_image = mentor_image;
	}
	public String getMentor_imagesav() {
		return mentor_imagesav;
	}
	public void setMentor_imagesav(String mentor_imagesav) {
		this.mentor_imagesav = mentor_imagesav;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	
	public String getMentor_passwd() {
		return mentor_passwd;
	}

	public void setMentor_passwd(String mentor_passwd) {
		this.mentor_passwd = mentor_passwd;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_email1() {
		return member_email1;
	}

	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}

	public String getMember_phone2() {
		return member_phone2;
	}

	public void setMember_phone2(String member_phone2) {
		this.member_phone2 = member_phone2;
	}

	public String getMember_phone3() {
		return member_phone3;
	}

	public void setMember_phone3(String member_phone3) {
		this.member_phone3 = member_phone3;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	public String getMember_birthdate() {
		return member_birthdate;
	}

	public void setMember_birthdate(String member_birthdate) {
		this.member_birthdate = member_birthdate;
	}

	public String getMember_sex() {
		return member_sex;
	}

	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}

	public int getMember_index() {
		return member_index;
	}

	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
}
