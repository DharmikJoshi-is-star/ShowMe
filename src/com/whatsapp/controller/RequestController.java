package com.whatsapp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whatsapp.beans.AddContact;
import com.whatsapp.beans.Group;
import com.whatsapp.beans.Login;
import com.whatsapp.beans.Request;
import com.whatsapp.beans.Status;
import com.whatsapp.beans.User;
import com.whatsapp.database.DB;
import com.whatsapp.database.DBGroup;
import com.whatsapp.database.DBMessage;

@Controller
public class RequestController {


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

	/*
	 * Find friends map will call by user when user want sent friend request to
	 * other users, it can also see already sent requests here, and friend requests
	 * by other users also
	 */
	@RequestMapping("/findFriends")
	public String findFriends(Model model, @RequestParam("userId") Integer userId) {
		
		try {
			List<User> users =  db.getAllUsers();
			List<User> findFriends = users;
			List<AddContact> contacts = db.getAllContacts(userId);
			List<Request> requests = db.getAllRequestsByUser(userId);
			List<Request> requestsToUser = db.getAllRequestsTo(userId);
			
			for (Request request : requestsToUser) {
				if(request.getRequest_by()==12)
						System.out.println("\nAashika Bhatia Has Requested\n");
			}
				//This Loop Will Remove All the my contacts from the other users
				for (AddContact contact : contacts) {
					
					for (User user: users) {
						
						System.out.println("list user id = "+user.getId()+"my contact_id= "+contact.getContact_id());
						
						if(user.getId() == contact.getContact_id()) {
							System.out.println(user.getName()+"\n");
							findFriends.remove(user);
							break;
						}
					}
				}
				
				for(User user: users) {
					if(user.getId() == userId) {
						findFriends.remove(user);
						break;
					}
				}
					
			model.addAttribute("users", findFriends);
			model.addAttribute("requestedUsers", requestsToUser);
			model.addAttribute("alreadyRequestedUsers", requests);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		model.addAttribute("userId", userId);
		return "findFriends";
	}

	/*
	 * this map is called when user sent request to other user
	 */
	@RequestMapping("/sentRequest")
	public String sentRequest(@RequestParam("requestId") Integer requestId,
							@RequestParam("userId") Integer userId) {
		
		try {
			db.addRequest(userId, requestId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:findFriends?userId="+userId;
	}

	/*
	 * when user wants to delete it's sent request to which user sent earlier
	 */	
	@RequestMapping("/deleteRequest")
	public String deleteRequest(@RequestParam("requestId") Integer requestId,
							@RequestParam("userId") Integer userId) {
		
		try {
			db.deleteRequest(userId, requestId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:findFriends?userId="+userId;
	}
	
	/*
	 * check request method will get called when user wants to see how many request
	 * he/she got
	 */
	@RequestMapping("/checkRequest")
	public String checkRequest(Model model, @RequestParam("userId") Integer userId) {
		
		try {
			List<Request> requests = db.getAllRequestsTo(userId);
			List<User> users = new ArrayList<User>();
			
			for (Request request : requests) {
				users.add(db.getUser(request.getRequest_by()));
			}
			
			model.addAttribute("requestedUsers", users);
			model.addAttribute("userId", userId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "checkRequest";
	}

	/*
	 * add friend will get called when user sent's friend request to other users
	 */
	@RequestMapping("/addFriend")
	public String addFriend(@RequestParam("userId") Integer userId,
						@RequestParam("contactId") Integer contactId) {
		try {
			db.addFriend(userId, contactId);
			db.removeRequest(userId, contactId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:checkRequest?userId="+userId;
	}

	/*
	 * This will get called when user accept friend request from the find friend
	 * page
	 */
	@RequestMapping("/addFromFindFriend")
	public String addFromFindFriend(@RequestParam("userId") Integer userId,
						@RequestParam("contactId") Integer contactId) {
		try {
			db.addFriend(userId, contactId);
			db.removeRequest(userId, contactId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:findFriends?userId="+userId;
	}

	/*
	 * this mapp will get called when user click on profile link of other users,
	 * accept his/her friends
	 */  
	@RequestMapping("/showFindFriendProfile")
	public String showFindFriendProfile(Model model,
			@RequestParam("user_id") Integer user_id, @RequestParam("f_id") Integer f_id) {
		
		User request;
		try {
			request = db.getUser(f_id);
			model.addAttribute("request", request);
			model.addAttribute("user_id", user_id);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "showRequestProfile";
	}

	/*
	 * when user visit the profile of from find friends user it can come back by
	 * clicking back link, it will mapp to the below parameter
	 */
	@RequestMapping("/backToFindFriend")
	public String backToFindFriend(@RequestParam("user_id") Integer user_id) {
	
		return "redirect:findFriends?userId="+user_id;
	}
	
	
}
