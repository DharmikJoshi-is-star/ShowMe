package com.whatsapp.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.whatsapp.beans.User;

public class ShowMeEmail {

	private Properties emailProperties;
	private Session mailSession;
	private MimeMessage emailMessage;

	private void setMailServerProperties() {

		String emailPort = "587";//gmail's smtp port

		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");
	}

	public void sendEmailMessage(User user) throws AddressException, MessagingException {
		
		//String mailId,String mailSubject,String mailBody
		String mailId = user.getEmail();
		
		String mailSubject = "regarding to your successful registration ShowMe portal";
		
		String mailBody = "Welcome to ShowMe portal\n"
							+"Username: "+user.getEmail()+"\n"
							+"Password: "+user.getPassword()+"\n"
							+"You can sent request to other users, can upload, like, comment on friends profile, can create new group among with with friends\n"
							+"By clicking on below link you can login into your account\n"
							+"http://wtfmedia.jelastichosting.nl/";
		
		setMailServerProperties();
		  
		String[] toEmails = {mailId};
		String emailSubject = mailSubject;
		String emailBody = mailBody;
  
		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);

		for (int i = 0; i < toEmails.length; i++) {
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
		}

		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html");//for a html email
		//emailMessage.setText(emailBody);// for a text email
		
		sendEmail();

	}

	private void sendEmail() throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "socialmediaapp2020@gmail.com";//just the id alone without @gmail.com
		String fromUserEmailPassword = "sid19992020";

		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		transport.close();
		System.out.println("Email sent successfully.");
	}
}
