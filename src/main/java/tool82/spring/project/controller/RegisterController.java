package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.MemberService;
import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class RegisterController {

    @Autowired private MemberService mbsrv;

    @GetMapping("/register/regAgree")
    public String regAgree(){
        return "register/regAgree.tiles";
    }

    @GetMapping("/register/regForm")
    public String regForm(){
        return "register/regForm.tiles";
    }

    @PostMapping("/register/regOk")
    public String regOk(Member m, HttpServletRequest req) {
        mbsrv.newMember(m);
        return "redirect:/member/login.tiles";
    }

    // 아이디 중복검사
    @ResponseBody
    @GetMapping("/member/checkuid")
    public void checkuid(String uid, HttpServletResponse res) {
        try {
            res.getWriter().println(mbsrv.checkUserid(uid));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 로그인
    @GetMapping("member/login")
    public String login(){
        return "member/login.tiles";
    }

    @PostMapping("/member/login")
    public String login(Member m, HttpSession sess) {
        String returnPage = "redirect:/member/loginfail";

        if (mbsrv.checkLogin(m, sess)) returnPage = "redirect:/member/mypage";
        return returnPage;
    }

    // 로그아웃
    @GetMapping("/member/logout")
    public String logout(HttpSession sess) {
        sess.invalidate();
        return "redirect:/";
    }

    // 마이페이지
//    @GetMapping("/member/mypage")
//    public ModelAndView mypage(ModelAndView mv, String uid) {
//        mv.setViewName("member/mypage.tiles");
//        mv.addObject("mb", msrv.readOneMember(uid));
//        return mv;
//    }

    // 마이페이지
    @RequestMapping ("/member/mypage")
    public ModelAndView mypage(ModelAndView mv, HttpSession sess) {
        Member m = mbsrv.readOneMember((String)sess.getAttribute("UID"));
        mv.setViewName("member/mypage.tiles");
        mv.addObject("mb", m);
        return mv;
    }


    // 정보수정
    @RequestMapping("/member/modifyInfo")
    public ModelAndView modifyinfo(ModelAndView mv, HttpSession sess) {
        Member m = mbsrv.readOneMember((String)sess.getAttribute("UID"));
        mv.setViewName("member/modifyInfo.tiles");
        mv.addObject("mb", m);
        return mv;
    }

    @PostMapping("/member/modifyInfo")
    public String modifyOk(Member m) {
        mbsrv.modifyMember(m);
        return "redirect:/member/mypage";
    }


}
