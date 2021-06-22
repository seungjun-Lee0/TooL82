package tool82.spring.project.service;

import tool82.spring.project.vo.Member;
import javax.servlet.http.HttpSession;

public interface Memberservice {



    String newMember(Member m);

    String checkUserid(String uid);

    boolean checkLogin(Member m, HttpSession session);



}
