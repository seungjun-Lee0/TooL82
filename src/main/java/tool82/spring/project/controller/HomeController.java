package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.HomeService;

@Controller
public class HomeController {
    @Autowired private HomeService hsrv;

    @GetMapping("/")
    public ModelAndView homepage(ModelAndView mv){
        mv.setViewName("home.tiles");
        mv.addObject("hms", hsrv.readList());
        mv.addObject("hmns", hsrv.readNoticeList());
        return mv;
    }



}
