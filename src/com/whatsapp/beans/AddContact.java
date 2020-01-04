package com.whatsapp.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

@Component
public class AddContact {

	private int user_id;
	
	private int contact_id;
	
	@Size(min = 2,max = 30,message = "name should be between 4-30 chars")
	private String name;
	
	@Pattern(regexp = "\\d+{10}",message = "contact should be of length 10")
	private String contact;
	
	@Pattern(regexp = "\\w+@\\w+.\\w+",message = "invalid username")
	private String email;

	


	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getContact_id() {
		return contact_id;
	}

	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
