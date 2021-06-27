package tool82.spring.project.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import tool82.spring.project.vo.Email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {

    @Autowired
    protected JavaMailSender jms;

    public void SendEmail(Email eml) {

        MimeMessage msg = jms.createMimeMessage();
        try{

            msg.setSubject(eml.getSubject());
            msg.setText(eml.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(eml.getReceiver()));

        }catch(MessagingException e){
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        try{

        }catch(MailException e){
            System.out.println("MailException 발생");
            e.printStackTrace();
        }

    }


}
