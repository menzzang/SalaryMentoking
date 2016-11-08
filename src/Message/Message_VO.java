package Message;

import java.util.Date;

public class Message_VO {
	
	private int message_no;
	private String message_send;
	private String message_read;
	private Date message_senddate;
	private Date message_readdate;
	private Date message_senddeldate;
	private Date message_readdeldate;
	private String message_content;
	
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getMessage_send() {
		return message_send;
	}
	public void setMessage_send(String message_send) {
		this.message_send = message_send;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
	public Date getMessage_senddate() {
		return message_senddate;
	}
	public void setMessage_senddate(Date message_senddate) {
		this.message_senddate = message_senddate;
	}
	public Date getMessage_readdate() {
		return message_readdate;
	}
	public void setMessage_readdate(Date message_readdate) {
		this.message_readdate = message_readdate;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_senddeldate() {
		return message_senddeldate;
	}
	public void setMessage_senddeldate(Date message_senddeldate) {
		this.message_senddeldate = message_senddeldate;
	}
	public Date getMessage_readdeldate() {
		return message_readdeldate;
	}
	public void setMessage_readdeldate(Date message_readdeldate) {
		this.message_readdeldate = message_readdeldate;
	}

}
