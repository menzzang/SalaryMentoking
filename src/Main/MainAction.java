package Main;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.sql.SQLException;
import java.io.IOException;

import IBoard.IB_VO;	//직무게시판 신청현황
import Member.Mem_VO;	//멘토 현황
import RBoard.RB_VO;	//후기게시판 현황
import Mentor.MTor_VO;	//스케쥴 현황
import Notice.N_VO;
import Apply.AP_VO;	//멘토링 신청현황*/

public class MainAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	public IB_VO iv = new IB_VO();		//직무게시판 현황
	public Mem_VO mv = new Mem_VO();	//멘토 현황
	public RB_VO rv = new RB_VO();		//후기게시판 현황
	public MTor_VO tv = new MTor_VO();		//스케쥴 현황
	public AP_VO av = new AP_VO();		//멘토링 신청현황

	
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
