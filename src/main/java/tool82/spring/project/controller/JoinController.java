package tool82.spring.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;

@Controller
    public class JoinController {

        @Autowired
        private MemberService msrv;

        @GetMapping("/join/agree")
        public String agree() {
            return "join/agree.tiles";
        }

        @GetMapping("/join/checkme")
        public String checkme() {
            return "join/checkme.tiles";
        }

        @PostMapping("/join/joinme")
        public String joinme() {
            return "join/joinme.tiles";
        }

        @PostMapping("/join/joinok")
        public String joinok(Member m, HttpServletRequest req) {

            msrv.newMember(m);

            return "join/joinok.tiles";
        }


        @ResponseBody
        @GetMapping("/join/checkuid")
        public void checkuid(String uid, HttpServletResponse res) {
            try {
                res.getWriter().println( msrv.checkUserid(uid) );
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        @PostMapping("/join/login")
        public String login(Member m, HttpSession sess) {
            String returnPage = "redirect:/join/loginfail";

            if (msrv.checkLogin(m, sess)) // 로그인 성공시
                returnPage = "redirect:/";

            return returnPage;
        }

        @GetMapping("/join/logout")
        public String logout(HttpSession sess) {
            sess.invalidate();

            return "redirect:/";
        }

    }

