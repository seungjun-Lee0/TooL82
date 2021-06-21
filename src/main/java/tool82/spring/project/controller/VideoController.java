package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.VideoService;

@Controller
public class VideoController {

    @Autowired
    public VideoService vsrv;

    @GetMapping("/video/list")
    public ModelAndView List(ModelAndView mv, String cp){
        if(cp == null) cp = "1";
        mv.setViewName("video/list.tiles");
        mv.addObject("vds", vsrv.readVideo(cp));
        mv.addObject("vdcnt", vsrv.countVideo());
        return mv;
    }

    @GetMapping("/video/detail")
    public ModelAndView Detail(String pno, ModelAndView mv) {
        mv.setViewName("video/detail.tiles");
        mv.addObject("vd", vsrv.readOneVideo(pno));
        return mv;
    }
}
