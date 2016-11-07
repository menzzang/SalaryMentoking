package CBoard;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

import CBoard.CB_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class CB_WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	private CB_VO paramClass;
	private CB_VO resultClass;
	
	private int member_no;
	private String cboard_passwd;
	private int cboard_no;
	private String cboard_subject;
	private String cboard_content;
	private String cboard_fileorg;
	private String cboard_filesav;
	Calendar today = Calendar.getInstance();
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\Users\\Yun\\Desktop\\������Ʈ\\��ȣö\\upload\\";
	
	Map<String,Object> session;

	
	public CB_WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		//��� ��.
		return SUCCESS;
	}
	// struts���� form�޼ҵ带 ã�� �ÿ�..
	
	public String execute() throws Exception {
		
		paramClass=new CB_VO();
		resultClass=new CB_VO();
		
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		
		//����� �׸� ����.
		paramClass.setMember_no((Integer)session.get("member_no"));
		paramClass.setCboard_subject(getCboard_subject());
		paramClass.setCboard_passwd(getCboard_passwd());
		paramClass.setCboard_content(getCboard_content());
		paramClass.setCboard_regdate(today.getTime());		
		
		
		sqlMapper.insert("cboardInsert", paramClass);
		
		// ÷�������� �����ߴٸ� ������ ���ε��Ѵ�.
		if (getUpload() != null) {
			
			resultClass = (CB_VO) sqlMapper.queryForObject("cboardSelectLastNo");
			
			//���� ������ ����� ���� �̸��� Ȯ���� ����.
			String file_name = "file_" + resultClass.getCboard_no();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			//������ ���� ����.
			File destFile = new File(fileUploadPath + file_name + "."
					+ file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			//���� ���� �Ķ���� ����.
			paramClass.setCboard_no(resultClass.getCboard_no());
			paramClass.setCboard_fileorg(getUploadFileName());		//���� ���� �̸�
			paramClass.setCboard_filesav(file_name + "." + file_ext);	//������ ������ ���� �̸�

			//���� ���� ������Ʈ.
			sqlMapper.update("cboardUpdateFile", paramClass);
			
			
			
		}
		return SUCCESS;

	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCboard_no() {
		return cboard_no;
	}

	public void setCboard_no(int cboard_no) {
		this.cboard_no = cboard_no;
	}

	public String getCboard_subject() {
		return cboard_subject;
	}

	public void setCboard_subject(String cboard_subject) {
		this.cboard_subject = cboard_subject;
	}

	public String getCboard_content() {
		return cboard_content;
	}

	public void setCboard_content(String cboard_content) {
		this.cboard_content = cboard_content;
	}

	public String getCboard_fileorg() {
		return cboard_fileorg;
	}

	public void setCboard_fileorg(String cboard_fileorg) {
		this.cboard_fileorg = cboard_fileorg;
	}

	public String getCboard_filesav() {
		return cboard_filesav;
	}

	public void setCboard_filesav(String cboard_filesav) {
		this.cboard_filesav = cboard_filesav;
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
	
	public CB_VO getParamClass() {
		return paramClass;
	}

	public void setParamClass(CB_VO paramClass) {
		this.paramClass = paramClass;
	}

	public CB_VO getResultClass() {
		return resultClass;
	}

	public void setResultClass(CB_VO resultClass) {
		this.resultClass = resultClass;
	}

	public String getCboard_passwd() {
		return cboard_passwd;
	}

	public void setCboard_passwd(String cboard_passwd) {
		this.cboard_passwd = cboard_passwd;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

}