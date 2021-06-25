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
    public MusicService msrv;
    public ListService lsrv;

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

    @RequestMapping(value = "/music/buy", method = RequestMethod.POST)
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


    @GetMapping("/music/buy")
    public String buyOk(String pno) {
        lsrv.modifyParty(pno);
        return "redirect:/game/list.tiles";
    }

}
