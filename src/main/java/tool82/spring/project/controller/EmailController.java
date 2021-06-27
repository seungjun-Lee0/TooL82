package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tool82.spring.project.service.EmailService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
public class EmailController {


    @Autowired
    public EmailService emlsrv;

    @ResponseBody
    @GetMapping("/member/email")
    public void email(String buystat, HttpServletResponse res) {
        try {
            // 응답결과의 유형은 JSON형식으로 설정
            res.setContentType("application/json; charset=UTF-8");
            // 응답결과를 뷰없이 브라우져로 바로 출력
            res.getWriter().print(emlsrv.findEmail(buystat));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
