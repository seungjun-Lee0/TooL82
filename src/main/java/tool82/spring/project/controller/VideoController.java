package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VideoController {
    @GetMapping("/video/list")
    public String videoList(){
        return "video/list.tiles";
    }

    @GetMapping("/video/detail")
    public String videoDetail() {return "video/detail.tiles"; }
}
