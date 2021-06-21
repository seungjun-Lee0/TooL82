package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.MusicService;

@Controller
public class MusicController {

    @Autowired
    public MusicService msrv;

    @GetMapping("/music/list")
    public ModelAndView List(ModelAndView mv, String cp){
        if(cp == null) cp = "1";
        mv.setViewName("music/list.tiles");
        mv.addObject("mcs", msrv.readMusic(cp));
        mv.addObject("mccnt", msrv.countMusic());
        return mv;
    }

    @GetMapping("/music/detail")
    public ModelAndView Detail(String pno, ModelAndView mv) {
        mv.setViewName("music/detail.tiles");
        mv.addObject("mc", msrv.readOneMusic(pno));
        return mv;
    }

}
