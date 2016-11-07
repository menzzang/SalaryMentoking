package Member;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class Mem_FindAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private Mem_VO paramClass;
	private Mem_VO resultClass;
	private List<Mem_VO> list = new ArrayList();
	private String member_name;
	private String member_phone;
	private String member_id;
	public Mem_FindAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form() throws Exception{
		return SUCCESS;
	}
	public String execute() throws Exception{
		paramClass=new Mem_VO();
		resultClass=new Mem_VO();
		paramClass.setMember_name(getMember_name());
		paramClass.setMember_phone(getMember_phone());
		list=sqlMapper.queryForList("findId",paramClass);
		return SUCCESS;
	}
	public String findPassword() throws Exception{
		paramClass=new Mem_VO();
		resultClass=new Mem_VO();
		paramClass.setMember_id(getMember_id());
		paramClass.setMember_name(getMember_name());
		paramClass.setMember_phone(getMember_phone());
		resultClass=(Mem_VO)sqlMapper.queryForObject("findPassword",paramClass);
		System.out.println(resultClass);
		if(resultClass != null){
			sqlMapper.update("setPassword1111",paramClass.getMember_id());
		}
		return SUCCESS;
	}
	public Mem_VO getParamClass() {
		return paramClass;
	}
	public void setParamClass(Mem_VO paramClass) {
		this.paramClass = paramClass;
	}
	public Mem_VO getResultClass() {
		return resultClass;
	}
	public void setResultClass(Mem_VO resultClass) {
		this.resultClass = resultClass;
	}
	public List<Mem_VO> getList() {
		return list;
	}
	public void setList(List<Mem_VO> list) {
		this.list = list;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
