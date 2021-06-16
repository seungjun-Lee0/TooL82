package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SaleController {

    @GetMapping("/seller/write")
    public String sellReg(){
        return "seller/write.tiles";
    }
}
