package tool82.spring.project.dao;

import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MemberDAO {

    int insertMember(Member m);
    int selectOneUserid(String uid);
    int selectLogin(Member m);

    Member showOneMember(String uid);

    int updateMember(Member m);
}
