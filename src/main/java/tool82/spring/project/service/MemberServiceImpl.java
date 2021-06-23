package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.MemberDAO;
import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("msrv")
public class MemberServiceImpl implements MemberService{

    @Autowired private MemberDAO mdao;

    @Override
    public String newMember(Member m) {
        String result = "회원정보 저장에 실패하였습니다!";

        int cnt = mdao.insertMember(m);
        if (cnt > 0) result = "회원정보가 정상적으로 저장되었습니다!";
        return result;
    }

    @Override
    public String checkUserid(String uid) {
        return mdao.selectOneUserid(uid)+"";
    }

    @Override
    public boolean checkLogin(Member m, HttpSession sess) {
        boolean isLogin = false;

        if(mdao.selectLogin(m) > 0) {
            sess.setAttribute("UID", m.getUserid());
            isLogin = true;
        }
        return isLogin;
    }

    @Override
    public Member readOneMember(String uid) {
        return mdao.showOneMember(uid);
    }

    @Override
    public String modifyMember(Member m) {
        String result = "회원정보 수정 실패";
        int cnt = mdao.updateMember(m);
        if (cnt > 0) result = "회원정보 수정 성공";
        return result;
    }


}
