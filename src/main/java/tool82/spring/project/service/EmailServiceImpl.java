package tool82.spring.project.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.EmailDAO;
import tool82.spring.project.dao.ListDAO;

import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.List;


@Service("emlsrv")
public class EmailServiceImpl implements EmailService {


    @Autowired private EmailDAO emldao;
    @Autowired private JavaMailSenderImpl jmsi;

    private String from = "TooL82관리자 <82tool82@gmail.com>";
    private String subject = "[리딤코드 발송안내]";
    private int j = 0;

    public void sendMail(){
        MimeMessagePreparator[] preparators = new MimeMessagePreparator[getEmail().size()];
        int i = 0;
        for(String to : getEmail()){
            preparators[i++] = new MimeMessagePreparator() {
                @Override
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    int redeemCode = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;

                    String contents = "<div style=\"text-align : center;\"><img src=\"cid:email_logo.png\"></div>" + "<hr style=\"width:771px\"><br>" +
                            "<div style=\"font-size:20px\"><span style=\"color:#7e69fe\">" + getName().get(j) + "</span> 고객님께 "
                            + "구매 신청하신 <span style=\"color:#7e69fe\">'" + getTitle().get(j) +
                            "'</span> 제품의 리딤코드를 발송해드립니다.</div>" + "<br>" +
                            "<div style=\"font-size:20px\">" + "코드번호 : <span style=\"color:#7e69fe\">" +
                            redeemCode +"</span></div>";

                    helper.setFrom(from);
                    helper.setTo(to);
                    helper.setSubject(subject);
                    helper.setText(contents, true);

                    FileSystemResource file = new FileSystemResource(new File("/Users/seungjunlee/Documents/TooL82(11)/src/main/webapp/resources/banner/email_logo.png"));
                    helper.addInline("email_logo.png", file);

                    j++;
                }
            };
        }
        jmsi.send(preparators);
        emailSent();
    }

    @Override
    public void modifyStat() {
        emldao.updateSussStat();
        emldao.updateFailStat();
        emldao.updateSussBuyStat();
        emldao.updateFailBuyStat();
    }

    public List<String> getEmail(){
        return emldao.selectEmail();
    }

    public List<String> getName(){
        return emldao.selectName();
    }

    public List<String> getTitle(){
        return emldao.selectTitle();
    }


    public void emailSent(){
        emldao.updateEmailStat();
    }


}
