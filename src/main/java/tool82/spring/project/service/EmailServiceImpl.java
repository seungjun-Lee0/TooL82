package tool82.spring.project.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.EmailDAO;
import tool82.spring.project.dao.ListDAO;

import javax.mail.internet.MimeMessage;
import java.util.List;


@Service("emlsrv")
public class EmailServiceImpl implements EmailService {


    @Autowired private EmailDAO emldao;
    @Autowired private JavaMailSenderImpl jmsi;

    private String from = "82tool82@gmail.com";
    private String subject = "테스트 제목";

    public void sendMail(){
        MimeMessagePreparator[] preparators = new MimeMessagePreparator[getEmail().size()];
        int i = 0;
        for(String to : getEmail()){
            preparators[i++] = new MimeMessagePreparator() {
                @Override
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    helper.setFrom(from);
                    helper.setTo(to);
                    helper.setText("테스트");
                    helper.setSubject(subject);
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

    public void emailSent(){
        emldao.updateEmailStat();
    }


}
