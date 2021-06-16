package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

    @GetMapping("/notice/list")
    public String noticeList(){
        return "notice/list.tiles";
    }

    @GetMapping("/notice/detail")
    public String noticeDetail(){
        return "notice/detail.tiles";
    }
}
