package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.ListService;
import tool82.spring.project.service.UtilService;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UtilController {

    @Autowired
    private UtilService usrv;
    @Autowired
    private
    ListService lsrv;

    @GetMapping("/util/list")
    public ModelAndView List(ModelAndView mv, String cp){
        if(cp == null) cp = "1";
        mv.setViewName("util/list.tiles");
        mv.addObject("uts", usrv.readUtil(cp));
        mv.addObject("utcnt", usrv.countUtil());
        return mv;
    }

    @GetMapping("/util/detail")
    public ModelAndView Detail(String pno, String mno, ModelAndView mv) {
        mv.setViewName("util/detail.tiles");
        mv.addObject("ut", usrv.readOneUtil(pno));
        mv.addObject("dupcheck", lsrv.duplicateCheck(pno, mno));
        return mv;
    }

    @PostMapping("/util/detail")
    public String buyOK(String pno, String mno, String category, String title,
                        String edate, String sprice) {
        String returnPage = "redirect:/util/list";

        lsrv.newBuyList(pno, mno, category, title, edate, sprice);

        return returnPage;
    }
}
