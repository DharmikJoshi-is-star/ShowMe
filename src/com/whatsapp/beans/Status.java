package com.whatsapp.beans;

import java.sql.Date;
import java.sql.Time;

public class Status {

	private Integer id;
	
	private Integer user_id;
	
	private String statusPicture;
	
	private Date date;
	
	private Time time;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getStatusPicture() {
		return statusPicture;
	}

	public void setStatusPicture(String statusPicture) {
		this.statusPicture = statusPicture;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}
	
	
}
