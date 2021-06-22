package tool82.spring.project.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import tool82.spring.project.dao.MemberDAO;
import tool82.spring.project.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.servlet.http.HttpSession;


@Service("mbsrv")
public class MemberServiceImpl implements Memberservice {


    @Autowired
    private MemberDAO mbdao;

    @Override
    public String newMember(Member m) {
        String result = "회원 정보 저장실패";

        int cnt = mbdao.insertMember(m);
        if (cnt > 0) result = "회원정보 저장 성공!";

        return null;
    }


    @Override
    public String checkUserid(String uid) {
        return mbdao.selectOneUserid(uid) + "";
    }

    @Override
    public boolean checkLogin(Member m, HttpSession sess) {

        boolean isLogin = false;


        //있으면 1, 없으면 0을 리턴함


        if (mbdao.selectLogin(m) > 0) {
            sess.setAttribute("UID", m.getUserid());
            isLogin = true;
        }
        return isLogin;
    }

    }
