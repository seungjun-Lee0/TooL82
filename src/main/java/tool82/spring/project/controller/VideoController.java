package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.ListService;
import tool82.spring.project.service.VideoService;

import java.util.HashMap;
import java.util.Map;

@Controller
public class VideoController {

    @Autowired
    private VideoService vsrv;
    @Autowired
    private ListService lsrv;

    @GetMapping("/video/list")
    public ModelAndView List(ModelAndView mv, String cp){
        if(cp == null) cp = "1";
        mv.setViewName("video/list.tiles");
        mv.addObject("vds", vsrv.readVideo(cp));
        mv.addObject("vdcnt", vsrv.countVideo());
        return mv;
    }

    @GetMapping("/video/detail")
    public ModelAndView Detail(String pno, String mno, ModelAndView mv) {
        mv.setViewName("video/detail.tiles");
        mv.addObject("vd", vsrv.readOneVideo(pno));
        mv.addObject("dupcheck", lsrv.duplicateCheck(pno, mno));
        return mv;
    }

    @PostMapping("/video/detail")
    public String buyOK(String pno, String mno, String category, String title,
                        String edate, String sprice) {
        String returnPage = "redirect:/video/list";

        lsrv.newBuyList(pno, mno, category, title, edate, sprice);

        return returnPage;
    }
}
