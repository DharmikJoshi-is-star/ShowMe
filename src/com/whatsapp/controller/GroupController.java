package com.whatsapp.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whatsapp.beans.AddContact;
import com.whatsapp.beans.Conversation;
import com.whatsapp.beans.Group;
import com.whatsapp.beans.GroupMessage;
import com.whatsapp.beans.Login;
import com.whatsapp.beans.Media;
import com.whatsapp.beans.Status;
import com.whatsapp.beans.User;
import com.whatsapp.database.DB;
import com.whatsapp.database.DBGroup;
import com.whatsapp.database.DBMessage;

@Controller
public class GroupController {

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
	 * when user wants to create a new group will select the new group link from
	 * it's menu options This will show the group form
	 */
	@RequestMapping("/show-group-form")
	public String showGroupForm(@RequestParam("user_id")Integer user_id, HttpSession session, Model model) {
		
		//Integer user_id = new Integer(session.getAttribute("user_id").toString());
		System.out.print(user_id);
		
		List<AddContact> contacts;
		try {
			contacts = db.getAllContacts(user_id);
			session.setAttribute("user_id", user_id);
			session.setAttribute("contacts", contacts);
				
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		group.setAdmin_id(user_id);
		model.addAttribute("group",group);
		return "groupform";
	}

	/*
	 * create group is process where after inserting the information in group form
	 * user will click on the create group button that is mapped with the beow
	 * parameter this will create a new group and will redirect to home page
	 */
	@RequestMapping("/create-group")
	public String createGroup(Model model, HttpSession session, @Valid @ModelAttribute("group") Group group) {
		
		String user_id = session.getAttribute("user_id").toString();
		
		System.out.print(group.getAdmin_id());
		System.out.print(group.getGroup_name());
		
		List<Integer> members = group.getMembers_id();
		
		members.add(new Integer(user_id));
		
		group.setMembers_id(members);
		
		for (Integer integer : members) {
			System.out.print(integer+"\n");
		}
		
		group.setTotal_members(members.size());
		
		try {
			dbg.createGroup(group);
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("user_id", user_id);
		return "redirect:/showHome";
	}
	
	/*
	 * show group will get called when member of group wants to see the information
	 * of group
	 */
	/*
	@RequestMapping("/showgroup")
	public String showgroup(Model model,
							HttpSession session, 
							@RequestParam("id") Integer group_id,
							@RequestParam("user_id") Integer user_id) {
	
		try {
			
			Group group = dbg.getGroupInformation(group_id);
			List<User> members = dbg.getGroupMembersInformation(group.getMembers_id());
			session.setAttribute("group", group);
			session.setAttribute("members", members);
			session.setAttribute("user_id", user_id);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		GroupMessage gmessage =new GroupMessage();
		model.addAttribute("gmessage",gmessage);
		
		return "showgroup";
	}
	*/

	/*
	 * refresh group refreshes the messages of group
	 */
	@RequestMapping("/refreshGroup")
	public String refreshGroup(
			@RequestParam("user_id") Integer user_id,
			@RequestParam("group_id") Integer group_id
			) {
		
		return "redirect:showGroup?group_id="+group_id+"&user_id="+user_id;
	}
	
	
	//This request will get mapped when user will select group chat
		@RequestMapping("/showGroup")
		public String showGroup(Model model,
								@RequestParam("user_id") Integer user_id,
								@RequestParam("group_id") Integer group_id) {
			
			try {
				GroupMessage gmessage = new GroupMessage();
				Group group = dbg.getGroupInformation(user_id, group_id);
				
				List<User> members = dbg.getGroupMembersInformation(group.getMembers_id());
				
			/*
			 * System.out.println("****************************************************");
			 * System.out.println("group="+group);
			 * System.out.println("group.getGroup_name()="+group.getGroup_name());
			 * System.out.println("group.getMessages()="+group.getMessages());
			 */
				for (GroupMessage g : group.getMessages()) {
					System.out.println("Media "+g.getMediaId()+"\n");
				}
				
			/*
			 * System.out.println("****************************************************");
			 */
				model.addAttribute("gmessage", gmessage);
				model.addAttribute("groupobj", group);
				model.addAttribute("members", members);
				//model.addAttribute("user_id", user_id);
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//List<AddContact> contacts;

			List<User> users;
			
			
			try {
				//contacts = db.getAllContacts(user_id);
				//List<User> users = new ArrayList<User>();
			/*
			 * for(AddContact addContact : contacts) {
			 * users.add(db.getUser(addContact.getContact_id())); }
			 */
				users = db.getAllUserContactsWithNecessaryStatus(user_id);
				
				List<Group> groups= dbg.getGroupInformationForHome(user_id);
				
				groups = dbg.checkViewGroups(groups, user_id);
				
				users = dbm.checkViewUsers(users, user_id);
				
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
			
				model.addAttribute("conversationList",conversationList);
				model.addAttribute("media", media);
				model.addAttribute("user_id", user_id);
				//model.addAttribute("contacts", contacts);
				model.addAttribute("groups", groups);
				//model.addAttribute("users",users);
				model.addAttribute("userStatus",status);
				model.addAttribute("admin", db.getNeccessaryStatusUserValues(user_id));
				model.addAttribute("database", db);
				long millis=System.currentTimeMillis();  
		        Date date=new Date(millis);
				model.addAttribute("todaysDate",date );
			
			} catch (ClassNotFoundException|IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "home";
		}

	/*
	 * sent message will get called when user type some message and click on sent
	 * button this will redirect to us on the group chat frame
	 */
		@RequestMapping("/sentMessageGroup")
		public String sendMessageGroup(HttpServletRequest request ,
										Model model,
										@ModelAttribute("gmessage") GroupMessage gmessage,
										@RequestParam("user_id") Integer user_id,
										@RequestParam("group_id") Integer group_id,
										@RequestParam("tableName") String tableName) {
			
			
			if(gmessage.getMsg()!=null && !gmessage.getMsg().equals("") ) {
				
				try {
					System.out.println("2");
					dbg.insertGroupMessage(user_id, gmessage.getMsg(), tableName);
					System.out.println("3");
				} catch (ClassNotFoundException | SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			System.out.println("5");
			
			return "redirect:showGroup?user_id="+user_id+"&group_id="+group_id;
		}
		
		/*
		 * show group will get called when member of group wants to see the information
		 * of group
		 */
		@RequestMapping("/groupInformation")
		public String groupInformation(Model model,
										@RequestParam("user_id") Integer user_id,
										@RequestParam("group_id") Integer group_id) {
			
			Group group;
			
			try {
				List<User> users = new ArrayList<User>();
				group = dbg.getGroupInformation(user_id,group_id);
				
				for (Integer id : group.getMembers_id()) {
						users.add(db.getUser(id));
				}
					
				
				model.addAttribute("users", users);
				model.addAttribute("group", group);
				model.addAttribute("admin", db.getNeccessaryStatusUserValues(group.getAdmin_id()));
			} catch (ClassNotFoundException |IOException| SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			model.addAttribute("user_id", user_id);
			return "showgroup";
		}
		
	/*
	 * when user click on leave group link present in show group page below
	 * paremeter will get mapped
	 */
		@RequestMapping("/leaveGroup")
		public String leaveGroup(@RequestParam("user_id") Integer user_id,
								@RequestParam("group_id") Integer group_id) {
			
			try {
				dbg.leaveGroup(user_id, group_id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:showHome?user_id="+user_id;
		}

	/*
	 * When user wants to add members in present group below parameter will get
	 * called
	 * 
	 */
		@RequestMapping("/addMember")
		public String addMember(Model model, @RequestParam("user_id") Integer user_id,
								@RequestParam("group_id") Integer group_id) {
			
			
			try {
				List<AddContact> nonMembers = new ArrayList<AddContact>();
				Group group = dbg.getGroupInformation(user_id, group_id);
				List<AddContact> contacts = db.getAllContacts(user_id);
				for (AddContact addContact : contacts) {
					System.out.print(addContact.getName());
					nonMembers.add(addContact);
				}
				System.out.print("total contacts= "+contacts.size());
				
			for (AddContact contact : contacts) {
				
				for (Integer memberId : group.getMembers_id()) {
					
					System.out.print("contact id="+contact.getContact_id()+"---"+"Group Member Id="+memberId+"\n");
					
					if(contact.getContact_id() == memberId) {
						
						System.out.print("yes");
						
						nonMembers.remove(contact);
						break;
						
					}
				}
			}
			
			List<User> users = new ArrayList<User>();
			
			for (AddContact addContact1 : nonMembers) {
				users.add(db.getUser(addContact1.getContact_id()));
			}
			
			model.addAttribute("user_id", user_id);
			model.addAttribute("nonMembers", users);
			model.addAttribute("group", group);
			
			} catch (ClassNotFoundException | SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return "addMember";
		}

	/*
	 * from the page add members user click on add link will get mapped to below
	 * parameter
	 */ 
		@RequestMapping("/addFriendToGroup")
		public String addFriendToGroup(@RequestParam("user_id") Integer user_id,
										@RequestParam("contact_id") Integer contact_id,
										@RequestParam("group_id") Integer group_id) {
			
			try {
				dbg.addMemberById(group_id, contact_id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:addMember?user_id="+user_id+"&group_id="+group_id;
		}
		
	/*
	 * when admin want to remove the member of group below parameter will get mapped
	 */
		@RequestMapping("/removeMember")
		public String removeMember(@RequestParam("user_id") Integer user_id,
									@RequestParam("member_id") Integer member_id,
									@RequestParam("group_id") Integer group_id) {
			
			try {
				dbg.leaveGroup(member_id, group_id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:groupInformation?user_id="+user_id+"&group_id="+group_id;
		}
		
	
}
