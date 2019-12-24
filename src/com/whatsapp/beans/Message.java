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
