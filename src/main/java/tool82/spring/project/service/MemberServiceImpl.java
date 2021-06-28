package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.MemberDAO;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service("mbsrv")
public class MemberServiceImpl implements MemberService{

    @Autowired private MemberDAO mbdao;

    @Override
    public String newMember(Member m) {
        String result = "회원정보 저장에 실패하였습니다!";

        int cnt = mbdao.insertMember(m);
        if (cnt > 0) result = "회원정보가 정상적으로 저장되었습니다!";
        return result;
    }

    @Override
    public String checkUserid(String uid) {
        return mbdao.selectOneUserid(uid)+"";
    }

    @Override
    public boolean checkLogin(Member m, HttpSession sess) {
        boolean isLogin = false;

        if(mbdao.selectLogin(m) > 0) {
            sess.setAttribute("MyInfo", readOneMember(m.getUserid()));
            isLogin = true;
        }
        return isLogin;
    }

    @Override
    public Member readOneMember(String uid) {
        return mbdao.showOneMember(uid);
    }

    @Override
    public String modifyMember(Member m, HttpSession sess) {
        String result = "회원정보 수정 실패";
        int cnt = mbdao.updateMember(m);
        if (cnt > 0) {
            sess.setAttribute("MyInfo", readOneMember(m.getUserid()));
            result = "회원정보 수정 성공";
        }
        return result;
    }

    @Override
    public String removeMember(Member m) {
//        int cnt = mbdao.confirmBuystat(m);
        String result = "success";
        if (mbdao.confirmBuystat(m) == 0 && mbdao.confirmSelstat(m) == 0) mbdao.deleteMember(m);
//        else if (mbdao.confirmSelstat(m) == 0) mbdao.deleteMember(m);
        else result = "fail";
            return result;
//        mbdao.deleteSMember(m);
//        mbdao.deleteBMember(m);

    }

//    @Override
//    public void removeSMember(Sellist sl) {
//        mbdao.deleteSMember(sl);
//
//    }
//
//    @Override
//    public void removeBMember(Buylist bl) {
//
//        mbdao.deleteBMember(bl);

//    }


}
