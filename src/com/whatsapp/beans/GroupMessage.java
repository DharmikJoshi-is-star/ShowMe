package com.whatsapp.beans;
 
import java.sql.Time;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class GroupMessage {

	private Integer id;
	
	private Integer sender_id;
	private String sender_name;
	private String msg;
	private Date date;
	private Time time;
	
	private String mediaType;
	private String mediaDescription;
	private Integer mediaId;
	
	private String mediaFilePath;
	private String mediaFileName;
	
	private String mediaPicture;
	private String mediaDocument;
	private String mediaVideo;
	

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMediaVideo() {
		return mediaVideo;
	}
	public void setMediaVideo(String mediaVideo) {
		this.mediaVideo = mediaVideo;
	}
	public String getMediaType() {
		return mediaType;
	}
	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}
	public String getMediaDescription() {
		return mediaDescription;
	}
	public void setMediaDescription(String mediaDescription) {
		this.mediaDescription = mediaDescription;
	}
	public Integer getMediaId() {
		return mediaId;
	}
	public void setMediaId(Integer mediaId) {
		this.mediaId = mediaId;
	}
	public String getMediaFilePath() {
		return mediaFilePath;
	}
	public void setMediaFilePath(String mediaFilePath) {
		this.mediaFilePath = mediaFilePath;
	}
	public String getMediaFileName() {
		return mediaFileName;
	}
	public void setMediaFileName(String mediaFileName) {
		this.mediaFileName = mediaFileName;
	}
	public String getMediaPicture() {
		return mediaPicture;
	}
	public void setMediaPicture(String mediaPicture) {
		this.mediaPicture = mediaPicture;
	}
	public String getMediaDocument() {
		return mediaDocument;
	}
	public void setMediaDocument(String mediaDocument) {
		this.mediaDocument = mediaDocument;
	}
	public Integer getSender_id() {
		return sender_id;
	}
	public void setSender_id(Integer sender_id) {
		this.sender_id = sender_id;
	}
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
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
