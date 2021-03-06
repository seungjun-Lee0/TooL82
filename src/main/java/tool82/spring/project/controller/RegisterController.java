package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tool82.spring.project.service.MemberService;
import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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

    @GetMapping("member/loginfail")
    public String loginfail() { return "member/loginfail.tiles"; }

    @PostMapping("/member/login")
    public String login(Member m, HttpSession sess , RedirectAttributes ra) {
        String returnPage = "";

        if (mbsrv.checkLogin(m, sess)) returnPage = "redirect:/";
        else{
            ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다!!");
            ra.addFlashAttribute("url","/member/login");
            return "redirect:/member/loginfail"; // alert 후, 전달된 url 파라미터로 이동시키는 페이지
        }
        return returnPage;
    }

    // 로그아웃
    @GetMapping("/member/logout")
    public String logout(HttpSession sess) {
        sess.invalidate();
        return "redirect:/";
    }

    // 마이페이지
    @RequestMapping ("/member/mypage")
    public ModelAndView mypage(ModelAndView mv, HttpSession sess) {
//        Member m = mbsrv.readOneMember((String)sess.getAttribute("MyInfo"));
        mv.setViewName("member/mypage.tiles");
        mv.addObject("mb", sess.getAttribute("MyInfo"));
        return mv;
    }


    // 정보수정
    @RequestMapping("/member/modifyInfo")
    public ModelAndView modifyinfo(ModelAndView mv, HttpSession sess) {
        mv.setViewName("member/modifyInfo.tiles");
        return mv;
    }

    @PostMapping("/member/modifyInfo")
    public String modifyOk(Member m, ModelAndView mv, HttpSession sess) {
        mbsrv.modifyMember(m, sess);
        mv.addObject("mb", sess.getAttribute("MyInfo"));
        return "redirect:/member/mypage";
    }

    // 회원탈퇴
    @GetMapping("/member/remove")
    public String removeMember() {
        return "member/removeMember.tiles";
    }

    @GetMapping("/member/removeFail")
    public String removeFail() {
        return "member/removeFail.tiles";
    }


    @PostMapping("/member/remove")
    public String removeOk(Member m, HttpSession sess, RedirectAttributes ra, HttpServletResponse res) {

        if (mbsrv.removeMember(m) == "fail") {
        ra.addFlashAttribute("rmvmsg", "현재 구매 또는 판매가 진행중인 상품이 있습니다. 확인 후 탈퇴를 진행해 주세요!");
        ra.addFlashAttribute("rmvurl", "/member/mypage");
        return "redirect:/member/removeFail";
        }
        else {
            res.setContentType("text/html; charset=UTF-8");
            PrintWriter out = null;
            try {
                out = res.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.println("<script>alert('정상적으로 탈퇴되었습니다!'); location.href=\"/\";</script>");
            out.flush();

        mbsrv.removeMember(m);
        sess.invalidate();}
        return "redirect:/";
    }
}
