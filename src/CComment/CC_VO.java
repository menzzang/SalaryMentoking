package CComment;

import java.util.Date;

public class CC_VO {

		public int getCcomment_no() {
			return ccomment_no;
		}
		public void setCcomment_no(int ccomment_no) {
			this.ccomment_no = ccomment_no;
		}
		public int getCboard_no() {
			return cboard_no;
		}
		public void setCboard_no(int cboard_no) {
			this.cboard_no = cboard_no;
		}
		public int getMember_no() {
			return member_no;
		}
		public void setMember_no(int member_no) {
			this.member_no = member_no;
		}
		public String getCcomment_passwd() {
			return ccomment_passwd;
		}
		public void setCcomment_passwd(String ccomment_passwd) {
			this.ccomment_passwd = ccomment_passwd;
		}
		public String getCcomment_content() {
			return ccomment_content;
		}
		public void setCcomment_content(String ccomment_content) {
			this.ccomment_content = ccomment_content;
		}
		public Date getCcomment_regdate() {
			return ccomment_regdate;
		}
		public void setCcomment_regdate(Date ccomment_regdate) {
			this.ccomment_regdate = ccomment_regdate;
		}
		private int ccomment_no;
		private int cboard_no;
		private int member_no;
		private String ccomment_passwd;
		private String ccomment_content;
		private Date ccomment_regdate;
		private int ccomment_index;
		private String member_id;
		public int getCcomment_index() {
			return ccomment_index;
		}
		public void setCcomment_index(int ccomment_index) {
			this.ccomment_index = ccomment_index;
		}
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}

}
