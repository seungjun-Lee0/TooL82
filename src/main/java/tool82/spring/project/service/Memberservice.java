package tool82.spring.project.service;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;

public interface Memberservice {


    String newMember(Member m);
    String checkUserid(String uid);
    boolean checkLogin(Member m, HttpSession session);



}
