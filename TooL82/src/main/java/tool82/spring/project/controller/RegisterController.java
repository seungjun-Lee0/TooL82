package tool82.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegisterController {
    @GetMapping("/register/regAgree")
    public String regAgree(){
        return "register/regAgree.tiles";
    }

    @GetMapping("/register/regForm")
    public String regForm(){
        return "register/regForm.tiles";
    }
}
