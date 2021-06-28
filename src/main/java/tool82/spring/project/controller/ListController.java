package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.ListService;
import tool82.spring.project.service.MemberService;
import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpSession;

@Controller
public class ListController {

    @Autowired
    private ListService lsrv;

    @Autowired private MemberService mbsrv;

    @GetMapping("member/buyerpage")
    public ModelAndView buyerpage(ModelAndView mv,String cp, String mno){
        if (cp == null) cp = "1";
        mv.setViewName("member/buyerpage.tiles");
        mv.addObject("bys", lsrv.readBuy(cp, mno));
        mv.addObject("bycnt", lsrv.countBuy(mno));
        return mv;
    }

    @GetMapping("/member/sellerpage")
    public ModelAndView sellerpage(ModelAndView mv, String cp, String mno){
        if (cp == null) cp = "1";
        mv.setViewName("member/sellerpage.tiles");
        mv.addObject("sls", lsrv.readSell(cp, mno));
        mv.addObject("slcnt", lsrv.countSell(mno));
        return mv;
    }


    @GetMapping("/member/buyfind")
    public ModelAndView buyfind(ModelAndView mv, String cp, String mno,
                                 String findtype, String findkey) {
        if (cp == null) cp = "1";
        mv.setViewName("member/buyerpage.tiles");
        mv.addObject("bys",
                lsrv.readBuy(cp, mno, findtype, findkey));
        mv.addObject("bycnt",
                lsrv.countBuy(findtype, findkey, mno));
        return mv;
    }

    @GetMapping("/member/sellfind")
    public ModelAndView sellfind(ModelAndView mv, String cp, String mno,
                                 String findtype, String findkey) {
        if (cp == null) cp = "1";
        mv.setViewName("member/sellerpage.tiles");
        mv.addObject("sls",
                lsrv.readSell(cp, mno, findtype, findkey));
        mv.addObject("slcnt",
                lsrv.countSell(findtype, findkey, mno));
        return mv;
    }

}
