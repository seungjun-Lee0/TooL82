package tool82.spring.project.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.EmailDAO;

import javax.mail.internet.MimeMessage;


@Service("emlsrv")
public class EmailServiceImpl implements EmailService {


    @Autowired private EmailDAO emldao;
    @Autowired private JavaMailSender jms;


    @Override
    public void test() {
        System.out.println("실험");
    }

    private String from = "82tool82@gmail.com";
    private String subject = "테스트 제목";



    public String sendMail() {
        try {
            MimeMessage mm = jms.createMimeMessage();
            MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "UTF-8");
            mmh.setTo("withsoonj@gmail.com");
            mmh.setText("테스트 내용");
            mmh.setFrom(from);
            mmh.setSubject(subject);

            jms.send(mm);
        } catch(Exception e){
            System.out.println("전송 실패...");
        }
        return "전송 성공!!!"; }

    @Override
    public String findEmail(String buystat) {
        ObjectMapper mapper = new ObjectMapper();
        String json = "";

        buystat = buystat + "%";

        try {
            json = mapper.writeValueAsString(
                    emldao.selectEmail(buystat)
            ); // 제이슨 코드로 바꿔줌
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return json;
    }

    @Override
    public void modifyStat() {
        System.out.println("실험2");
        emldao.updateSussStat();
        emldao.updateFailStat();
        emldao.updateSussBuyStat();
        emldao.updateFailBuyStat();
    }


}
