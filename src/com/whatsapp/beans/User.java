package com.whatsapp.beans;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.List;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.websocket.Decoder.BinaryStream;

import org.springframework.stereotype.Component;

import com.whatsapp.beans.Status;

@Component
public class User {

	private int id;
	
	@Size(min = 2,max = 30,message = "name should be between 2-30 chars")
	private String name;
	
	@Pattern(regexp = "\\d+{10}",message = "contact should be of length 10")
	private String contact;
	
	@Size(min = 4,max = 30,message = "name should be between 4-30 chars")
	private String password;
	
	@Pattern(regexp = "\\w+@\\w+.\\w+",message = "email invalid")
	private String email;
	
	private FileInputStream profile_img_set;

	private FileOutputStream profile_img_get;
	
	private String picture_str;
	
	private Integer view;
	
	private List<Status> status;

	private List<Post> posts;
	
	private List<AddContact> contacts;
	

	public List<AddContact> getContacts() {
		return contacts;
	}

	public void setContacts(List<AddContact> contacts) {
		this.contacts = contacts;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	
	}

	public Integer getView() {
		
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	public FileInputStream getProfile_img_set() {
		return profile_img_set;
	}

	public void setProfile_img_set(FileInputStream profile_img_set) {
		this.profile_img_set = profile_img_set;
	}

	public FileOutputStream getProfile_img_get() {
		return profile_img_get;
	}

	public void setProfile_img_get(FileOutputStream profile_img_get) {
		this.profile_img_get = profile_img_get;
	}

	public String getPicture_str() {
		return picture_str;
	}

	public void setPicture_str(String picture_str) {
		this.picture_str = picture_str;
	}

	public List<Status> getStatus() {
		return status;
	}

	public void setStatus(List<Status> status) {
		this.status = status;
	}

	
	
}
