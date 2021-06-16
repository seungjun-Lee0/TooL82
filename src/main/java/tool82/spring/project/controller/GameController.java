package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GameController {
    @GetMapping("/game/list")
    public String videoList(){
        return "game/list.tiles";
    }

    @GetMapping("/game/detail")
    public String videoDetail() {return "game/detail.tiles"; }
}
