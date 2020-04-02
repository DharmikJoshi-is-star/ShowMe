package com.whatsapp.beans;

import java.io.OutputStream;
import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

@Component
public class Media {
	
	private Integer id;
	private Integer sender;
	private Integer receiver;
	private String type;
	private String filePath;
	private String fileName;
	private String description = "NO DESCRIPTION";
	private String picture;
	private String document;
	private String video;
	private Date date;
	private Time time;
	
	private String dataurl;
	
	public String getDataurl() {
		return dataurl;
	}
	public void setDataurl(String dataurl) {
		this.dataurl = dataurl;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSender() {
		return sender;
	}
	public void setSender(Integer sender) {
		this.sender = sender;
	}
	public Integer getReceiver() {
		return receiver;
	}
	public void setReceiver(Integer receiver) {
		this.receiver = receiver;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
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
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	
	
}
