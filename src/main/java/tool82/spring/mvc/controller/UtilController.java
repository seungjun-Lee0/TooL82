package tool82.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.mvc.service.UtilService;

@Controller
public class UtilController {

    @Autowired
    public UtilService usrv;

    @GetMapping("/util/list")
    public ModelAndView List(ModelAndView mv, String cp){
        if(cp == null) cp = "1";
        mv.setViewName("util/list.tiles");
        mv.addObject("uts", usrv.readUtil(cp));
        mv.addObject("utcnt", usrv.countUtil());
        return mv;
    }

    @GetMapping("/util/detail")
    public ModelAndView Detail(String pno, ModelAndView mv) {
        mv.setViewName("util/detail.tiles");
        mv.addObject("ut", usrv.readOneUtil(pno));
        return mv;
    }

}
