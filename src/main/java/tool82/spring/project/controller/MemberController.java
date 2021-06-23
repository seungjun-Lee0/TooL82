package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

//    @GetMapping("member/login")
//    public String login(){
//        return "member/login.tiles";
//    }
//
//    @GetMapping("member/modifyInfo")
//    public String modifyInfo(){
//        return "member/modifyInfo.tiles";
//    }

//    @GetMapping("member/mypage")
//    public String mypage(){
//        return "member/mypage.tiles";
//    }

    @GetMapping("member/buyerpage")
    public String buyerpage(){
        return "member/buyerpage.tiles";
    }

    @GetMapping("member/sellerpage")
    public String sellerpage(){
        return "member/sellerpage.tiles";
    }
}
