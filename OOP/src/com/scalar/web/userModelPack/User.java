package com.scalar.web.userModelPack;

//import com.scalar.web.servicePack.ChatMediator;

public class User {

	private String id;
	private String firstName;
	private String lastName;
	private String emailAddress;
	private String country;
	private String username;
	private String password;

	public User(String id, String firstName, String lastName, String emailAddress, String country, String username) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailAddress = emailAddress;
		this.country = country;
		this.username = username;
	}

	public User(String id, String firstName, String lastName, String emailAddress, String country, String username,
			String password) {

		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailAddress = emailAddress;
		this.country = country;
		this.username = username;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", FirstName=" + firstName + ", LastName=" + lastName + ",Email=" + emailAddress + "]";

	}

	/*protected ChatMediator mediator;
	

	public User(ChatMediator med, String email) {
		this.mediator = med;
		this.emailAddress = email;
	}

	public abstract void send(String msg);

	public abstract void receive(String msg);*/
}
