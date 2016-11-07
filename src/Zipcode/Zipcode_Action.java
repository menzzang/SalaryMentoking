package Zipcode;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public class Zipcode_Action extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private String dong;
	private List<Zipcode_VO> zipcodeList=new ArrayList<Zipcode_VO>();
	public Zipcode_Action() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception{
		zipcodeList=sqlMapper.queryForList("zipcodeSelect","%"+getDong()+"%");
		return SUCCESS;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public List<Zipcode_VO> getZipcodeList() {
		return zipcodeList;
	}
	public void setZipcodeList(List<Zipcode_VO> zipcodeList) {
		this.zipcodeList = zipcodeList;
	}

}
