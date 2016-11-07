package Apply;

import com.opensymphony.xwork2.ActionSupport;

import Apply.AP_VO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class AP_DeleteAction extends ActionSupport  {
	
	public static Reader reader;
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AP_DeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AP_DeleteAction.sqlMapper = sqlMapper;
	}

	public AP_VO getAPparamClass() {
		return APparamClass;
	}

	public void setAPparamClass(AP_VO aPparamClass) {
		APparamClass = aPparamClass;
	}

	public AP_VO getAPresultClass() {
		return APresultClass;
	}

	public void setAPresultClass(AP_VO aPresultClass) {
		APresultClass = aPresultClass;
	}

	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}


	public static SqlMapClient sqlMapper;
	
	private AP_VO APparamClass;
	private AP_VO APresultClass;
	private int apply_no;
	private int schedule_no;
	
	public AP_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	// 게시글 글 삭제
		public String execute() throws Exception {
			APparamClass = new AP_VO();
			APparamClass.setApply_no(getApply_no());
			sqlMapper.delete("applyDelete", APparamClass);
			sqlMapper.update("subFromScheduleCount", getSchedule_no());
			return SUCCESS;
			
		}
}
