package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.GameService;
import tool82.spring.project.service.ListService;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Product;
import tool82.spring.project.vo.Sellist;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class GameController {

    @Autowired
    public GameService gsrv;
    public ListService lsrv;

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

    @RequestMapping(value = "/game/buy", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> buyList(@RequestBody Map<String, Object> params) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            lsrv.newBuyList(params);
        } catch (Exception ex) {
            resultMap.put("message", ex.getMessage());
            return resultMap;
        }
        resultMap.put("message", "구매신청에 성공하셨습니다");
        return resultMap;
    }

//    @PostMapping("/game/buy")
//    public String sellRegOk(Product p) {
//        String returnPage = "redirect:/game/list";
//        lsrv.newBuyList(p);
//        return returnPage;
//    }

    @GetMapping("/game/buy")
    public String buyOk(String pno) {
        lsrv.modifyParty(pno);
        return "redirect:/game/list.tiles";
    }

}
