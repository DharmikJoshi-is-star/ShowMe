package com.whatsapp.database;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whatsapp.beans.Media;
import com.whatsapp.beans.Message;
import com.whatsapp.beans.TableName;
import com.whatsapp.beans.User;
import com.whatsapp.enums.MediaTypeEnum;
import com.whatsapp.security.SecureData;

@Component
public class DBMessage {
	
	@Autowired
	DB db;
	
	@Autowired
	SecureData secureData;
	
	MediaTypeEnum mediaTypeEnum;
	      
	//localhost:3306
	//NDNiqt63194
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
	
	public void encryptTheMessage() throws ClassNotFoundException, SQLException {
		
		List<TableName> tableNames = db.getChatRelationName();
		
		dbConnect();
		
		for (TableName table : tableNames) {
			String sql = "select * from "+table.getTableName();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rst = pstmt.executeQuery();
			
			while(rst.next()) {
				Integer messageId = rst.getInt("srno");
				String message = rst.getString("msg");
				
				String query = "UPDATE "+table.getTableName()+" SET msg = ? WHERE srno = ? LIMIT 1 ";
				PreparedStatement updateSta = con.prepareStatement(query);
				updateSta.setString(1, secureData.encryptCredentials(message));
				updateSta.setInt(2, messageId);
				updateSta.executeUpdate();
			}
			
		}
		
		dbClose();
		
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
		
		String encry = secureData.encryptTheMessage(msg);
		System.out.println("Original message was: "+msg);
		System.out.println("Encrypted Message is : "+encry);
		System.out.println("Decrypted Message is: "+secureData.decryptTheMessage(encry));
		System.out.println("key is: "+(user_id+contact_id));
		long millis=System.currentTimeMillis();  
        Date date=new Date(millis);
	
        System.out.println("message from use to contact is :"+ msg);
        
        Time time = new Time(millis);
		
        String tablename = db.getTableName(user_id, contact_id);
        
		dbConnect();
		
		String sql = "Insert into "+tablename+" ( sender, msg, receiver, view, date, time) VALUES(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, user_id);
		pstmt.setString(2, encry);
		pstmt.setInt(3, contact_id);
		pstmt.setBoolean(4, true);
		pstmt.setDate(5, date);
		pstmt.setTime(6, time);
	
		pstmt.executeUpdate();
		
		 System.out.println("enc message from use to contact is :"+ secureData.encryptTheMessage(msg));
		
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
		//secureData.decryptTheMessage(rst.getString("msg"), user_id+contact_id)
		
		while(rst.next()) {
			Message msg = new Message();
			msg.setSrno(rst.getInt("srno"));
			msg.setSender(rst.getInt("sender"));
			msg.setMsg( secureData.decryptTheMessage(rst.getString("msg")) );
			msg.setReceiver(rst.getInt("receiver"));
			msg.setView(rst.getBoolean("view"));
			msg.setDate(rst.getDate("date"));
			msg.setTime(rst.getTime("time"));
			
			messages.add(msg);
			System.out.println(rst.getString("msg")+" : "+secureData.decryptTheMessage(rst.getString("msg")));
		}
		
		dbClose();
		return messages;
		
	}

	public List<User> checkViewUsers(List<User> users, Integer user_id) throws ClassNotFoundException, SQLException, IOException {
		
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
	
				Message msg = new Message();
				
				msg.setSrno(rst.getInt("srno"));
				msg.setSender(rst.getInt("sender"));
				msg.setMsg( secureData.decryptTheMessage(rst.getString("msg")));
				msg.setReceiver(rst.getInt("receiver"));
				msg.setView(rst.getBoolean("view"));
				msg.setDate(rst.getDate("date"));
				msg.setTime(rst.getTime("time"));
			
				
				if(msg.getMsg().length() >= 50)
					msg.setMsg(msg.getMsg().substring(0,40));
				
				
				Media media = getLastMediaMessage(user.getId(), user_id);
				
				
				System.out.println("media.getId()"+media.getId());
				
				if(media.getId()!=null) {
				Message m = new Message();
				
				m.setMediaId(media.getId());
				m.setSender(media.getSender());
				m.setReceiver(media.getReceiver());
				m.setDate(media.getDate());
				m.setTime(media.getTime());
				m.setMediaType(media.getType());
				m.setMediaDescription(media.getDescription());
				m.setMediaFileName(media.getFileName());
				m.setMediaDocument(media.getDocument());
				m.setMediaPicture(media.getPicture());
				m.setMediaVideo(media.getVideo());
				
				List<Message> list = new ArrayList<Message>();
				list.add(msg);
				list.add(m);
				
				List<Message> messageList = list.stream()
						  .sorted(Comparator.comparing(Message::getTime).reversed())
						  .collect(Collectors.toList());
				
				list = messageList.stream()
						  .sorted(Comparator.comparing(Message::getDate).reversed())
						  .collect(Collectors.toList());
				
				msg = list.get(0);
				
				}
				
				long millis=System.currentTimeMillis();  
		        Date date=new Date(millis);
			
				long diffInMillies = Math.abs(date.getTime() - msg.getDate().getTime());
				Long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
				
			
				user.setLastMessageDate(msg.getDate());
				
				user.setLastMessageTime(msg.getTime());
				
				user.setConversationDealy(diff);
				
				user.setLastMessage(msg);
			
			}
		
		}

		dbClose();
		
		return users;
	}

	private Media getLastMediaMessage(Integer user_id, Integer admin_id) throws SQLException, ClassNotFoundException, IOException {
		
		String sql = "SELECT * FROM media where (sender=? AND receiver=?) OR (sender=? AND receiver=?) ORDER BY id DESC LIMIT 1";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, admin_id);
		pstmt.setInt(3, admin_id);
		pstmt.setInt(4, user_id);
		
		ResultSet rst = pstmt.executeQuery();
		
		Media media = new Media();
		while(rst.next()) {
			
			if(rst.getInt("sender")==user_id || rst.getInt("receiver")==user_id) {
			
			media.setId(rst.getInt("id"));
			media.setSender(rst.getInt("sender"));
			media.setReceiver(rst.getInt("receiver"));
			media.setType(rst.getString("type"));
			media.setFileName(rst.getString("filename"));
			
			if(media.getType().equals(MediaTypeEnum.PICTURE.toString())) {
				
				//Blob blob = rst.getBlob("document");
	            
					/*
					 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
					 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
					 * int bytesRead = -1;
					 * 
					 * while ((bytesRead = inputStream.read(buffer)) != -1) {
					 * outputStream.write(buffer, 0, bytesRead); }
					 * 
					 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
					 * Base64.getEncoder().encodeToString(imageBytes);
					 */
	
	            media.setPicture(null);
	            media.setDocument(null);
	            media.setVideo(null);
				
				
			}else if(media.getType().equals(MediaTypeEnum.DOCUMENT.toString())){
				
				/*byte[] fileBytes = rst.getBytes("document");
	            OutputStream targetFile=  new FileOutputStream("document.pdf");
	            targetFile.write(fileBytes);
	            targetFile.close();
				*/
				
					/*
					 * Blob blob = rst.getBlob("document");
					 * 
					 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
					 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
					 * int bytesRead = -1;
					 * 
					 * while ((bytesRead = inputStream.read(buffer)) != -1) {
					 * outputStream.write(buffer, 0, bytesRead); }
					 * 
					 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
					 * Base64.getEncoder().encodeToString(imageBytes);
					 */
	
				media.setPicture(null);
	            media.setDocument(null);
	            media.setVideo(null);
			
			}else if(media.getType().equals(MediaTypeEnum.VIDEO.toString())){
				
				/*byte[] fileBytes = rst.getBytes("document");
	            OutputStream targetFile=  new FileOutputStream("document.pdf");
	            targetFile.write(fileBytes);
	            targetFile.close();
				*/
				
					/*
					 * Blob blob = rst.getBlob("document");
					 * 
					 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
					 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
					 * int bytesRead = -1;
					 * 
					 * while ((bytesRead = inputStream.read(buffer)) != -1) {
					 * outputStream.write(buffer, 0, bytesRead); }
					 * 
					 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
					 * Base64.getEncoder().encodeToString(imageBytes);
					 */
	
				media.setPicture(null);
	            media.setDocument(null);
	            media.setVideo(null);
			
			}
			
		
			media.setDescription(rst.getString("description"));
			media.setDate(rst.getDate("date"));
			media.setTime(rst.getTime("time"));
			break;
		
		}
		}
		
		return media;
	}

	public void removeChatTable(String tablename) throws ClassNotFoundException, SQLException {
		
		dbConnect();
		
		String sql = "DROP TABLE "+tablename;
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		
		dbClose();
	}

	public List<Media> getAllMediaTransfers(Integer user_id, Integer contact_id) throws ClassNotFoundException, SQLException, IOException {

		List<Media> medias = new ArrayList<Media>();
		
		dbConnect();
		
		String sql = "SELECT * FROM media WHERE ( sender=? AND receiver=? ) OR ( receiver=? AND sender=? )";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, user_id);
		pstmt.setInt(2, contact_id);
		pstmt.setInt(3, user_id);
		pstmt.setInt(4, contact_id);
		
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()) {
			
			Media media = new Media();
			
			media.setId(rst.getInt("id"));
			media.setSender(rst.getInt("sender"));
			media.setReceiver(rst.getInt("receiver"));
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
		
		dbClose();
		
		
		return medias;
	}

	public void insertMedia(Integer user_id, Integer contact_id, Media media) throws ClassNotFoundException, SQLException, FileNotFoundException {
		
		long millis=System.currentTimeMillis();  
        Date date=new Date(millis);
        Time time = new Time(millis);
        
		media.setSender(user_id);
		media.setReceiver(contact_id);
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
		
		String sql = "INSERT INTO media(sender, receiver, type, filename, document, description, date, time) VALUES(?,?,?,?,?,?,?,?)";
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
	/*
	private void insertPictureIntoMedia(Media media) throws ClassNotFoundException, SQLException, FileNotFoundException {
		
		
		File file=new File(media.getFilePath());
		FileInputStream fis=new FileInputStream(file);
		
		dbConnect();
		
		String sql = "INSERT INTO media(sender, receiver, type, document, description, date, time) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, media.getSender());
		pstmt.setInt(2, media.getReceiver());
		pstmt.setString(3, media.getType());
		pstmt.setBinaryStream(4 ,fis,(int)file.length());
		pstmt.setString(5, media.getDescription());
		pstmt.setDate(6, media.getDate());
		pstmt.setTime(7, media.getTime());
		
		pstmt.execute();
		
		dbClose();
		
	}
	
	private void insertDocumentIntoMedia(Media media) throws ClassNotFoundException, SQLException, FileNotFoundException {
		
		 File file = new File(media.getFilePath());
         FileInputStream fis = new FileInputStream(file);
   
		dbConnect();
		
		String sql = "INSERT INTO media(sender, receiver, type, document, description, date, time) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, media.getSender());
		pstmt.setInt(2, media.getReceiver());
		pstmt.setString(3, media.getType());
		
		pstmt.setBinaryStream(4 ,fis,(int)file.length());
		
		pstmt.setString(5, media.getDescription());
		pstmt.setDate(6, media.getDate());
		pstmt.setTime(7, media.getTime());
		
		pstmt.execute();
		dbClose();
	}
	*/

	public void deleteMedia(Integer mediaId) throws ClassNotFoundException, SQLException {
	
		dbConnect();
		String sql = "DELETE FROM media WHERE id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, mediaId);
		pstmt.executeUpdate();
		dbClose();
		
	}

	public void deleteMessageFromContact(Integer user_id, Integer contact_id, Integer messageId) throws ClassNotFoundException, SQLException {
		
		String messageTableName = db.getTableName(user_id, contact_id);
		
		dbConnect();
		
		String sql = "DELETE from "+messageTableName.toLowerCase()+" where srno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, messageId);
		pstmt.executeUpdate();
		
		dbClose();
		
	}
}
