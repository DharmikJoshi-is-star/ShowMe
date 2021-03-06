package com.whatsapp.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whatsapp.beans.Media;
import com.whatsapp.database.DB;
import com.whatsapp.database.DBGroup;
import com.whatsapp.database.DBMessage;
import com.whatsapp.enums.MediaTypeEnum;

@Controller
public class MediaMessageController {

	@Autowired(required=true)
	DBGroup dbg;
	
	@Autowired(required=true)
	DB db;
	
	@Autowired(required=true)
	DBMessage dbm;
	
	@Autowired
	Media media;
	
	@RequestMapping("/showMedia")
	public String showMedia(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("contact_id") Integer contact_id) {
		
		List<Media> medias;
		try {
			medias = dbm.getAllMediaTransfers(user_id, contact_id);
			model.addAttribute("mediaList", medias);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		model.addAttribute("media", media);
		model.addAttribute("user_id", user_id);
		model.addAttribute("contact_id", contact_id);
		
		return "redirect:showChat?user_id="+user_id+"&contact_id="+contact_id;
	}
	       
	
	@RequestMapping("/mediaRefresh")
	public String mediaRefresh(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("contact_id") Integer contact_id) {
		
		return "redirect:showMedia?user_id="+user_id+"&contact_id="+contact_id;
	}
	
	@RequestMapping("/insertMedia")
	public String insertMedia(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("contact_id") Integer contact_id,
							//@ModelAttribute("media") Media media,
							@RequestParam("type") String type,
							HttpServletRequest request) {
		
		try {
			
			if(type.equals("picture")) {
			 
				 String str = request.getParameter("dataUrlForselectPictureForReceiver").toString();

					File pathFile = new File(request.getParameter("choosePictureForReceiver").toString());
					
					FileOutputStream fos = new FileOutputStream(pathFile);
					
					String b64 = str.substring(str.indexOf(",") + 1);
					
				    byte[] decoder = Base64.getDecoder().decode(b64);
					
				    fos.write(decoder);
				    
				    fos.close();
				    
					media.setFilePath(pathFile.getPath());
				 
				media.setType(MediaTypeEnum.PICTURE.toString());
			}
			if(type.equals("document")) {
				
				String str = request.getParameter("dataUrlForselectDocumentForReceiver").toString();

				File pathFile = new File(request.getParameter("chooseDocumentForReceiver").toString());
				
				FileOutputStream fos = new FileOutputStream(pathFile);
				
				String b64 = str.substring(str.indexOf(",") + 1);
				
			    byte[] decoder = Base64.getDecoder().decode(b64);
				
			    fos.write(decoder);
			    
			    fos.close();
			    
				media.setFilePath(pathFile.getPath());
				
				media.setType(MediaTypeEnum.DOCUMENT.toString());
			}
			if(!media.getFilePath().equals(""))
				dbm.insertMedia(user_id, contact_id, media);
			
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showChat?user_id="+user_id+"&contact_id="+contact_id;
	}
	
	
	@RequestMapping("/insertVideo")
	public String insertVideo(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("contact_id") Integer contact_id,
							@ModelAttribute("media") Media media,
							@RequestParam("type") String type,
							HttpServletRequest request) {
		
		
		System.out.println(media.getFilePath());
		System.out.println("type="+type);
		
		
		try {
			
			if(type.equals("picture")) {
				media.setType(MediaTypeEnum.PICTURE.toString());
			}
			if(type.equals("document")) {
				media.setType(MediaTypeEnum.DOCUMENT.toString());
			}
			if(type.equals("video")) {
				
				String str = request.getParameter("dataUrlForselectVideoForReceiver").toString();

				File pathFile = new File(request.getParameter("chooseVideoForReceiver").toString());
				
				FileOutputStream fos = new FileOutputStream(pathFile);
				
				String b64 = str.substring(str.indexOf(",") + 1);
				
			    byte[] decoder = Base64.getDecoder().decode(b64);
				
			    fos.write(decoder);
			    
			    fos.close();
			    
				media.setFilePath(pathFile.getPath());
				
				
				media.setType(MediaTypeEnum.VIDEO.toString());
			}
			
			if(!media.getFilePath().equals(""))
				dbm.insertMedia(user_id, contact_id, media);
		} catch (ClassNotFoundException  | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showChat?user_id="+user_id+"&contact_id="+contact_id;
	}
	
	@RequestMapping("/insertMediaToGroup")
	public String insertMediaToGroup(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("group_id") Integer group_id,
							@ModelAttribute("media") Media media,
							@RequestParam("type") String type,
							HttpServletRequest request) {
		
		//System.out.println(media.getFilePath());
		System.out.println("type="+type);
		try {
			
			if(type.equals("picture")) {
				
				String str = request.getParameter("dataUrlForselectPictureForGroup").toString();

				File pathFile = new File(request.getParameter("choosePictureForGroup").toString());
				
				FileOutputStream fos = new FileOutputStream(pathFile);
				
				String b64 = str.substring(str.indexOf(",") + 1);
				
			    byte[] decoder = Base64.getDecoder().decode(b64);
				
			    fos.write(decoder);
			    
			    fos.close();
			    
				media.setFilePath(pathFile.getPath());
				
				media.setType(MediaTypeEnum.PICTURE.toString());
			}
			if(type.equals("document")) {
				
				String str = request.getParameter("dataUrlForselectDocumentForGroup").toString();

				File pathFile = new File(request.getParameter("chooseDocumentForGroup").toString());
				
				FileOutputStream fos = new FileOutputStream(pathFile);
				
				String b64 = str.substring(str.indexOf(",") + 1);
				
			    byte[] decoder = Base64.getDecoder().decode(b64);
				
			    fos.write(decoder);
			    
			    fos.close();
			    
				media.setFilePath(pathFile.getPath());
				
				media.setType(MediaTypeEnum.DOCUMENT.toString());
			}
			if(!media.getFilePath().equals(""))
				dbg.insertMediaIntoGroup(user_id, group_id, media);
		} catch (ClassNotFoundException  | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showGroup?user_id="+user_id+"&group_id="+group_id;
	}
	
	
	@RequestMapping("/insertVideoToGroup")
	public String insertVideoToGroup(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("group_id") Integer group_id,
							@ModelAttribute("media") Media media,
							@RequestParam("type") String type,
							HttpServletRequest request) {
		
		System.out.println(media.getFilePath());
		System.out.println("type="+type);
		try {
			
			if(type.equals("picture")) {
				media.setType(MediaTypeEnum.PICTURE.toString());
			}
			if(type.equals("document")) {
				media.setType(MediaTypeEnum.DOCUMENT.toString());
			}
			if(type.equals("video")) {
				
				String str = request.getParameter("dataUrlForselectVideoForGroup").toString();

				File pathFile = new File(request.getParameter("chooseVideoForGroup").toString());
				
				FileOutputStream fos = new FileOutputStream(pathFile);
				
				String b64 = str.substring(str.indexOf(",") + 1);
				
			    byte[] decoder = Base64.getDecoder().decode(b64);
				
			    fos.write(decoder);
			    
			    fos.close();
			    
				media.setFilePath(pathFile.getPath());
				
				media.setType(MediaTypeEnum.VIDEO.toString());
			}
			if(!media.getFilePath().equals(""))
				dbg.insertMediaIntoGroup(user_id, group_id, media);
		} catch (ClassNotFoundException  | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showGroup?user_id="+user_id+"&group_id="+group_id;
	}
	
	@RequestMapping("/deleteMedia")
	public String insertMedia(Model model, 
						@RequestParam("user_id") Integer user_id, 
							@RequestParam("contact_id") Integer contact_id,
							@ModelAttribute("mediaId") Integer mediaId) {
		
		try {
			dbm.deleteMedia(mediaId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:showMedia?user_id="+user_id+"&contact_id="+contact_id;
	}
	
}
