package com.whatsapp.beans;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

@Component
public class Message {
	
		private int srno;
		private int sender;
		private String msg;
		private int receiver;
		private boolean view;
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
		public int getSrno() {
			return srno;
		}
		public void setSrno(int srno) {
			this.srno = srno;
		}
		public int getSender() {
			return sender;
		}
		public void setSender(int sender) {
			this.sender = sender;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		public int getReceiver() {
			return receiver;
		}
		public void setReceiver(int receiver) {
			this.receiver = receiver;
		}
		
		public boolean isView() {
			return view;
		}
		public void setView(boolean view) {
			this.view = view;
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
