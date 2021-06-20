package tool82.spring.project.dao;


import java.lang.reflect.Member;

public interface MemberDAO {


    int insertMember(Member m);

    int selectOneUserid(String uid);
    int selectLogin(Member m); //멤버 정보를 토대로 매치하고 조사하는 거니까

}
