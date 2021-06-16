package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UtilController {
    @GetMapping("/util/list")
    public String videoList(){
        return "util/list.tiles";
    }

    @GetMapping("/util/detail")
    public String videoDetail() {return "util/detail.tiles"; }
}
