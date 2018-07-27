package com.scalar.web.servicePack;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;

import com.scalar.web.userModelPack.Mail;    

public class Mailer{  
	
    public static String send(String from,String password,String to,String sub,String msg){  
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
	           Message message = new MimeMessage(session);    
	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
	           message.setSubject(sub);    
	           message.setContent(msg, "text/html");    
	           //send message  
	           Transport.send(message);    
	           
	           return null;
          }
          catch (MessagingException e) {
        	  String WalertMsg = "Something went Wrong..Please Try Again Later";
        	  e.printStackTrace();
        	  return WalertMsg;
          }
		   
             
    }
    
    public static List<Mail> receive() {
    	
    	try{
    		
    		
    		java.util.Properties properties = System.getProperties();
    		properties.setProperty("mail.store.protocol", "imaps");
    		javax.mail.Session s = javax.mail.Session.getInstance(properties, null);
    		//create session instance
    		System.out.println("Connected");
    		
    		javax.mail.Store store = s.getStore("imaps");//create store instance
    		store.connect("pop.gmail.com", "scalartourguide@gmail.com", "scalartourguide18");
    		//set your user_name and password
    		System.out.println(store);
    		Folder inbox = store.getFolder("inbox");
    		//set folder from where u wants to read mails
    		inbox.open(Folder.READ_WRITE);//set access type of Inbox
    		Message messages[] = inbox.getMessages();// gets inbox messages
    		int m  = messages.length;
    		Mail mail = null;
			List<Mail> mail_list = new ArrayList<>();
    		for (int i = 0; i < m ;i++) {
    		
    			
    			
    			System.out.println("From : " + messages[i].getFrom()[0]); //print email id of sender System.out.println("Sub : " + messages[i].getSubject()); //print subject of email
    			System.out.println("Receive Date:"+messages[i].getReceivedDate());
        		System.out.println("Subject:"+messages[i].getSubject());
        		
        		
        		Object content = messages[i].getContent();
    			// check for string	
    			// then check for multipart
    			if (content instanceof String) {
    				System.out.println(content);
    				mail = new Mail(messages[i].getFrom()[0], messages[i].getReceivedDate(), messages[i].getSubject(), (String) messages[i].getContent());
    				mail_list.add(mail);
    				
    			} else if (content instanceof Multipart) {
    				Multipart multiPart = (Multipart) content;
    			
    				int multiPartCount = multiPart.getCount();
    				for (int j = 0; j < multiPartCount; j++) {
    					BodyPart bodyPart = multiPart.getBodyPart(j);
    					Object o;
    					o = bodyPart.getContent();
    					if (o instanceof String) {
    						System.out.println(o);
    						mail = new Mail(messages[i].getFrom()[0], messages[i].getReceivedDate(), messages[i].getSubject(), (String)o);
    						mail_list.add(mail);
    					}

    				}
    				
    			}
    			
    			
    			
    			
    		
    		}
    		return mail_list;
    	}catch(Exception e) { 
    		e.printStackTrace();return null; 
    	}
		
		
		
		
		
    }
}