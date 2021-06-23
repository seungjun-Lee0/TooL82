package tool82.spring.project.service;

import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MemberService {

    String newMember(Member m);
    String checkUserid(String uid);
    boolean checkLogin(Member m, HttpSession sess);
    Member readOneMember(String uid);
    String modifyMember(Member m);

}
