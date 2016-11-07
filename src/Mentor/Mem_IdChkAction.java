package Mentor;

import java.io.Reader;
import java.io.IOException;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import Member.Mem_VO;

public class Mem_IdChkAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private Mem_VO mem_VO;
	private String member_id;
	private int member_chkId;
	public Mem_IdChkAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception{
		mem_VO=(Mem_VO) sqlMapper.queryForObject("memberIdCheck",getMember_id());
		if(mem_VO == null){
			member_chkId=0;
		}else{
			member_chkId=1;
		}
		return SUCCESS;
	}
	public Mem_VO getMem_VO() {
		return mem_VO;
	}
	public void setMemberVO(Mem_VO mem_VO) {
		this.mem_VO = mem_VO;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMember_chkId() {
		return member_chkId;
	}
	public void setMember_chkId(int member_chkId) {
		this.member_chkId = member_chkId;
	}
}
