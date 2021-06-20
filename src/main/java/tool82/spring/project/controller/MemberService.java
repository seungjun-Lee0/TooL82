package tool82.spring.project.controller;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;

public interface MemberService {
    void newMember(Member m);

    boolean checkUserid(String uid);

    boolean checkLogin(Member m, HttpSession sess);
}
