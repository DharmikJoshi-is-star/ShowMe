package com.whatsapp.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.whatsapp.beans.AddContact;
import com.whatsapp.beans.Group;
import com.whatsapp.beans.GroupMessage;
import com.whatsapp.beans.Login;
import com.whatsapp.beans.Media;
import com.whatsapp.beans.Message;
import com.whatsapp.beans.Post;
import com.whatsapp.beans.Request;
import com.whatsapp.beans.Status;
import com.whatsapp.beans.User;
import com.whatsapp.database.DB;
import com.whatsapp.database.DBGroup;
import com.whatsapp.database.DBMessage;

@Controller
public class UserController {

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
	Post post;
	
	@Autowired
	Media media;
	
	/*
	 * This mapping parameter is the starting page for the website 
	 * this map will call by system, and during logout
	 */
	@RequestMapping("/")
	public String showLoginPage(Model model) {

		model.addAttribute("user",user);
		model.addAttribute("login",login);
		
		return "login";
	}
	
	/*Process-login map will call when user will click the login button on login page*/
	@RequestMapping("/process-login")
	public String formProcessing(@Valid @ModelAttribute("login") Login login, 
							BindingResult bindingResult, 
							HttpSession session,
							Model model) {
		
		if(bindingResult.hasErrors()) {
			
			session.setAttribute("msg", "Invalid username/password");
			model.addAttribute("user",user);
			return "login";
		}
			
	
		Boolean status = false;
		try {
			status = db.checkCredentials(login);
			
			if(status == true) {
				int user_id = db.getId(login);
				
				return "redirect:showHome?user_id="+user_id;
		
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("msg", "Invalid username/password");
		model.addAttribute("user",user);
		return "login";
	}
	
	/*
	 * This Map get call when register button is clicked by user on login page
	 */
	@RequestMapping("/process-register-form")
	public String processRegisterForm(@Valid @ModelAttribute("user") User user,
										BindingResult bindingResult, Model model) throws ClassNotFoundException, SQLException {
		
		if(bindingResult.hasErrors()) {
			
			model.addAttribute("user", this.user);
			model.addAttribute("login", login);
			return "login";	
		}
		
		try {
			
			db.insertUser(user);
			
			if(user.getPicture_str()!=null || user.getPicture_str()!="") {
				Post post = new Post();
				post.setPost(user.getPicture_str());
				Login dummyLogin = new Login();
				dummyLogin.setUsername(user.getEmail());
				dummyLogin.setPassword(user.getPassword());
				db.uploadPost(db.getId(dummyLogin), post);
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("login",login);
		model.addAttribute("user",user);
		return "login";
	}
	
	/*
	 * This MAP will show the interface where user can change it's properties
	 */
	@RequestMapping("/show-editprofile-form")
	public String showEditProfileForm(HttpServletRequest request, Model model, HttpSession session) {
		
		Integer user_id = Integer.parseInt(request.getParameter("user_id"));
		
		User user;
		try {
			user = db.getUser(user_id);
			model.addAttribute("user",user);
			
			System.out.print("\n"+user.getName()+"\n");
			System.out.print("\n"+user.getPicture_str()+"\n");
			
			session.setAttribute("image", user.getPicture_str());
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("user_id", user_id);
		return "editprofile";
	}
	
	/*
	 * After changing one or few parameter user will click on the submit button and
	 * below map will get called
	 */
	@RequestMapping("/process-editprofile-form")
	public String processEditProfileForm(@Valid @ModelAttribute("user") User user,
			BindingResult bindingResult, Model model, HttpServletRequest request ,HttpSession session) {
		
		String image = session.getAttribute("image").toString();
		Integer user_id = Integer.parseInt(session.getAttribute("user_id").toString());
		
		System.out.print("\n"+user.getName()+"\n");
		System.out.print("\n"+user.getPicture_str()+"\n");
		System.out.print("\n"+image+"\n");
		
		System.out.print("\n"+"Information"+"\n");
		System.out.print("\n"+user.getId()+"\n");
		System.out.print("\n"+user.getName()+"\n");
		System.out.print("\n"+user.getEmail()+"\n");
		System.out.print("\n"+user.getPassword()+"\n");
		System.out.print("\n"+user.getContact()+"\n");
		System.out.print("\n"+user.getPicture_str()+"\n");
		
		if(user.getPicture_str().isEmpty()) {
			System.out.print("\n"+"Hello1"+"\n");
		}
		
		try {
			db.updateUser(user,image);
		} catch (ClassNotFoundException | FileNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			session.setAttribute("image", db.getImage(user.getId()));
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("user_id", user_id);
		model.addAttribute("user",user);
		
		return "redirect:show-editprofile-form?user_id="+user_id;
	}
	

	/*
	 * This request will mapped when login is successful
	 */
	@RequestMapping("/showHome")
	public String showHome(Model model, @RequestParam("user_id") Integer user_id) {
		
		List<AddContact> contacts;
		try {
			contacts = db.getAllContacts(user_id);
			List<User> users = new ArrayList<User>();
			for(AddContact addContact : contacts) {
						users.add(db.getUser(addContact.getContact_id()));
			}
			List<Group> groups = dbg.getGroups(new Integer(user_id));
			
			users = dbm.checkViewUsers(users, user_id);
			groups = dbg.checkViewGroups(groups, user_id);
			
			model.addAttribute("user_id", user_id);
			model.addAttribute("contacts", contacts);
			model.addAttribute("groups", groups);
			model.addAttribute("users",users);
			model.addAttribute("userStatus",status);
			model.addAttribute("admin", db.getUser(user_id));
			model.addAttribute("database", db);	
			model.addAttribute("model", model);
			long millis=System.currentTimeMillis();  
	        Date date=new Date(millis);
			model.addAttribute("todaysDate",date.getTime() );
			System.out.println("AAJ KI TAREEKH "+date.getDate());
			
		    
		} catch (ClassNotFoundException|IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "home";
	}

	/*
	 * during login process if there are wrong credentials or user choose to logout
	 * below mapping will get called
	 */
	@RequestMapping({"/logout","/login"})
	public String logout() {
		
		return "redirect:/";
	}
	
	/*
	 * view profile will allow to user to view it's properties and other information
	 */
	@RequestMapping("/viewProfile")
	public String viewProfile(@RequestParam("user_id") Integer user_id, Model model) {
		
		User user;
		try {
		
			user = db.getUser(user_id);
			model.addAttribute("user", user);
			model.addAttribute("newPost", post);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "viewProfile";
	}
	
	@RequestMapping("/addPost")
	public String addPost(@ModelAttribute("post") Post post,
							@RequestParam("user_id") Integer user_id) {
		
		try {
			db.uploadPost(user_id, post);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch( FileNotFoundException  fon) {
			String error = "Please Select a Valid File";
		
		}
		
		return "redirect:viewProfile?user_id="+user_id;
	}
	
	@RequestMapping("/deletePost")
	public String deletePost(@RequestParam("user_id") Integer user_id,
			@RequestParam("post_id") Integer post_id) {
		
		try {
			db.deletePost(user_id, post_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:viewProfile?user_id="+user_id;
	}
	
	@RequestMapping("/social")
	public String seePosts(Model model, @RequestParam("user_id") Integer user_id, @RequestParam("postId") String postId){
		try {
			
			User user = db.getUser(user_id);
			List<Post> postsList = new ArrayList<Post>();
			
			for (AddContact addContact : user.getContacts()) {
				List<Post> posts = db.getAllPostByUser(addContact.getContact_id());
				for (Post post : posts) {
					postsList.add(post);
				}
			}
			
			List<Post> posts = user.getPosts();
			
			for (Post post : posts) {
				postsList.add(post);
			}
			
			List<Post> posList = postsList.stream()
					  .sorted(Comparator.comparing(Post::getTime).reversed())
					  .collect(Collectors.toList());
			
			List<Post> sortedPosts = posList.stream()
					  .sorted(Comparator.comparing(Post::getDate).reversed())
					  .collect(Collectors.toList());
			/*
			for (Post post : sortedPosts) {
				
				System.out.println(post.getDate()+"--"+post.getTime());
			}
			*/
			model.addAttribute("user_id",user_id);
			model.addAttribute("posts", sortedPosts);
			model.addAttribute("database", db);
			model.addAttribute("postId", postId);
			
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "social";
	}
	
	@RequestMapping("/likePost")
	public String likePost(Model model, @RequestParam("user_id") Integer user_id, @RequestParam("post_id") Integer post_id){
		
		try {
			db.insertLike(user_id, post_id);
			model.addAttribute("postId", post_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:social?user_id="+user_id;
	}
	
	@RequestMapping("/disLikePost")
	public String disLikePost(Model model, @RequestParam("user_id") Integer user_id, @RequestParam("post_id") Integer post_id){
		
		try {
			db.deleteLike(user_id, post_id);
			model.addAttribute("postId", post_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:social?user_id="+user_id;
	}
	
}

