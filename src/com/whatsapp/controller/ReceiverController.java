package com.whatsapp.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whatsapp.beans.AddContact;
import com.whatsapp.beans.Conversation;
import com.whatsapp.beans.Group;
import com.whatsapp.beans.Login;
import com.whatsapp.beans.Media;
import com.whatsapp.beans.Message;
import com.whatsapp.beans.Post;
import com.whatsapp.beans.Status;
import com.whatsapp.beans.User;
import com.whatsapp.database.DB;
import com.whatsapp.database.DBGroup;
import com.whatsapp.database.DBMessage;

@Controller
public class ReceiverController {


	@Autowired(required=true)
	DBGroup dbg;
	
	@Autowired
	Status status;
	
	@Autowired
	User user;
	
	@Autowired
	Login login;
	
	@Autowired
	AddContact addcontact;
	
	@Autowired(required=true)
	DB db;
	
	@Autowired(required=true)
	DBMessage dbm;
	
	@Autowired
	Group group;
	
	@Autowired
	Media media;

	/*
	 * Show receiver will get call when user click on contacts profile
	 */
	@RequestMapping("/showReceiver")
	public String showReceiver(Model model,
								@RequestParam("user_id") Integer user_id,
								@RequestParam("contact_id") Integer contact_id) {
		
		User receiver;
		try {
			receiver = db.getUser(contact_id);
			model.addAttribute("receiver", receiver);
			model.addAttribute("user_id", user_id);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "showReceiver";
	}

	/*
	 * when user wants to remove friend from it contact it will visit contact
	 * profile and will click on remove friend link
	 */ 
	@RequestMapping("/removeFriend")
	public String removeFriend(Model model,
								@RequestParam("user_id") Integer user_id,
								@RequestParam("contact_id") Integer contact_id){
		
		try {
			db.removeFriend(user_id, contact_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showHome?user_id="+user_id;
	}
	
	//this request will mapped when user will send message to receiver
		@RequestMapping("/send-message")
		public String sendMessage(Model model,
									HttpServletRequest request,
									@RequestParam("user_id") Integer user_id,
									@RequestParam("contact_id") Integer contact_id){
			
			String message = request.getParameter("message");
			
			if(!message.equals("")) {
			
			try {
				
				dbm.insertMessage(user_id, message, contact_id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			}
			return "redirect:showChat?user_id="+user_id+"&contact_id="+contact_id;
		}
		
		//This request is mapped when user will select to chat
		@RequestMapping("/showChat")
		public String showChat(Model model,
								@RequestParam("contact_id") Integer contact_id,
								@RequestParam("user_id") Integer user_id) {
			
			List<Message> messages = new ArrayList<>();
			
			try {
				User receiver = db.getUser(contact_id);
				messages = dbm.getAllMessages(user_id,contact_id);
				
				List<AddContact> contacts = db.getAllContacts(user_id);
				List<User> users = new ArrayList<User>();
				
				for(AddContact addContact : contacts) {
							users.add(db.getUser(addContact.getContact_id()));
				}
				users = dbm.checkViewUsers(users, user_id);
				List<Group> groups = dbg.getGroups(new Integer(user_id));
				groups = dbg.checkViewGroups(groups, user_id);	
				System.out.print(receiver.getName()+"-->receiver");
				
				List<Media> medias = dbm.getAllMediaTransfers(user_id, contact_id);
				
				for (Media media : medias) {
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
					
					messages.add(m);
				}
				
				List<Message> messageList = messages.stream()
						  .sorted(Comparator.comparing(Message::getTime))
						  .collect(Collectors.toList());
				
				messages = messageList.stream()
						  .sorted(Comparator.comparing(Message::getDate))
						  .collect(Collectors.toList());
				
				List<Conversation> conversationList = new ArrayList<>();
				
				for (User user : users) {
					Conversation conversation = new Conversation();
					conversation.setUser(user);
					
					if(user.getLastMessage()==null) 
						user.setConversationDealy(new Long("9999999999"));
					
					conversation.setConversationDealy(user.getConversationDealy());
					
					conversation.setGroup(null);
					
					conversationList.add(conversation);
				}
				
				for (Group group : groups) {
					
					Conversation conversation = new Conversation();
					conversation.setUser(null);
					
					if(group.getLastMessage()==null) 
						group.setConversationDealy(new Long("9999999999"));
					
					conversation.setConversationDealy(group.getConversationDealy());
					
					conversation.setGroup(group);
					
					conversationList.add(conversation);
				
				}
				
				conversationList = conversationList.stream()
						  .sorted(Comparator.comparing(Conversation::getConversationDealy))
						  .collect(Collectors.toList());
				
				
			/*
			 * List<User> userList = users.stream()
			 * .sorted(Comparator.comparing(User::getLastMessageTime).reversed())
			 * .collect(Collectors.toList());
			 * 
			 * users = userList.stream()
			 * .sorted(Comparator.comparing(User::getLastMessageTime).reversed())
			 * .collect(Collectors.toList());
			 
				users = users.stream()
						  .sorted(Comparator.comparing(User::getConversationDealy))
						  .collect(Collectors.toList());
			*/	
				
			/*
			 * for (User user : users) if(user.getLastMessage()==null)
			 * user.setConversationDealy(new Long("9999999999"));
			 * 
			 * users = users.stream()
			 * .sorted(Comparator.comparing(User::getConversationDealy))
			 * .collect(Collectors.toList());
			 * 
			 * for (Group g : groups) if(g.getLastMessage()==null)
			 * g.setConversationDealy(new Long("9999999999"));
			 * 
			 * groups = groups.stream()
			 * .sorted(Comparator.comparing(Group::getConversationDealy))
			 * .collect(Collectors.toList());
			 */
				model.addAttribute("conversationList", conversationList);
				model.addAttribute("mediaDoc", media);
				model.addAttribute("receiver", receiver);
				model.addAttribute("messages", messages);
				model.addAttribute("user_id", user_id);
				model.addAttribute("contacts", contacts);
				model.addAttribute("groups", groups);
				model.addAttribute("users",users);
				model.addAttribute("userStatus",status);
				model.addAttribute("admin", db.getUser(user_id));
				model.addAttribute("database", db);
				model.addAttribute("model", model);
				model.addAttribute("media", media);
				long millis=System.currentTimeMillis();  
		        Date date=new Date(millis);
				model.addAttribute("todaysDate",date );
			} catch (ClassNotFoundException | SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "home";
		}

	/*
	 * refersh will refresh the messages between user and receiver
	 */
		@RequestMapping("/refresh")
		public String refreshMessages(@RequestParam("user_id") Integer user_id,
										@RequestParam("contact_id") Integer contact_id) {
			
			return "redirect:showChat?user_id="+user_id+"&contact_id="+contact_id;
		}
		
		
		
		
}
