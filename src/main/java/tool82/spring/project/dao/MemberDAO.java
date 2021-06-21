package tool82.spring.project.dao;


import java.lang.reflect.Member;

public interface MemberDAO {


    int insertMember(Member m);

    int selectOneUserid(String uid);
    int selectLogin(Member m);

}
