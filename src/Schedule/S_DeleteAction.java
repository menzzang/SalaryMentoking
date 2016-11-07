package Schedule;

import Schedule.S_VO;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

public class S_DeleteAction extends ActionSupport  {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	private int schedule_no;
	
	private S_VO paramClass;
	private S_VO resultClass;

	public S_DeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
		//게시글 글 삭제
		public String execute() throws Exception {
			
			//파라미터와 리절트 객체 생성.
			paramClass = new S_VO();
			resultClass = new S_VO();
			
			//해당 번호의 글을 가져온다.
			resultClass = (S_VO)sqlMapper.queryForObject("scheduleSelectOne", getSchedule_no());

			//삭제할 항목 설정.
			paramClass.setSchedule_no(getSchedule_no());
					
			// 삭제 쿼리 수행.
			sqlMapper.update("scheduleDelete", paramClass);

			return SUCCESS;
			
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			S_DeleteAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			S_DeleteAction.sqlMapper = sqlMapper;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getSchedule_no() {
			return schedule_no;
		}

		public void setSchedule_no(int schedule_no) {
			this.schedule_no = schedule_no;
		}

		public S_VO getParamClass() {
			return paramClass;
		}

		public void setParamClass(S_VO paramClass) {
			this.paramClass = paramClass;
		}

		public S_VO getResultClass() {
			return resultClass;
		}

		public void setResultClass(S_VO resultClass) {
			this.resultClass = resultClass;
		}

	
		
}
