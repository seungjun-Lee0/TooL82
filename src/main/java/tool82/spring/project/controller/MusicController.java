package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.ListService;
import tool82.spring.project.service.MusicService;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MusicController {

    @Autowired
    private MusicService msrv;
    @Autowired
    private ListService lsrv;

    @GetMapping("/music/list")
    public ModelAndView List(ModelAndView mv, String cp){
        if(cp == null) cp = "1";
        mv.setViewName("music/list.tiles");
        mv.addObject("mcs", msrv.readMusic(cp));
        mv.addObject("mccnt", msrv.countMusic());
        return mv;
    }

    @GetMapping("/music/detail")
    public ModelAndView Detail(String pno, String mno, ModelAndView mv) {
        mv.setViewName("music/detail.tiles");
        mv.addObject("mc", msrv.readOneMusic(pno));
        mv.addObject("dupcheck", lsrv.duplicateCheck(pno, mno));
        return mv;
    }

    @PostMapping("/music/detail")
    public String buyOK(String pno, String mno, String category, String title,
                        String edate, String sprice) {
        String returnPage = "redirect:/music/list";

        lsrv.newBuyList(pno, mno, category, title, edate, sprice);

        return returnPage;
    }


}
