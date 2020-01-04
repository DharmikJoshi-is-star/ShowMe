package com.whatsapp.beans;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Group {

	
	private Integer group_id;
	
	private Integer admin_id;
	
	private String group_name;
	
	private List<Integer> Members_id;
	
	private String group_msg_table;
	
	private List<GroupMessage> Messages;
	
	private Integer total_members;
	
	private String description;
		
	private Integer view;

	private GroupMessage lastMessage;
	
	private Long conversationDealy;
	
	public Long getConversationDealy() {
		return conversationDealy;
	}

	public void setConversationDealy(Long conversationDealy) {
		this.conversationDealy = conversationDealy;
	}

	public GroupMessage getLastMessage() {
		return lastMessage;
	}

	public void setLastMessage(GroupMessage lastMessage) {
		this.lastMessage = lastMessage;
	}

	public Integer getView() {
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public Integer getTotal_members() {
		return total_members;
	}
	public void setTotal_members(Integer total_members) {
		this.total_members = total_members;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public List<Integer> getMembers_id() {
		return Members_id;
	}
	public void setMembers_id(List<Integer> members_id) {
		Members_id = members_id;
	}

	public List<GroupMessage> getMessages() {
		return Messages;
	}
	public void setMessages(List<GroupMessage> messages) {
		Messages = messages;
	}
	public String getGroup_msg_table() {
		return group_msg_table;
	}
	public void setGroup_msg_table(String group_msg_table) {
		this.group_msg_table = group_msg_table;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
