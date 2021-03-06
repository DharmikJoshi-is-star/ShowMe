
package com.whatsapp.database;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Component;

import com.whatsapp.beans.AddContact;
import com.whatsapp.beans.Comment;
import com.whatsapp.beans.Like;
import com.whatsapp.beans.Login;
import com.whatsapp.beans.Post;
import com.whatsapp.beans.Request;
import com.whatsapp.beans.Status;
import com.whatsapp.beans.TableName;
import com.whatsapp.beans.User;

@Component
public class DB {

	// ctrl+shift+f for format
	// heroku
	// Step 1: Declare all variables
	//localhost:3306
	//password : NDNiqt63194
	//url = node22838-wtfmedia.jelastichosting.nl
private String username = "root";
private String password = "";
private String dbName = "whatsapp";
private String url = "jdbc:mysql://localhost:3306/" + dbName;
private String driver = "com.mysql.jdbc.Driver";
private Connection con;

	private void dbClose() throws SQLException {
		con.close();
	}

	private void dbConnect() throws ClassNotFoundException, SQLException {
		// Step 2: load the driver
		Class.forName(driver);
		// Step 3: Make the connection
		con = DriverManager.getConnection(url, username, password);

	}

	
	//to get all user-contact of given user id
	/*SELECT *
		FROM user
		WHERE id
		IN (
		
		SELECT contact_id
		FROM contact
		WHERE user_id =1
		)
		LIMIT 0 , 30
	 */
	
	
	public Boolean checkCredentials(Login login) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		int count = 0;
		dbConnect();
		String sql = "select user_id from login where username=? AND password=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, login.getUsername());
		pstmt.setString(2, login.getPassword());

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) { // return true if exist
			count = 1;
		}

		if (count == 1)
			return true;

		dbClose();

		return false;
	}

	public void insertUser(User user) throws ClassNotFoundException, SQLException, FileNotFoundException {
		// TODO Auto-generated method stub
		dbConnect();

		File file = new File(user.getPicture_str());
		FileInputStream fis = new FileInputStream(file);

		String sql = "INSERT INTO user ( name , email , contact , password , profile_img ) VALUES ( ? , ? , ? , ? , ? )";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getEmail());
		pstmt.setString(3, user.getContact());
		pstmt.setString(4, user.getPassword());
		pstmt.setBinaryStream(5, fis, (int) file.length());

		pstmt.executeUpdate();
		
		sql = "select id from user where email=? AND password=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getEmail());
		pstmt.setString(2, user.getPassword());

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) { // return true if exist
			user.setId(rst.getInt("id"));
			break;
		}
		
		List<Integer> interest = new ArrayList<Integer>();
		
		for (int i = 0; i < 10; i++) {
			interest.add(i);
		}
		
		user.setUserInterest(interest);
		
		dbClose();

		toInsertUserInterest(user);
		
		insertLogin(user);
	}

	public AddContact getContact(Integer id) throws ClassNotFoundException, SQLException {

		AddContact addcontact = new AddContact();

		dbConnect();

		String sql = "select * from user where id=" + id.toString();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			addcontact.setName(rst.getString("name"));
			addcontact.setEmail(rst.getString("email"));
			addcontact.setContact(rst.getString("contact"));
			break;
		}

		dbClose();
		return addcontact;
	}

	private void insertLogin(User user) throws ClassNotFoundException, SQLException {

		int id = 0;

		dbConnect();

		String sql = "select id from user where email=? AND password=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getEmail());
		pstmt.setString(2, user.getPassword());

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) { // return true if exist
			id = rst.getInt("id");
			break;
		}

		if (id != 0) {
			sql = "INSERT INTO login ( user_id , username , password ) VALUES ( ? , ? ,? )";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());

			pstmt.executeUpdate();
		}

		dbClose();
	}

	public void insertContact(int user_id, AddContact addcontact) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

		int contact_id = getContactId(addcontact);

		if (contact_id != 0) {
			dbConnect();

			String sql = "INSERT INTO contact ( user_id , name , contact , email , contact_id ) VALUES ( ? , ? , ? , ? ,? )";

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			pstmt.setString(2, addcontact.getName());
			pstmt.setString(3, addcontact.getContact());
			pstmt.setString(4, addcontact.getEmail());
			pstmt.setInt(5, contact_id);

			pstmt.executeUpdate();

			addcontact = getContact(user_id);

			sql = "INSERT INTO contact ( user_id , name , contact , email , contact_id ) VALUES ( ? , ? , ? , ? ,? )";
			pstmt.setInt(1, contact_id);
			pstmt.setString(2, addcontact.getName());
			pstmt.setString(3, addcontact.getContact());
			pstmt.setString(4, addcontact.getEmail());
			pstmt.setInt(5, user_id);

			pstmt.executeUpdate();
			dbConnect();
			sql = "select * from chatrelation where (id1=? AND id2=?) OR (id1=? AND id2=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, contact_id);
			pstmt.setInt(3, contact_id);
			pstmt.setInt(4, user_id);

			ResultSet rst = pstmt.executeQuery();
			String tablename = null;

			while (rst.next()) {
				tablename = rst.getString("tablename");
				break;
			}

			if (tablename == null) {
				insertTableName(user_id, contact_id);

				tablename = getTableName(user_id, contact_id);

				DBMessage dbm = new DBMessage();
				dbm.createMessageTable(user_id, contact_id, tablename);
			}

		}

	}

	private int getContactId(AddContact addcontact) throws ClassNotFoundException, SQLException {
		dbConnect();
		int id = 0;
		String sql = "SELECT * FROM user WHERE email = ? AND contact = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, addcontact.getEmail());
		pstmt.setString(2, addcontact.getContact());

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {
			id = rst.getInt("id");
			break;
		}

		return id;

	}

	public int getId(Login login) throws ClassNotFoundException, SQLException {
		int id = 0;
		dbConnect();
		String sql = "select user_id from login where username=? AND password=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, login.getUsername());
		pstmt.setString(2, login.getPassword());

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) { // return true if exist
			id = rst.getInt("user_id");
		}

		dbClose();

		return id;
	}

	public List<AddContact> getAllContacts(Integer id) throws ClassNotFoundException, SQLException {

		List<AddContact> list = new ArrayList<>();
		dbConnect();

		String lastMessage = null;

		String sql = "select * from contact where user_id=" + id.toString();

		PreparedStatement pstmt = con.prepareStatement(sql);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) { // return true if exist

			AddContact addContact = new AddContact();
			addContact.setUser_id(rst.getInt("user_id"));
			addContact.setName(rst.getString("name"));
			addContact.setEmail(rst.getString("email"));
			addContact.setContact(rst.getString("Contact"));
			addContact.setContact_id(rst.getInt("contact_id"));
			list.add(addContact);

		}

		dbClose();
		return list;
	}

	public String getContactName(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException {
		String name = null;
		dbConnect();

		String sql = "select name from contact where user_id=? AND contact_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {
			name = rst.getString("name");
			break;
		}
		dbClose();

		return name;

	}

	private void insertTableName(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "INSERT into chatrelation (id1,id2,tablename) VALUES( ?, ?, ?)";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setString(3, "chat_" + user_id.toString() + "_" + contact_id.toString());

		pstmt.executeUpdate();

	}

	public String getTableName(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException {
		String tablename = null;

		dbConnect();

		String sql = "select tablename from chatrelation where (id1=? AND id2=?) OR (id1=? AND id2=?)";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, contact_id);
		pstmt.setInt(4, user_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {
			tablename = rst.getString("tablename");
			break;
		}

		return tablename;
	}

	//get all the friend of user with necessary information
	public List<User> getAllUserContactsWithNecessary(Integer user_id) throws SQLException, ClassNotFoundException, IOException{
		dbConnect();
		
		List<User> users = new ArrayList<User>();
		String sql = "SELECT * FROM user WHERE id IN ( SELECT contact_id FROM contact WHERE user_id = ? )";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		ResultSet rst = pstmt.executeQuery();
		
		while (rst.next()) {

			User user = new User();
			
			user.setId(rst.getInt("id"));
			user.setName(rst.getString("name"));
			user.setEmail(rst.getString("email"));
			user.setContact(rst.getString("contact"));

			Blob blob = rst.getBlob("profile_img");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			user.setPicture_str(base64Image);
		
			users.add(user);
		}
		
		
		dbClose();
		
		return users;
	}
	
	//get all the friend of user with necessary information & status
		public List<User> getAllUserContactsWithNecessaryStatus(Integer user_id) throws SQLException, ClassNotFoundException, IOException{
			dbConnect();
			
			List<User> users = new ArrayList<User>();
			String sql = "SELECT * FROM user WHERE id IN ( SELECT contact_id FROM contact WHERE user_id = ? )";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			ResultSet rst = pstmt.executeQuery();
			
			while (rst.next()) {

				User user = new User();
				
				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setEmail(rst.getString("email"));
				user.setContact(rst.getString("contact"));

				Blob blob = rst.getBlob("profile_img");

				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				user.setPicture_str(base64Image);
			
				user.setStatus(getStatusByUserId(rst.getInt("id")));
				
				users.add(user);
			}
			
			
			dbClose();
			
			return users;
		}
	
	//using this we will get only necessary information of user
	public User getNeccessaryUserValues(Integer user_id) throws ClassNotFoundException, SQLException, IOException {
		
		dbConnect();

		User user = new User();
		
		String sql = "Select * from user where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		
		ResultSet rst = pstmt.executeQuery();
		
		while (rst.next()) {

			user.setId(rst.getInt("id"));
			user.setName(rst.getString("name"));
			user.setEmail(rst.getString("email"));
			user.setContact(rst.getString("contact"));

			Blob blob = rst.getBlob("profile_img");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			user.setPicture_str(base64Image);
		
		}
		
		dbConnect();
		
		return user;
		
	}
	
	//using this we will get only necessary and status information of user
		public User getNeccessaryStatusUserValues(Integer user_id) throws ClassNotFoundException, SQLException, IOException {
			
			dbConnect();

			User user = new User();
			
			String sql = "Select * from user where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			while (rst.next()) {

				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setEmail(rst.getString("email"));
				user.setContact(rst.getString("contact"));

				Blob blob = rst.getBlob("profile_img");

				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				user.setPicture_str(base64Image);
				
				user.setStatus(getStatusByUserId(user_id));
			
			}
			
			dbConnect();
			
			return user;
			
		}
	
	public User getUser(Integer user_id) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub

		dbConnect();

		User user = new User();
		String sql = "select * from user where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			user.setId(rst.getInt("id"));
			user.setName(rst.getString("name"));
			user.setEmail(rst.getString("email"));
			user.setContact(rst.getString("contact"));

			Blob blob = rst.getBlob("profile_img");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			user.setPicture_str(base64Image);

			user.setPassword(rst.getString("password"));

			user.setStatus(getStatusByUserId(rst.getInt("id")));

			user.setPosts(getAllPostByUser(user_id));

			user.setContacts(getAllContacts(user_id));
			
			user = getInterestOfUsers(user);

		}

		dbClose();
		return user;
	}

	public String getUserName(Integer user_id) throws ClassNotFoundException, SQLException {

		dbConnect();
		String name = "no name";

		String sql = "select * from user where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			name = rst.getString("name");

		}

		dbClose();

		return name;
	}

	
	
	public void updateUser(User user, String image) throws ClassNotFoundException, SQLException, FileNotFoundException {
		// TODO Auto-generated method stub
		dbConnect();

		if (!user.getPicture_str().isEmpty()) {
			File file = new File(user.getPicture_str());
			FileInputStream fis = new FileInputStream(file);
			String sql = "UPDATE user SET name=? , email=? , contact=? , password=? , profile_img=? WHERE id=?";

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getContact());
			pstmt.setString(4, user.getPassword());
			pstmt.setBinaryStream(5, fis, (int) file.length());
			pstmt.setInt(6, user.getId());

			pstmt.executeUpdate();

		} else {
			String sql = "UPDATE user SET name=? , email=? , contact=? , password=? WHERE id=?";

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getContact());
			pstmt.setString(4, user.getPassword());

			pstmt.setInt(5, user.getId());

			pstmt.executeUpdate();

		}

		updateContact(user);
		updateLogin(user);

		dbClose();
	}

	private void updateContact(User user) throws SQLException {
		String sql = "UPDATE contact SET name=? , contact=? , email=? WHERE contact_id=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getContact());
		pstmt.setString(3, user.getEmail());

		pstmt.setInt(4, user.getId());

		pstmt.executeUpdate();

	}

	private void updateLogin(User user) throws SQLException {
		String sql = "UPDATE login SET username=?, password=? WHERE user_id=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getEmail());
		pstmt.setString(2, user.getPassword());
		pstmt.setInt(3, user.getId());

		pstmt.executeUpdate();

	}

	public String getImage(Integer user_id) throws ClassNotFoundException, SQLException, IOException {

		dbConnect();
		String base64Image = null;
		User user = new User();
		String sql = "select * from user where id=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			Blob blob = rst.getBlob("profile_img");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			base64Image = Base64.getEncoder().encodeToString(imageBytes);

		}
		return base64Image;
	}

	public List<User> getAllUsers() throws ClassNotFoundException, SQLException, IOException {

		List<User> users = new ArrayList<User>();

		dbConnect();

		String sql = "SELECT id FROM user";

		PreparedStatement pstmt = con.prepareStatement(sql);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			users.add(getUser(rst.getInt("id")));

		}

		dbClose();

		return users;
	}

	public void addRequest(Integer userId, Integer requestId) throws ClassNotFoundException, SQLException {

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		Time time = new Time(millis);
		dbConnect();

		String sql = "INSERT INTO requesttable (request_by, request_to , date, time ) Values(?,?,?,?)";

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, userId);
		pstmt.setInt(2, requestId);
		pstmt.setDate(3, date);
		pstmt.setTime(4, time);

		pstmt.execute();

		dbClose();

	}

	public List<Request> getAllRequestsByUser(Integer userId) throws ClassNotFoundException, SQLException {

		List<Request> requests = new ArrayList<Request>();

		dbConnect();

		String sql = "SELECT * FROM requesttable where request_by=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, userId);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			Request request = new Request();

			request.setId(rst.getInt("id"));
			request.setRequest_by(rst.getInt("request_by"));
			request.setRequest_to(rst.getInt("request_to"));
			request.setDate(rst.getDate("date"));
			request.setTime(rst.getTime("time"));
			requests.add(request);
		}

		dbClose();
		return requests;
	}

	public List<Request> getAllRequestsTo(Integer userId) throws ClassNotFoundException, SQLException {
		List<Request> requests = new ArrayList<Request>();

		dbConnect();

		String sql = "SELECT * FROM requesttable where request_to=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, userId);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			Request request = new Request();

			request.setId(rst.getInt("id"));
			request.setRequest_by(rst.getInt("request_by"));
			request.setRequest_to(rst.getInt("request_to"));
			request.setDate(rst.getDate("date"));
			request.setTime(rst.getTime("time"));
			requests.add(request);
		}

		dbClose();
		return requests;
	}

	public void addFriend(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException {

		AddContact addcontact = getContact(contact_id);

		dbConnect();

		String sql = "INSERT INTO contact ( user_id , name , contact , email , contact_id ) VALUES ( ? , ? , ? , ? ,? )";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setString(2, addcontact.getName());
		pstmt.setString(3, addcontact.getContact());
		pstmt.setString(4, addcontact.getEmail());
		pstmt.setInt(5, contact_id);

		pstmt.executeUpdate();

		addcontact = getContact(user_id);

		sql = "INSERT INTO contact ( user_id , name , contact , email , contact_id ) VALUES ( ? , ? , ? , ? ,? )";
		pstmt.setInt(1, contact_id);
		pstmt.setString(2, addcontact.getName());
		pstmt.setString(3, addcontact.getContact());
		pstmt.setString(4, addcontact.getEmail());
		pstmt.setInt(5, user_id);

		pstmt.executeUpdate();
		dbConnect();
		sql = "select * from chatrelation where (id1=? AND id2=?) OR (id1=? AND id2=?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, contact_id);
		pstmt.setInt(4, user_id);

		ResultSet rst = pstmt.executeQuery();
		String tablename = null;

		while (rst.next()) {
			tablename = rst.getString("tablename");
			break;
		}

		if (tablename == null) {
			insertTableName(user_id, contact_id);

			tablename = getTableName(user_id, contact_id);

			DBMessage dbm = new DBMessage();
			dbm.createMessageTable(user_id, contact_id, tablename);
		}

	}

	public void removeRequest(Integer userId, Integer contactId) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "DELETE from requesttable where request_by=? AND request_to=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, contactId);
		pstmt.setInt(2, userId);
		pstmt.execute();
		dbClose();

	}

	public void removeFriend(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException {

		DBMessage dbm = new DBMessage();

		dbConnect();

		String sql = "DELETE FROM contact WHERE (user_id=? AND contact_id=?) OR (user_id=? AND contact_id=?)";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, contact_id);
		pstmt.setInt(4, user_id);

		pstmt.execute();

		sql = "SELECT * FROM chatrelation WHERE (id1=? AND id2=?) OR (id1=? AND id2=?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, contact_id);
		pstmt.setInt(4, user_id);

		ResultSet rst = pstmt.executeQuery();

		String tablename = null;
		while (rst.next()) {
			tablename = rst.getString("tablename");
		}

		dbClose();

		if (tablename != null) {
			dbm.removeChatTable(tablename);
		}

		dbConnect();

		sql = "DELETE FROM chatrelation WHERE (id1=? AND id2=?) OR (id1=? AND id2=?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, contact_id);
		pstmt.setInt(4, user_id);

		pstmt.execute();

		dbClose();

	}

	private Status createStatus(Integer user_id, String image) {

		Status status = new Status();
		/*
		 * Calendar calender = new GregorianCalendar();
		 * 
		 * Date date = new Date(calender.get(Calendar.DATE),
		 * calender.get(Calendar.MONTH), calender.get(Calendar.YEAR));
		 * 
		 * Time time = new Time( calender.getTime().getHours(),
		 * calender.getTime().getMinutes() , calender.getTime().getSeconds());
		 */
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		Time time = new Time(millis);

		status.setUser_id(user_id);
		status.setStatusPicture(image);
		status.setDate(date);
		status.setTime(time);

		return status;

	}

	public void InsertStatusByUserId(Integer user_id, String image)
			throws ClassNotFoundException, SQLException, FileNotFoundException {

		dbConnect();

		Status status = createStatus(user_id, image);

		File file = new File(status.getStatusPicture());
		
		FileInputStream fis = new FileInputStream(file);

		System.out.println(fis.toString());
		
		String sql = "INSERT INTO status ( user_id , image , date , time ) VALUES (  ? , ? , ? , ? )";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, status.getUser_id());
		pstmt.setBinaryStream(2, fis, (int) file.length());
		pstmt.setDate(3, status.getDate());
		pstmt.setTime(4, status.getTime());

		pstmt.execute();

		dbClose();
	}

	public List<Status> getStatusByUserId(Integer userId) throws ClassNotFoundException, SQLException, IOException {

		List<Status> statusOfUser = new ArrayList<Status>();

		dbConnect();

		String sql = "SELECT * FROM status WHERE user_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, userId);
		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			Status status = new Status();

			status.setId(rst.getInt("id"));
			status.setUser_id(rst.getInt("user_id"));
			Blob blob = rst.getBlob("image");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			status.setStatusPicture(base64Image);

			status.setDate(rst.getDate("date"));
			status.setTime(rst.getTime("time"));

			statusOfUser.add(status);

		}

		List<Status> updatedStatus = new ArrayList<Status>();

		for (Status status : statusOfUser) {

			long millis = System.currentTimeMillis();
			Date date = new Date(millis);

			Time time = new Time(millis);

			if (status.getDate().getDate() < date.getDate()) {

				deleteStatusByStatusId(status.getId());

			} else {
				updatedStatus.add(status);
			}
		}

		dbClose();

		return updatedStatus;
	}

	public void deleteStatusByStatusId(Integer id) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "DELETE FROM status WHERE id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);

		pstmt.executeUpdate();

		dbClose();

	}

	public void deleteRequest(Integer request_by, Integer request_to) throws ClassNotFoundException, SQLException {

		dbConnect();
		String sql = "DELETE FROM requesttable WHERE request_by=? AND request_to=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, request_by);
		pstmt.setInt(2, request_to);
		pstmt.executeUpdate();
		dbClose();

	}

	public void uploadPost(Integer user_id, Post post)
			throws ClassNotFoundException, SQLException, FileNotFoundException {
		// TODO Auto-generated method stub

		dbConnect();

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		Time time = new Time(millis);
		File file = new File(post.getPost());
		FileInputStream fis = new FileInputStream(file);

		String sql = "INSERT INTO post (user_id, post, caption, date, time)" + " VALUES(?, ?, ?, ?, ?)";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setBinaryStream(2, fis, (int) file.length());
		pstmt.setString(3, post.getCaption());
		pstmt.setDate(4, date);
		pstmt.setTime(5, time);

		pstmt.execute();

		dbClose();

	}

	public List<Post> getAllPostByUser(Integer user_id) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		List<Post> posts = new ArrayList<>();

		dbConnect();
		String sql = "SELECT * FROM post WHERE user_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {
			Post post = new Post();
			post.setId(rst.getInt("id"));
			post.setUser_id(rst.getInt("user_id"));

			Blob blob = rst.getBlob("post");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			post.setPost(base64Image);
			post.setCaption(rst.getString("caption"));
			post.setDate(rst.getDate("date"));
			post.setTime(rst.getTime("time"));
			post.setLikes(getLikeByPostId(post.getId()));
			post.setComments(getAllCommentsByPostId(post.getId()));

			posts.add(post);

		}

		dbClose();

		return posts;
	}

	public void rejectRequestByUser(Integer userId, Integer contactId) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

		deleteRequest(contactId, userId);

	}

	public List<Post> getAllSortedPostBetweenRange(Integer user_id) throws ClassNotFoundException, SQLException, IOException {

		List<Post> posts = new ArrayList<Post>();

		dbConnect();
		String sql = "SELECT * FROM post WHERE user_id IN ( SELECT contact_id FROM contact WHERE user_id = ? ) OR user_id = ? ORDER BY date DESC , time DESC";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1 , user_id);
		pstmt.setInt(2, user_id);
		
		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {
			Post post = new Post();
			post.setId(rst.getInt("id"));
			post.setUser_id(rst.getInt("user_id"));

			Blob blob = rst.getBlob("post");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			post.setPost(base64Image);
			post.setCaption(rst.getString("caption"));
			post.setDate(rst.getDate("date"));
			post.setTime(rst.getTime("time"));

			post.setLikes(getLikeByPostId(post.getId()));

			post.setComments(getAllCommentsByPostId(post.getId()));

			posts.add(post);
		}

		dbClose();

		return posts;
	}
	
	
		public List<Post> getAllPost() throws ClassNotFoundException, SQLException, IOException {

		List<Post> posts = new ArrayList<Post>();

		dbConnect();
		String sql = "SELECT * FROM post";
		PreparedStatement pstmt = con.prepareStatement(sql);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {
			Post post = new Post();
			post.setId(rst.getInt("id"));
			post.setUser_id(rst.getInt("user_id"));

			Blob blob = rst.getBlob("post");

			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);

			post.setPost(base64Image);
			post.setCaption(rst.getString("caption"));
			post.setDate(rst.getDate("date"));
			post.setTime(rst.getTime("time"));

			post.setLikes(getLikeByPostId(post.getId()));

			post.setComments(getAllCommentsByPostId(post.getId()));

			posts.add(post);

		}

		dbClose();

		return posts;
	}

	public List<Like> getLikeByPostId(Integer post_id) throws ClassNotFoundException, SQLException {

		List<Like> likes = new ArrayList<Like>();

		String sql = "SELECT * FROM likes WHERE post_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, post_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			Like like = new Like();

			like.setId(rst.getInt("id"));
			like.setPost_id(rst.getInt("post_id"));
			like.setUser_id(rst.getInt("user_id"));

			likes.add(like);
		}

		System.out.print("Post_id=" + post_id + "--Number of likes=" + likes.size());

		return likes;
	}

	public void insertLike(Integer user_id, Integer post_id) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "INSERT INTO likes(user_id, post_id) VALUES(?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, post_id);

		pstmt.execute();

		dbClose();

	}

	public void deleteLike(Integer user_id, Integer post_id) throws ClassNotFoundException, SQLException {
		dbConnect();

		String sql = "DELETE FROM likes WHERE user_id=? AND post_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, post_id);

		pstmt.executeUpdate();

		dbClose();
	}

	public void deletePost(Integer user_id, Integer post_id) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub

		deleteLike(user_id, post_id);
		deleteComment(user_id, post_id);

		dbConnect();

		String sql = "DELETE FROM post WHERE id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, post_id);
		pstmt.executeUpdate();
		dbClose();

	}

	public void insertComment(Comment comment) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "INSERT INTO comments(user_id, post_id, comment, date, time) VALUES(?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, comment.getUser_id());
		pstmt.setInt(2, comment.getPost_id());
		pstmt.setString(3, comment.getComment());
		pstmt.setDate(4, comment.getDate());
		pstmt.setTime(5, comment.getTime());

		pstmt.execute();

		dbClose();

	}

	public void deleteComment(Integer user_id, Integer post_id) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "DELETE FROM comments WHERE user_id=? AND post_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, post_id);
		pstmt.executeUpdate();

		dbClose();

	}

	private List<Comment> getAllCommentsByPostId(Integer post_id) throws SQLException, ClassNotFoundException {

		List<Comment> comments = new ArrayList<Comment>();

		String sql = "SELECT * FROM comments WHERE post_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, post_id);

		ResultSet rst = pstmt.executeQuery();

		while (rst.next()) {

			Comment comment = new Comment();

			comment.setId(rst.getInt("id"));
			comment.setUser_id(rst.getInt("user_id"));
			comment.setPost_id(rst.getInt("post_id"));
			comment.setComment(rst.getString("comment"));
			comment.setDate(rst.getDate("date"));
			comment.setTime(rst.getTime("time"));

			comments.add(comment);

		}

		return comments;
	}

	/*
	 * private static Integer generateRandomValue(){
	 * 
	 * Random random = new Random();
	 * 
	 * return random.nextInt(11);
	 * 
	 * }
	 */

	public List<User> getUsersToRecommend(Integer user_id) throws ClassNotFoundException, SQLException{
	 
		dbConnect();
		
		String sql = "SELECT *" + 
				"	FROM user_interest u" + 
				"	WHERE u.user_id NOT" + 
				"	IN ( "+  
				"	SELECT c.contact_id" + 
				"	FROM contact c" + 
				"	WHERE c.user_id = ?" + 
				"	)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		
		
		ResultSet rst = pstmt.executeQuery();
		
		
		List<User> users = new ArrayList<User>();
		
		while(rst.next()) {
			
			User user = new User();
			user.setId(rst.getInt("user_id"));
			
			List<Integer> interest = new ArrayList<Integer>();
			for (int i = 0; i < 10; i++) {
				interest.add(rst.getInt(3+i));
				System.out.println(rst.getInt(3+i));
			}
			
			user.setUserInterest(interest);
			
			System.out.println(user.getId());
			System.out.println("IDAR ME VALUE PRINT KAR RHA HU");
			
			for (Integer integer : user.getUserInterest()) {
				System.out.println(integer);
			}
			
			System.out.println("KHATAM KARU CHU");
			
			
			users.add(user);
			
		}
		
		dbClose();
		
		return users;
	}
	
	public List<User> getInterestOfUsersOtherThanFriends(Integer userId) throws ClassNotFoundException, SQLException {
		
		dbConnect();
		
		List<User> users = new ArrayList<User>();
		
		String sql = "Select * from user_interest where user_id IN ( select contact_id from contact where user_id != ?  )";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, userId);
		
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()) {
			
			User user = new User();
			user.setId(rst.getInt("user_id"));
			List<Integer> interest = new ArrayList<Integer>();
			for (int i = 0; i < 10; i++) {
				interest.add(rst.getInt(3+i));
				System.out.println(rst.getInt(3+i));
			}
			user.setUserInterest(interest);		
			users.add(user);
		}
	
		dbClose();
		
		return users;
	}
	
	public User getInterestOfUsers(User user) throws ClassNotFoundException, SQLException{
		 
		dbConnect();
		
		String sql = "SELECT *" + 
				"	FROM user_interest " + 
				"	WHERE user_id =?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user.getId());
		
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()) {
			
			
			user.setId(rst.getInt("user_id"));
			
			List<Integer> interest = new ArrayList<Integer>();
			for (int i = 0; i < 10; i++) {
				interest.add(rst.getInt(3+i));
				System.out.println(rst.getInt(3+i));
			}
			
			user.setUserInterest(interest);
			
		}
		
		
		dbClose();
		
		return user;
	}
	
	
	public void toInsertUserInterest(User user) throws ClassNotFoundException, SQLException {

		dbConnect();

		String query = "INSERT INTO user_interest( user_id, blogging, cooking, dancing, entertaining, foodie, movie, music, sports, singing, todonothing) VALUES "
				+ "(?, ?, ?,?,?,?,?,?,?,?,?)";

		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, user.getId());

		List<Integer> interest = user.getUserInterest();

		for (int i = 0; i < interest.size(); i++) {
			pstmt.setInt(i + 2, interest.get(i));
		}
        
		pstmt.executeUpdate();

		dbClose();
	}

	public void toUpdateUserInterest(User user) throws ClassNotFoundException, SQLException {

		dbConnect();

		String sql = "UPDATE user_interest SET blogging = ?, cooking = ?, dancing = ?, entertaining = ?, foodie = ?, movie = ?, music = ?, sports = ?, singing = ?, todonothing = ? WHERE user_id = "
				+ user.getId();

		PreparedStatement pstmt = con.prepareStatement(sql);

		System.out.println(sql);
		
		List<Integer> interest = user.getUserInterest();

		for (int i = 0; i < interest.size(); i++) {
			System.out.println(interest.get(i));
			pstmt.setInt(i + 1, interest.get(i));
		}

		pstmt.executeUpdate();

		dbClose();

	}
	
	public List<TableName> getChatRelationName() throws ClassNotFoundException, SQLException{
		
		List<TableName> tableName = new ArrayList<TableName>();
		
		dbConnect();
		String sql = "SELECT * FROM chatrelation";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()) {
			TableName t = new TableName();
			t.setId1(rst.getInt("id1"));
			t.setId2(rst.getInt("id2"));
			t.setTableName(rst.getString("tablename"));
			tableName.add(t);
		}
		
		dbClose();
		
		return tableName;
	}

}
