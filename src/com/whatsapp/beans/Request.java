package com.whatsapp.beans;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

@Component
public class Request {

	private Integer id;
	private Integer request_by;
	private Integer request_to;
	private Date date;
	private Time time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRequest_by() {
		return request_by;
	}
	public void setRequest_by(Integer request_by) {
		this.request_by = request_by;
	}
	public Integer getRequest_to() {
		return request_to;
	}
	public void setRequest_to(Integer request_to) {
		this.request_to = request_to;
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
