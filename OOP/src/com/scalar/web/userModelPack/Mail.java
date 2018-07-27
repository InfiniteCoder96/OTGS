package com.scalar.web.userModelPack;



import java.util.Date;

import javax.mail.Address;

public class Mail {

	private Address sender;
	private Date receive_date;
	private String subject;
	private String Message;
	
	public Mail(Address address, Date date, String subject, String message) {
		
		this.sender = address;
		this.receive_date = date;
		this.subject = subject;
		Message = message;
	}
	
	public Address getSender() {
		return sender;
	}
	public void setSender(Address sender) {
		this.sender = sender;
	}
	public Date getReceiver() {
		return receive_date;
	}
	public void setReceiver(Date receive_date) {
		this.receive_date = receive_date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	
	@Override
	public String toString() {
		return "Mail [sender=" +sender+", Receive Date=" + receive_date + ", subject =" + subject +",Message =" + Message +"]" ;
		
	}
}
