package Main;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.sql.SQLException;
import java.io.IOException;

import IBoard.IB_VO;	//�����Խ��� ��û��Ȳ
import Member.Mem_VO;	//���� ��Ȳ
import RBoard.RB_VO;	//�ı�Խ��� ��Ȳ
import Mentor.MTor_VO;	//������ ��Ȳ
import Notice.N_VO;
import Apply.AP_VO;	//���丵 ��û��Ȳ*/

public class MainAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	public IB_VO iv = new IB_VO();		//�����Խ��� ��Ȳ
	public Mem_VO mv = new Mem_VO();	//���� ��Ȳ
	public RB_VO rv = new RB_VO();		//�ı�Խ��� ��Ȳ
	public MTor_VO tv = new MTor_VO();		//������ ��Ȳ
	public AP_VO av = new AP_VO();		//���丵 ��û��Ȳ

	
	public MainAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws IOException, SQLException{
		
		iv = (IB_VO)sqlMapper.queryForObject("iboardSelectCount");
		mv = (Mem_VO)sqlMapper.queryForObject("mentorSelectCount");
		rv = (RB_VO)sqlMapper.queryForObject("rboardSelectCount");
		tv = (MTor_VO)sqlMapper.queryForObject("mentoringSelectCount");
		av = (AP_VO)sqlMapper.queryForObject("applySelectCount");
		
		return SUCCESS;
	}

	public IB_VO getIv() {
		return iv;
	}

	public void setIv(IB_VO iv) {
		this.iv = iv;
	}

	public Mem_VO getMv() {
		return mv;
	}

	public void setMv(Mem_VO mv) {
		this.mv = mv;
	}

	public RB_VO getRv() {
		return rv;
	}

	public void setRv(RB_VO rv) {
		this.rv = rv;
	}

	public MTor_VO getTv() {
		return tv;
	}

	public void setSv(MTor_VO tv) {
		this.tv = tv;
	}

	public AP_VO getAv() {
		return av;
	}

	public void setAv(AP_VO av) {
		this.av = av;
	}

	public void setTv(MTor_VO tv) {
		this.tv = tv;
	}


}
