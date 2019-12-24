package com.whatsapp.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.stereotype.Component;

import com.mysql.cj.api.x.Result;
import com.whatsapp.beans.Message;
import com.whatsapp.beans.User;

@Component
public class DBMessage {
	
	DB db = new DB();
	
	//Step 1: Declare all variables
	private String username = "root";
	private String password = "";
	private String dbName = "whatsapp_msg_db";
	private String url = "jdbc:mysql://localhost:3306/"+dbName;
	private String driver = "com.mysql.jdbc.Driver";
	private Connection con;
	
	private void dbClose() throws SQLException{
		con.close();
	}
	
	private void dbConnect() throws ClassNotFoundException, SQLException{
		//Step 2: load the driver
		Class.forName(driver);
		//Step 3: Make the connection
		con = DriverManager.getConnection(url, username, password);
	
	}
	
	public void createMessageTable(Integer user_id, Integer contact_id, String tablename) throws ClassNotFoundException, SQLException {
		
		dbConnect();
		
		String sql = "CREATE TABLE "+tablename
				+ " (srno int NOT NULL AUTO_INCREMENT, "
				+ "sender varchar(255), "
				+ "msg varchar(255), "
				+ "receiver varchar(255), "
				+ "view boolean, "
				+ "date Date, "
				+ "time Time ,"
				+ "PRIMARY KEY (srno))";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.execute();
		
		dbClose();
	}
	
	public void insertMessage(Integer user_id, String msg, Integer contact_id) throws ClassNotFoundException, SQLException {
		 
		long millis=System.currentTimeMillis();  
        Date date=new Date(millis);
	
        Time time = new Time(millis);
		
		dbConnect();
		
		String tablename = db.getTableName(user_id, contact_id);
		
		String sql = "Insert into "+tablename+" ( sender, msg, receiver, view, date, time) VALUES(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, user_id);
		pstmt.setString(2, msg);
		pstmt.setInt(3, contact_id);
		pstmt.setBoolean(4, true);
		pstmt.setDate(5, date);
		pstmt.setTime(6, time);
		
		pstmt.executeUpdate();
		
		dbClose();
	}
	
	public List<Message> getAllMessages(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException {
		
		List<Message> messages = new ArrayList<Message>();
		dbConnect();
		
		String tablename = db.getTableName(user_id, contact_id);
		
		String sql = "select * from "+tablename+" where (sender=? AND receiver=?) OR (sender=? AND receiver=?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, contact_id);
		pstmt.setInt(4, user_id);
		
		ResultSet rst = pstmt.executeQuery();
		
		
		while(rst.next()) {
			Message msg = new Message();
			msg.setSrno(rst.getInt("srno"));
			msg.setSender(rst.getInt("sender"));
			msg.setMsg(rst.getString("msg"));
			msg.setReceiver(rst.getInt("receiver"));
			msg.setView(rst.getBoolean("view"));
			msg.setDate(rst.getDate("date"));
			msg.setTime(rst.getTime("time"));
			
			messages.add(msg);
			
		}
		
		dbClose();
		return messages;
		
	}

	public List<User> checkViewUsers(List<User> users, Integer user_id) throws ClassNotFoundException, SQLException {
		
		dbConnect();
		
		for (User user : users) {
			String tablename = db.getTableName(user_id, user.getId());
			
			String sql = "SELECT * FROM "+tablename+" ORDER BY srno DESC LIMIT 1";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				if(rst.getInt("sender")!=user_id) {
					user.setView(1);
				}
			}
		}

		dbClose();
		
		return users;
	}

	public void removeChatTable(String tablename) throws ClassNotFoundException, SQLException {
		
		dbConnect();
		
		String sql = "DROP TABLE "+tablename;
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		
		dbClose();
	}
	
}
