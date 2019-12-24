package com.whatsapp.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

@Component
public class Login {

	@Pattern(regexp = "\\w+@\\w+.\\w+",message = "invalid username")
	private String username;
	
	@Size(min = 4,max = 30,message = "password should be between 4-30 chars")
	private String password;


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
	
	
}
