package Zipcode;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public class Zipcode_Action1 extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private String si;
	private List<Zipcode_VO> zipcodeList=new ArrayList<Zipcode_VO>();
	public Zipcode_Action1() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception{
		zipcodeList=sqlMapper.queryForList("mentorZipcodeSelect","%"+getSi()+"%");
		//System.out.println(getZipcodeList());
		return SUCCESS;
	}  
	//검색 눌럿을때 목록 뜨게하는 역할

	public List<Zipcode_VO> getZipcodeList() {
		return zipcodeList;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public void setZipcodeList(List<Zipcode_VO> zipcodeList) {
		this.zipcodeList = zipcodeList;
	}

}
