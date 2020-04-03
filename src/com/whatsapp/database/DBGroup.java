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
import java.util.Calendar;
import java.util.Comparator;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whatsapp.beans.Group;
import com.whatsapp.beans.GroupMessage;
import com.whatsapp.beans.Media;
import com.whatsapp.beans.Message;
import com.whatsapp.beans.User;
import com.whatsapp.enums.MediaTypeEnum;
import com.whatsapp.security.SecureData;

@Component
public class DBGroup {

	@Autowired
	SecureData secureData;
	
	//Step 1: Declare all variables
	//localhost:3306
	//NDNiqt63194
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
			
		public void encryptTheMessage() throws ClassNotFoundException, SQLException {
			
			dbConnect();
			
			String sql = "select * from group_information";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				
				String tableName = rst.getString("ref_message_table").toLowerCase();
				Integer tableId = rst.getInt("group_id");
				String query = "select * from "+tableName;
				PreparedStatement pre = con.prepareStatement(query);
				ResultSet r = pre.executeQuery();
				
				while(r.next()) {
					
					Integer messageId = r.getInt("id");
					String message = r.getString("message");
					
					String updateQuery = "UPDATE "+tableName+" SET message = ? WHERE id = ? LIMIT 1 ";
					PreparedStatement updateSta = con.prepareStatement(updateQuery);
					updateSta.setString(1, secureData.decryptTheMessage(message));
					updateSta.setInt(2, messageId);
					
					updateSta.executeUpdate();
				}
				
			}
			
			dbClose();
			
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
			String sql = "CREATE TABLE "+tablename.toLowerCase()+"( "
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
		
		public List<Group> getGroups(Integer user_id) throws ClassNotFoundException, SQLException, IOException {
			
			List<Group> groups = new ArrayList<Group>();			
			
			dbConnect();
			
			String sql = "SELECT * FROM group_information WHERE group_id in (select group_id from group_members where member_id = ?)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				
				Group group = new Group();
				
				group.setGroup_id(rst.getInt("group_id"));
			
					group.setAdmin_id( rst.getInt("admin_id") );
					group.setDescription( rst.getString("group_description") );
					group.setGroup_msg_table( rst.getString("ref_message_table") );
					group.setGroup_name( rst.getString("group_name") );
					group.setMembers_id( getMembersID(rst.getInt("group_id")) );
					
					List<GroupMessage> groupMessage = getGroupMessages(rst.getString("ref_message_table"), group.getGroup_id());
					
					groupMessage  = getMediaMessagesToListOfGroupMessages(user_id, group.getGroup_id() ,groupMessage);
					
					List<GroupMessage> groupMessageList = groupMessage.stream()
							  .sorted(Comparator.comparing(GroupMessage::getTime))
							  .collect(Collectors.toList());
					
					groupMessage = groupMessageList.stream()
							  .sorted(Comparator.comparing(GroupMessage::getDate))
							  .collect(Collectors.toList());
					
					group.setMessages(groupMessage);
					group.setTotal_members( rst.getInt("total_members") );
				
				groups.add(group);
				
			}
			
			dbClose();
			
			return groups;
		}

		
		private List<GroupMessage> getMediaMessagesToListOfGroupMessages(Integer user_id, Integer group_id,
				List<GroupMessage> groupMessage) throws ClassNotFoundException, SQLException, IOException {

				List<Media> medias = getAllMediaTransfersInGroup(user_id, group_id);
				

				for (Media media : medias) {
					GroupMessage m = new GroupMessage();

					m.setMediaId(media.getId());
					m.setSender_id(media.getSender());
					m.setSender_name(db.getUserName(media.getSender()));
					m.setDate(media.getDate());
					m.setTime(media.getTime());
					m.setMediaType(media.getType());
					m.setMediaDescription(media.getDescription());
					m.setMediaFileName(media.getFileName());
					m.setMediaDocument(media.getDocument());
					m.setMediaPicture(media.getPicture());
					m.setMediaVideo(media.getVideo());
					
					groupMessage.add(m);
				}
				

			return groupMessage;
		}

		private List<GroupMessage> getGroupMessages(String msg_table, Integer group_id) throws SQLException {
			// TODO Auto-generated method stub
			
			String sql = "SELECT * FROM "+msg_table.toLowerCase();
			
			List<GroupMessage> group_messages = new ArrayList<GroupMessage>();
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rst = pstmt.executeQuery();
				
			while(rst.next()) {
				
				GroupMessage gmsg = new GroupMessage();
				
				gmsg.setId(rst.getInt("id"));
				gmsg.setSender_id( rst.getInt("sender_id") );
				gmsg.setSender_name( rst.getString("sender_name") );
				gmsg.setDate( rst.getDate("date") );
				gmsg.setTime( rst.getTime("time") );
				gmsg.setMsg(secureData.decryptTheMessage(rst.getString("message")) );
				
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

		public Group getGroupInformation(Integer user_id, Integer group_id) throws ClassNotFoundException, SQLException, IOException {
			
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
			
		
		  List<GroupMessage> groupMessage = getGroupMessages(group.getGroup_msg_table(), group_id);
		  
		  groupMessage = getMediaMessagesToListOfGroupMessages(user_id, group.getGroup_id() ,groupMessage);
		  
		  List<GroupMessage> groupMessageList = groupMessage.stream()
		  .sorted(Comparator.comparing(GroupMessage::getTime))
		  .collect(Collectors.toList());
		  
		  groupMessage = groupMessageList.stream()
		  .sorted(Comparator.comparing(GroupMessage::getDate))
		  .collect(Collectors.toList());
		  
		  group.setMessages(groupMessage);
		 
			
			dbClose();
			
			return group;
		}
		
		public List<User> getGroupMembersInformation(List<Integer> membersId) throws ClassNotFoundException, SQLException, IOException {
			
			List<User> membersInfo = new ArrayList<User>();
			
			
			for (Integer memberId : membersId) {
				membersInfo.add(db.getNeccessaryStatusUserValues(memberId));
			}
			
			return membersInfo;
			
		}

		public void insertGroupMessage(Integer user_id, String message, String tableName, Integer group_id) throws ClassNotFoundException, SQLException, IOException {

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
			
			String sql = "INSERT INTO "+tableName.toLowerCase()+"( sender_id, sender_name, message, date, time) VALUES(?,?,?,?,?)";
					
					
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, gmessage.getSender_id());
			pstmt.setString(2, gmessage.getSender_name());
			pstmt.setString(3, secureData.encryptTheMessage(gmessage.getMsg()) );
			pstmt.setDate(4, (Date) gmessage.getDate());
			pstmt.setTime(5, gmessage.getTime());
			
			pstmt.executeUpdate();
			
			dbClose();
			
			
		}

		public List<Group> checkViewGroups(List<Group> groups, Integer user_id) throws ClassNotFoundException, SQLException, IOException {
			
			List<Group> groupWithViews = new ArrayList<Group>();
			
			for (Group group : groups) {
				
				System.out.println(group);
				System.out.println(group.getGroup_msg_table());
				System.out.println(group.getGroup_msg_table().toLowerCase());
				
				String tablename = group.getGroup_msg_table();
				
				GroupMessage gmsg = new GroupMessage();
				gmsg.setSender_id(0);
				
				dbConnect();
				
				//String sql = "SELECT * FROM "+tablename.toLowerCase()+" ORDER BY id DESC LIMIT 1";
				String sql = "SELECT * FROM "+tablename.toLowerCase()+" ORDER BY id DESC LIMIT 1";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rst = pstmt.executeQuery();
				
				while(rst.next()) {
					
					if(rst.getInt("sender_id")!=user_id) {
						group.setView(1);
					}
					
					gmsg.setSender_id( rst.getInt("sender_id") );
					gmsg.setSender_name( rst.getString("sender_name") );
					gmsg.setDate( rst.getDate("date") );
					gmsg.setTime( rst.getTime("time") );
					gmsg.setMsg( secureData.decryptTheMessage(rst.getString("message")) );
					
					System.out.println("gmsg.getMsg() : "+gmsg.getMsg());
					
					if(gmsg.getMsg().length() >= 38)
						gmsg.setMsg(gmsg.getMsg().substring(0,40));
					
				}
				
				dbClose();
				
				GroupMessage m = getLastMediaGroupMessage(user_id, group.getGroup_id());
					
					if(m!=null && gmsg == null)
						gmsg = m;
					if(m!=null && gmsg!=null) {
						
						List<GroupMessage> list = new ArrayList<GroupMessage>();
						list.add(gmsg);
						list.add(m);
						
						List<GroupMessage> messageList = list.stream()
								  .sorted(Comparator.comparing(GroupMessage::getTime).reversed())
								  .collect(Collectors.toList());
						
						list = messageList.stream()
								  .sorted(Comparator.comparing(GroupMessage::getDate).reversed())
								  .collect(Collectors.toList());
						
						gmsg = list.get(0);
					
					}
						
					if(gmsg.getSender_id() != 0) {
						Date date=new Date(System.currentTimeMillis());
						long diffInMillies = Math.abs(date.getTime() - gmsg.getDate().getTime());
						long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
						group.setConversationDealy(diff);
						group.setLastMessage(gmsg);
					
					}else {
						group.setLastMessage(null);
					}
					
					groupWithViews.add(group);
			}

			return groupWithViews;
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

		public void insertMediaIntoGroup(Integer user_id, Integer group_id, Media media) throws ClassNotFoundException, SQLException, FileNotFoundException {
			
			long millis=System.currentTimeMillis();  
	        Date date=new Date(millis);
	        Time time = new Time(millis);
	        
			media.setSender(user_id);
			media.setReceiver(group_id);
			media.setDate(date);
			media.setTime(time);
			
			System.out.println("media.getFilePath()="+media.getFilePath());
			
			File file=new File(media.getFilePath());
			media.setFileName(file.getName());
			System.out.println("----file Object----");
			System.out.println("file name: "+file.getName());
			System.out.println("file path: "+file.getPath());
			
			FileInputStream fis=new FileInputStream(file);
			
			dbConnect();
			
			String sql = "INSERT INTO media(sender, groupId, type, filename, document, description, date, time) VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, media.getSender());
			pstmt.setInt(2, media.getReceiver());
			pstmt.setString(3, media.getType());
			pstmt.setString(4, media.getFileName());
			pstmt.setBinaryStream(5 ,fis,(int)file.length());
			
			pstmt.setString(6, media.getDescription());
			pstmt.setDate(7, media.getDate());
			pstmt.setTime(8, media.getTime());
			
			pstmt.execute();
			dbClose();
			
		}
		
		public List<Media> getAllMediaTransfersInGroup(Integer user_id, Integer group_id) throws ClassNotFoundException, SQLException, IOException {

			List<Media> medias = new ArrayList<Media>();
			
			
			String sql = "SELECT * FROM media WHERE groupId=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				
				Media media = new Media();
				
				media.setId(rst.getInt("id"));
				media.setSender(rst.getInt("sender"));
				media.setReceiver(rst.getInt("groupId"));
				media.setType(rst.getString("type"));
				media.setFileName(rst.getString("filename"));
				
				if(media.getType().equals(MediaTypeEnum.PICTURE.toString())) {
					
					Blob blob = rst.getBlob("document");
		            
		            InputStream inputStream = blob.getBinaryStream();
		            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		            byte[] buffer = new byte[4096];
		            int bytesRead = -1;
		             
		            while ((bytesRead = inputStream.read(buffer)) != -1) {
		                outputStream.write(buffer, 0, bytesRead);                  
		            }
		             
		            byte[] imageBytes = outputStream.toByteArray();
		            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		
		            media.setPicture(base64Image);
		            media.setDocument(null);

		            media.setVideo(null);
					
				}else if(media.getType().equals(MediaTypeEnum.DOCUMENT.toString())){
					
					/*byte[] fileBytes = rst.getBytes("document");
		            OutputStream targetFile=  new FileOutputStream("document.pdf");
		            targetFile.write(fileBytes);
		            targetFile.close();
					*/
					
					Blob blob = rst.getBlob("document");
		            
		            InputStream inputStream = blob.getBinaryStream();
		            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		            byte[] buffer = new byte[4096];
		            int bytesRead = -1;
		             
		            while ((bytesRead = inputStream.read(buffer)) != -1) {
		                outputStream.write(buffer, 0, bytesRead);                  
		            }
		             
		            byte[] imageBytes = outputStream.toByteArray();
		            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		
		            media.setDocument(base64Image);
					
		            media.setPicture(null);
		            
		            media.setVideo(null);
		            
				}else if(media.getType().equals(MediaTypeEnum.VIDEO.toString())){
					
					/*byte[] fileBytes = rst.getBytes("document");
		            OutputStream targetFile=  new FileOutputStream("document.pdf");
		            targetFile.write(fileBytes);
		            targetFile.close();
					*/
					
					Blob blob = rst.getBlob("document");
		            
		            InputStream inputStream = blob.getBinaryStream();
		            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		            byte[] buffer = new byte[4096];
		            int bytesRead = -1;
		             
		            while ((bytesRead = inputStream.read(buffer)) != -1) {
		                outputStream.write(buffer, 0, bytesRead);                  
		            }
		             
		            byte[] imageBytes = outputStream.toByteArray();
		            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		
		

		            media.setDocument(null);
					
		            media.setPicture(null);
		            
		            media.setVideo(base64Image);
				}
				
				
			
				media.setDescription(rst.getString("description"));
				media.setDate(rst.getDate("date"));
				media.setTime(rst.getTime("time"));
				
				medias.add(media);
			}
			
			
			return medias;
		}
		
		private GroupMessage getLastMediaGroupMessage(Integer user_id, Integer group_id) throws SQLException, ClassNotFoundException, IOException {
			
			dbConnect();
			String sql = "SELECT * FROM media where groupId=? ORDER BY id DESC LIMIT 1";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, group_id);
			ResultSet rst = pstmt.executeQuery();
			
			GroupMessage m = new GroupMessage();
			m.setSender_id(0);
			while(rst.next()) {
				
				m.setMediaId(rst.getInt("id"));
				m.setSender_id(rst.getInt("sender"));
				m.setSender_name(db.getUserName(rst.getInt("sender")));
				m.setDate(rst.getDate("date"));
				m.setTime(rst.getTime("time"));
				m.setMediaType(rst.getString("type"));
				m.setMediaDescription(rst.getString("description"));
				m.setMediaFileName(rst.getString("filename"));
				m.setMediaDocument(null);
				m.setMediaPicture(null);
				m.setMediaVideo(null);
				
				break;
			
			}
			dbClose();
			
			if(m.getSender_id()!=0)
				return m;
			else 
				return null;
			
			
		}

		public List<Group> getGroupInformationForHome(Integer user_id) throws SQLException, ClassNotFoundException {
			
			List<Group> groups = new ArrayList<Group>();
			
			dbConnect();
			
			String sql = "SELECT * FROM group_information WHERE group_id in (select group_id from group_members where member_id = ?)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				
				Group group = new Group();
				
				group.setGroup_id( rst.getInt("group_id") );
				group.setAdmin_id( rst.getInt("admin_id") );
				group.setGroup_name( rst.getString("group_name") );
				group.setDescription( rst.getString("group_description") );
				group.setTotal_members(rst.getInt("total_members") );
				group.setGroup_msg_table( rst.getString("ref_message_table") );
				
				groups.add(group);
			}
			
			dbClose();
			
			return groups;
		}

		public void deleteMessageFromGroup(Integer messageId, String tableName) throws ClassNotFoundException, SQLException {
			
			dbConnect();
			
			String sql = "DELETE from "+tableName.toLowerCase()+" where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			pstmt.executeUpdate();
			
			dbClose();
			
		}

		public void deleteMediaMessageFromGroup(Integer messageId) throws ClassNotFoundException, SQLException {
			dbConnect();
			
			String sql = "DELETE from media where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			pstmt.executeUpdate();
			
			dbClose();
			
		}

		
		
}
