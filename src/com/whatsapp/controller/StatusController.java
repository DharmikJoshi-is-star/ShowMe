package com.whatsapp.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whatsapp.beans.AddContact;
import com.whatsapp.beans.Group;
import com.whatsapp.beans.Login;
import com.whatsapp.beans.Status;
import com.whatsapp.beans.User;
import com.whatsapp.database.DB;
import com.whatsapp.database.DBGroup;
import com.whatsapp.database.DBMessage;

@Controller
public class StatusController {


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
	 * add status will get called when user wanted to add a new status
	 */
	@RequestMapping("/addStatus")
	public String addStatus(@ModelAttribute("userStatus") Status status, @RequestParam("user_id") Integer user_id, HttpServletRequest request) {
		
		try {
			
			String str = request.getParameter("dataUrlForselectStatusForReceiver").toString();

			File pathFile = new File(request.getParameter("chooseStatusForReceiver").toString());
			
			FileOutputStream fos = new FileOutputStream(pathFile);
			
			String b64 = str.substring(str.indexOf(",") + 1);
			
		    byte[] decoder = Base64.getDecoder().decode(b64);
			
		    fos.write(decoder);
		    
		    fos.close();
			
		    status.setStatusPicture( pathFile.getPath() );
		    
			if(status.getStatusPicture()!=null)
				db.InsertStatusByUserId(user_id, status.getStatusPicture());
		} catch (ClassNotFoundException  | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showHome?user_id="+user_id;
	}

	/*
	 * remove status will called by the user if user want delete the selected status
	 */  
	@RequestMapping("/removeStatus")
	public String removeStatus(@RequestParam("user_id") Integer user_id,
								@RequestParam("status_id") Integer status_id) {
		
		try {
			db.deleteStatusByStatusId(status_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showHome?user_id="+user_id;
	}
}
