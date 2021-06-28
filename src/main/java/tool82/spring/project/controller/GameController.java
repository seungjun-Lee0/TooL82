package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.GameService;
import tool82.spring.project.service.ListService;

@Controller
public class GameController {

    @Autowired
    private GameService gsrv;
    @Autowired
    private ListService lsrv;

    @GetMapping("/game/list")
    public ModelAndView List(ModelAndView mv, String cp) {
        if (cp == null) cp = "1";
        mv.setViewName("game/list.tiles");
        mv.addObject("gms", gsrv.readGame(cp));
        mv.addObject("gmcnt", gsrv.countGame());
        return mv;
    }

    @GetMapping("/game/detail")
    public ModelAndView Detail(String pno, String mno, ModelAndView mv) {

        mv.setViewName("game/detail.tiles");
        mv.addObject("gm", gsrv.readOneGame(pno));
        mv.addObject("dupcheck", lsrv.duplicateCheck(pno, mno));
        return mv;
    }

    @PostMapping("/game/detail")
    public String buyOK(String pno, String mno, String category, String title,
                        String edate, String sprice) {
        String returnPage = "redirect:/game/list";

        lsrv.newBuyList(pno, mno, category, title, edate, sprice);

        return returnPage;
    }

}
