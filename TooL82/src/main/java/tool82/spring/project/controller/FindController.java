package tool82.spring.project.controller;

public interface FindController {


        public static FindController create(String uri) {
            switch(uri.hashCode()) {
                case -111111111:
                    if (uri.equals("/webapp/WEB-INF/member/logout.it")) {
                        return new LogoutController();
                    }
                    break;

            }

            return null;
        }
    }



