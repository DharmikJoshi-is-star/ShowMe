package com.whatsapp.beans;

import org.springframework.stereotype.Component;

@Component
public class Conversation {
	
	private User user;
	private Group group;
	private Long conversationDealy;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public Long getConversationDealy() {
		return conversationDealy;
	}
	public void setConversationDealy(Long conversationDealy) {
		this.conversationDealy = conversationDealy;
	}
	
	
	
}
