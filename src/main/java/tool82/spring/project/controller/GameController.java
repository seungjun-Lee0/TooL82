package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.GameService;

@Controller
public class GameController {

    @Autowired
    public GameService gsrv;

    @GetMapping("/game/list")
    public ModelAndView List(ModelAndView mv, String cp) {
        if (cp == null) cp = "1";
        mv.setViewName("game/list.tiles");
        mv.addObject("gms", gsrv.readGame(cp));
        mv.addObject("gmcnt", gsrv.countGame());
        return mv;
    }

    @GetMapping("/game/detail")
    public ModelAndView Detail(String pno, ModelAndView mv) {
        mv.setViewName("game/detail.tiles");
        mv.addObject("gm", gsrv.readOneGame(pno));
        return mv;
    }



}
