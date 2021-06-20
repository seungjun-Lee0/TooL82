package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.MemberDAO;


import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;


@Service("msrv")
public class MemberServiceImpl implements Memberservice {


    @Autowired
    private MemberDAO mdao;


    @Override
    public String newMember(Member m) {
        return null;
    }

    @Override
    public String checkUserid(String uid) {
        return null;
    }

    @Override
    public boolean checkLogin(Member m, HttpSession session) {
        return false;
    }
}
