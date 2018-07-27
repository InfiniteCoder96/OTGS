package com.scalar.web.userModelPack;

import java.sql.Date;

public class Inquiry {

		private String user_id;
		private String inq_id;
		private String username;
		private String email;
		private String message;
		private Date inqdate;
		
		public Inquiry(String inq_id, String username, String email, String message) {
		
			this.inq_id = inq_id;
			this.username = username;
			this.email = email;
			this.message = message;
		}

		public Inquiry(String user_id, String inq_id, String username, String email, String message) {
			
			this.user_id = user_id;
			this.inq_id = inq_id;
			this.username = username;
			this.email = email;
			this.message = message;
		}

		public Inquiry(String inq_id, String username, String email, String message, Date inqdate) {
			
			this.inq_id = inq_id;
			this.username = username;
			this.email = email;
			this.message = message;
			this.inqdate = inqdate;
		}

		public Inquiry(String user_id, String inq_id, String username, String email, String message, Date inqdate) {
			
			this.user_id = user_id;
			this.inq_id = inq_id;
			this.username = username;
			this.email = email;
			this.message = message;
			this.inqdate = inqdate;
		}

		public Date getInqdate() {
			return inqdate;
		}

		public void setInqdate(Date inqdate) {
			this.inqdate = inqdate;
		}

		public String getInq_id() {
			return inq_id;
		}

		public void setInq_id(String inq_id) {
			this.inq_id = inq_id;
		}

		public String getUsername() {
			return username;
		}
		
		public void setUsername(String username) {
			this.username = username;
		}
		
		public String getEmail() {
			return email;
		}
		
		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getMessage() {
			return message;
		}
		
		public void setMessage(String message) {
			this.message = message;
		}
		
		public String getUser_id() {
			return user_id;
		}
		
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		
		@Override
		public String toString() {
			return "User [user's name=" +username+", email="+email+",message="+message+",user_id="+user_id+"]" ;
			
		}
}
