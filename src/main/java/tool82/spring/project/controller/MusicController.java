package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MusicController {
    @GetMapping("/music/list")
    public String videoList(){
        return "music/list.tiles";
    }

    @GetMapping("/music/detail")
    public String videoDetail() {return "music/detail.tiles"; }
}
