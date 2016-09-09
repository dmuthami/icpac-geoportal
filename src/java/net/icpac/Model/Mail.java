
package net.icpac.Model;
/**
 *
 * @author david
 */
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Message;
import javax.mail.Session;
import org.json.JSONException;
import org.json.JSONObject;
public class Mail {
String senderID;
String senderPassword;
String hostName;
int portNumber;
String attachmentPath;
String subject;
String body;
String cc;
String bcc;


// #=============================================================================================#
public String getBcc() {
    return bcc;
}

// #=============================================================================================#
public void setBcc(String bcc) {
    this.bcc = bcc;
}

// #=============================================================================================#
public String getCc() {
    return cc;
}

// #=============================================================================================#
public void setCc(String cc) {
    this.cc = cc;
}

// #=============================================================================================#
public String getBody() {
    return body;
}

// #=============================================================================================#
public void setBody(String body) {
    this.body = body;
}

// #=============================================================================================#
public String getSubject() {
    return subject;
}

// #=============================================================================================#
public void setSubject(String subject) {
    this.subject = subject;
}

// #=============================================================================================#

public String getSenderID() {
    return senderID;
}

// #=============================================================================================#
public void setSenderID(String senderID) {
    this.senderID = senderID;
}

public String getSenderPassword() {
    return senderPassword;
}

// #=============================================================================================#
public void setSenderPassword(String senderPassword) {
    this.senderPassword = senderPassword;
}

// #=============================================================================================#
public String getHostName() {
    return hostName;
}

// #=============================================================================================#
public void setHostName(String hostName) {
    this.hostName = hostName;
}

// #=============================================================================================#
public int getPortNumber() {
    return portNumber;
}

// #=============================================================================================#
public void setPortNumber(int portNumber) {
    this.portNumber = portNumber;
}

// #=============================================================================================#
public String getAttachmentPath() {
    return attachmentPath;
}

// #=============================================================================================#
public void setAttachmentPath(String attachmentPath) {
    this.attachmentPath = attachmentPath;
}

// #=============================================================================================#

public String sendMail() throws UnsupportedEncodingException, JSONException {
 Properties props = new Properties();
 Session session = Session.getDefaultInstance(props, null);
 JSONObject status = new JSONObject();
 String responses=null;
    try {
      Message msg = new MimeMessage(session);
      msg.setFrom(new InternetAddress("info@icpac.net", "www.icpac.net"));//from
      msg.addRecipient(Message.RecipientType.TO,
                       new InternetAddress("daudi2010@gmail.com", "Mr David"));// recipient
      msg.setSubject("Your Message from icpac");//subject
      //msg.setHeader("Hi, everyone"); 
      msg.setText("Thanks for contacting us.We appreciate your effort in writing to us.");// message body
      Transport.send(msg);
       // send  json back
          
	status.put("type","success");
	status.put("message", "Thank you for contacting us. As early as possible  we will contact you ");
        responses=status.toString();
    } catch (AddressException e) {
      // ...
    } catch (MessagingException | UnsupportedEncodingException e) {
      // ...
    }
    return  responses;
}// sendmail()


}// mail
