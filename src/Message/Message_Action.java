package Message;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import Message.Message_PagingAction;
import Message.Message_VO;
import Member.Mem_VO;

import java.io.Reader;
import java.io.IOException;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

import org.apache.struts2.interceptor.SessionAware;

public class Message_Action extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String state;
	
	private String message_read;
	private String message_content;
	private int message_no;
	private String[] dellist;
	
	private String[] readIDList;
	private String[] message_con;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 15;
	private int blockPage = 5;
	private String pagingHtml;
	private Message_PagingAction page;
	
	Map param = new HashMap();
	
	private Map session;
	
	private List<Message_VO> list = new ArrayList<Message_VO>();
	
	private Mem_VO paramClass = new Mem_VO();
	private Mem_VO resultClass = new Mem_VO();
	private Message_VO paramClassMsg = new Message_VO();
	private Message_VO resultClassMsg = new Message_VO();
	
	public Message_Action() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	public String list() throws Exception{
		
		String id = (String) session.get("member_id");
		
		param.put("message_send", id);
		param.put("message_read", id);
		
		if(state.equals("send")){
			list = sqlMapper.queryForList("selectSendMessageAll", param);
		}else if(state.equals("read")){
			list = sqlMapper.queryForList("selectReadMessageAll", param);
		}
		
		totalCount = list.size();
		
		page = new Message_PagingAction(currentPage, totalCount, blockCount, blockPage, state);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		message_con = new String[list.size()];
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getMessage_content().length() >= 35){
				message_con[i] = list.get(i).getMessage_content().substring(0, 35) + "...";
			}else{
				message_con[i] = list.get(i).getMessage_content();
			}
		}
		
		return SUCCESS;
		
	}
	
	public String write() throws Exception{
		
		state = getState();
		
		String id = (String)session.get("member_id");
		
		param.put("message_send", id);
		param.put("message_content", getMessage_content());
		
		message_read = getMessage_read().replaceAll("\\s", "");
		
		String regex = ",";
		Pattern pattern = Pattern.compile(regex);
		int cnt = 0;
		
		Matcher matcher = pattern.matcher(message_read);
		
		while(matcher.find()){
			cnt++;
		}
		
		cnt = cnt + 1;
		readIDList = new String[cnt];
		
		for(int i = 1; i < cnt; i++){
			
			readIDList[i] = message_read.substring(message_read.lastIndexOf(',') + 1, message_read.length());
			message_read = message_read.substring(0, message_read.lastIndexOf(','));
		}
		
		readIDList[0] = message_read;
		
		for(int i = 0; i < cnt; i++){
			
			resultClass = null;
			resultClass = (Mem_VO)sqlMapper.queryForObject("searchPassword", readIDList[i]);
			
			if(resultClass == null){
				return ERROR;
			}
		}
		
		for(int i = 0; i < cnt; i++){
			
			param.put("message_read", readIDList[i]);
			
			sqlMapper.insert("insertSend", param);
		}
		return SUCCESS;
		
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getMessage_read() {
		return message_read;
	}

	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String[] getDellist() {
		return dellist;
	}

	public void setDellist(String[] dellist) {
		this.dellist = dellist;
	}

	public String[] getReadIDList() {
		return readIDList;
	}

	public void setReadIDList(String[] readIDList) {
		this.readIDList = readIDList;
	}

	public String[] getMessage_con() {
		return message_con;
	}

	public void setMessage_con(String[] message_con) {
		this.message_con = message_con;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public Message_PagingAction getPage() {
		return page;
	}

	public void setPage(Message_PagingAction page) {
		this.page = page;
	}

	public Map getParam() {
		return param;
	}

	public void setParam(Map param) {
		this.param = param;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public List<Message_VO> getList() {
		return list;
	}

	public void setList(List<Message_VO> list) {
		this.list = list;
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

	public Message_VO getParamClassMsg() {
		return paramClassMsg;
	}

	public void setParamClassMsg(Message_VO paramClassMsg) {
		this.paramClassMsg = paramClassMsg;
	}

	public Message_VO getResultClassMsg() {
		return resultClassMsg;
	}

	public void setResultClassMsg(Message_VO resultClassMsg) {
		this.resultClassMsg = resultClassMsg;
	}

}
