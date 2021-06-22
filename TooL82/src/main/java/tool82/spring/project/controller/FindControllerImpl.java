package tool82.spring.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindControllerImpl {


    public class FindIdOKController implements FindController {
        public FindIdOKController() {
        }

        public String process(HttpServletRequest request,
                              HttpServletResponse response) throws Exception {
            return "/webapp/WEB-INF/view/register/find.jsp";

        }
    }
}

