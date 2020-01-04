package com.whatsapp.database;

import java.io.IOException;
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
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Component;

import com.whatsapp.beans.Group;
import com.whatsapp.beans.GroupMessage;
import com.whatsapp.beans.User;

@Component
public class DBGroup {

	//Step 1: Declare all variables
		private String username = "root";
		private String password = "";
		private String dbName = "whatsap_group";
		private String url = "jdbc:mysql://localhost:3306/"+dbName;
		private String driver = "com.mysql.jdbc.Driver";
		private Connection con;
		
		DB db =  new DB();
		
		private void dbClose() throws SQLException{
			con.close();
		}
		
		private void dbConnect() throws ClassNotFoundException, SQLException{
			//Step 2: load the driver
			Class.forName(driver);
			//Step 3: Make the connection
			con = DriverManager.getConnection(url, username, password);
		
		}
			
		public void createGroup(Group group) throws ClassNotFoundException, SQLException {
			
			group.setGroup_msg_table(createGroupMessageTable(group));	
			
			dbConnect();
			
			String sql = "INSERT INTO group_information "+
						"( group_name , admin_id , group_description , total_members , ref_message_table ) "+
						"VALUES ( ? , ? , ? , ? , ? )";

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, group.getGroup_name());
			pstmt.setInt(2, group.getAdmin_id());
			pstmt.setString(3, group.getDescription());
			pstmt.setInt(4, group.getTotal_members());
			pstmt.setString(5, group.getGroup_msg_table());
			
			pstmt.execute();

			dbClose();
			
			addGroupMembers(group);
			
		}

		private void addGroupMembers(Group group) throws ClassNotFoundException, SQLException {
			dbConnect();
			String sql;
			
			sql = "SELECT group_id from group_information where group_name=? AND admin_id=? AND group_description=?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, group.getGroup_name());
			pstmt.setInt(2, group.getAdmin_id());
			pstmt.setString(3, group.getDescription());
			
			ResultSet rst = pstmt.executeQuery();
			Integer group_id = 0;
			while(rst.next()) {
				group_id = rst.getInt("group_id");
			}
			
			List<Integer> members_id = group.getMembers_id() ;   
			
			
			
			for (Integer integer : members_id) {
			
				sql = "INSERT INTO group_members "+
						"( group_id , member_id ) "+
						"VALUES ( ? , ? )";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, group_id);
				pstmt.setInt(2, integer);
				
				pstmt.execute();
				 
			}
			
			dbClose();
			
		}

		private String createGroupMessageTable(Group group) throws SQLException, ClassNotFoundException {
			// TODO Auto-generated method stub
			
			dbConnect();
			
			String tablename = group.getGroup_name().replaceAll(" ", "")+"_"+group.getAdmin_id().toString();
			/*
			String sql = "CREATE TABLE "+tablename+" (id int(11), sender varchar(255), "
					+ "message varchar(255) , "
					+ "date Date, time Time )";
			*/
			String sql = "CREATE TABLE "+tablename+"( "
					+ "id int NOT NULL AUTO_INCREMENT,"
				    +"sender_id INT NOT NULL, "
				    +"sender_name TEXT, "
				    +"message TEXT, "
				    +"date DATE,"
				    +"time TIME,"
				    +"PRIMARY KEY ( id ))";
			/*
			String sql = "CREATE TABLE "+tablename
					+ "(id INT( 11 ) NOT NULL AUTO_INCREMENT , "
					+ "sender_id INT( 11 ) NOT NULL , sender_name TEXT NOT NULL , message TEXT NOT NULL "
					+ " date DATE NOT NULL , time TIME NOT NULL , PRIMARY KEY ( id ) )";
			*/
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.execute();
			
			dbClose();
			
			return tablename;
		}
		
		public List<Group> getGroups(Integer user_id) throws ClassNotFoundException, SQLException {
			
			List<Group> groups = new ArrayList<Group>();			
			
			dbConnect();
			
			String sql = "SELECT group_id FROM group_members WHERE member_id = "+user_id;

			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				
				Group group = new Group();
				
				group.setGroup_id(rst.getInt("group_id"));
			
				String sql1 = "SELECT * " + 
						" FROM group_information" + 
						" WHERE group_id = ? "; 
				
				PreparedStatement pstmt1 = con.prepareStatement(sql1);
				pstmt1.setInt(1, group.getGroup_id());
				
				ResultSet rst1 = pstmt1.executeQuery();
				
				while(rst1.next()) {
						
					group.setAdmin_id( rst1.getInt("admin_id") );
					group.setDescription( rst1.getString("group_description") );
					group.setGroup_msg_table( rst1.getString("ref_message_table") );
					group.setGroup_name( rst1.getString("group_name") );
					group.setMembers_id( getMembersID(rst1.getInt("group_id")) );
					group.setMessages( getGroupMessages(rst1.getString("ref_message_table")) );
					group.setTotal_members( rst1.getInt("total_members") );
					
				}
				
				groups.add(group);
				
			}
			
			dbClose();
			
			return groups;
		}

		private List<GroupMessage> getGroupMessages(String msg_table) throws SQLException {
			// TODO Auto-generated method stub
			
			String sql = "SELECT * FROM "+msg_table;
			
			List<GroupMessage> group_messages = new ArrayList<GroupMessage>();
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rst = pstmt.executeQuery();
				
			while(rst.next()) {
				
				GroupMessage gmsg = new GroupMessage();
				
				gmsg.setSender_id( rst.getInt("sender_id") );
				gmsg.setSender_name( rst.getString("sender_name") );
				gmsg.setDate( rst.getDate("date") );
				gmsg.setTime( rst.getTime("time") );
				gmsg.setMsg( rst.getString("message") );
				
				group_messages.add(gmsg);

			}
			 
			return group_messages;
		}

		private List<Integer> getMembersID(Integer group_id) throws SQLException {
			// TODO Auto-generated method stub
		
			List<Integer> members_id = new ArrayList<Integer>();
			
			String sql = "SELECT member_id "
					   + "FROM group_members "
					   + "WHERE group_id = ?";
	
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				members_id.add(rst.getInt("member_id"));
			}
			
			return members_id;
 		}

		public Group getGroupInformation(Integer group_id) throws ClassNotFoundException, SQLException {
			
			dbConnect();
			
			Group group = new Group();
			
			
			String sql = "Select * from group_information where group_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				group.setGroup_id( rst.getInt("group_id") );
				group.setAdmin_id( rst.getInt("admin_id") );
				group.setGroup_name( rst.getString("group_name") );
				group.setDescription( rst.getString("group_description") );
				group.setTotal_members(rst.getInt("total_members") );
				group.setGroup_msg_table( rst.getString("ref_message_table") );
			}
			group.setMembers_id(getMembersID(group_id));
			group.setMessages(getGroupMessages(group.getGroup_msg_table()));
			dbClose();
			
			return group;
		}
		
		public List<User> getGroupMembersInformation(List<Integer> membersId) throws ClassNotFoundException, SQLException, IOException {
			
			List<User> membersInfo = new ArrayList<User>();
			
			
			for (Integer memberId : membersId) {
				membersInfo.add(db.getUser(memberId));
			}
			
			return membersInfo;
			
		}

		public void insertGroupMessage(Integer user_id, String message, String tableName) throws ClassNotFoundException, SQLException, IOException {

			GroupMessage gmessage = new GroupMessage();
			
			gmessage.setSender_id(user_id);
			
			gmessage.setSender_name(db.getUser(user_id).getName());
			
			gmessage.setMsg(message);
			long millis=System.currentTimeMillis();  
	        Date date=new Date(millis);
		
	        Time time = new Time(millis);
			gmessage.setDate(date);
			gmessage.setTime(time);
			
			dbConnect();
			
			String sql = "INSERT INTO "+tableName+"( sender_id, sender_name, message, date, time) VALUES(?,?,?,?,?)";
					
					
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, gmessage.getSender_id());
			pstmt.setString(2, gmessage.getSender_name());
			pstmt.setString(3, gmessage.getMsg());
			pstmt.setDate(4, (Date) gmessage.getDate());
			pstmt.setTime(5, gmessage.getTime());
			
			pstmt.executeUpdate();
			
			dbClose();
			
			
		}

		public List<Group> checkViewGroups(List<Group> groups, Integer user_id) throws ClassNotFoundException, SQLException {
			
			dbConnect();
			
			for (Group group : groups) {
				
				String tablename = group.getGroup_msg_table();
				
				String sql = "SELECT * FROM "+tablename+" ORDER BY id DESC LIMIT 1";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				ResultSet rst = pstmt.executeQuery();
				
				while(rst.next()) {
					if(rst.getInt("sender_id")!=user_id) {
						group.setView(1);
					}
					
					GroupMessage gmsg = new GroupMessage();
					
					gmsg.setSender_id( rst.getInt("sender_id") );
					gmsg.setSender_name( rst.getString("sender_name") );
					gmsg.setDate( rst.getDate("date") );
					gmsg.setTime( rst.getTime("time") );
					gmsg.setMsg( rst.getString("message"));
					
					if(gmsg.getMsg().length() >= 38)
						gmsg.setMsg(gmsg.getMsg().substring(0,40));
					
					long millis=System.currentTimeMillis();  
			        Date date=new Date(millis);
				
					long diffInMillies = Math.abs(date.getTime() - rst.getDate("date").getTime());
					long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
					
					System.out.println("");
					
					group.setConversationDealy(diff);
					
					
					
					group.setLastMessage(gmsg);
					
				}
			}

			dbClose();
			
			
			return groups;
		}

		public void leaveGroup(Integer member_id, Integer group_id) throws SQLException, ClassNotFoundException {
			
			dbConnect();
			String sql = "delete from group_members where group_id=? AND member_id=?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			pstmt.setInt(2, member_id);
			
			pstmt.execute();
			
			sql = "SELECT total_members FROM group_information WHERE group_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			Integer total_members = 0;
			while(rst.next()) {
				total_members = rst.getInt("total_members");
			}
			
			total_members--;
			
			sql = "UPDATE group_information "
					+ "SET total_members="+total_members
					+" WHERE group_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			
			pstmt.execute();
			
			dbClose();
		}

		public void addMemberById(Integer group_id, Integer contact_id) throws ClassNotFoundException, SQLException {
			
			dbConnect();
			
			String sql = "INSERT INTO group_members (group_id, member_id) VALUES(?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			pstmt.setInt(2, contact_id);
			pstmt.execute();
			
			sql = "SELECT total_members FROM group_information where group_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			Integer total_members = 0;
			while(rst.next()) {
				total_members = rst.getInt("total_members");
			}
			
			total_members++;
			
			sql = "UPDATE group_information SET total_members=? WHERE group_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, total_members);
			pstmt.setInt(2, group_id);
			
			pstmt.executeUpdate();
			
			dbClose();
			
		}
}
