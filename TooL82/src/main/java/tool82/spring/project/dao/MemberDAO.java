package tool82.spring.project.dao;

import tool82.spring.project.vo.Member;

//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import java.util.List;


public interface MemberDAO {


    int insertMember(Member m);
     int selectOneUserid(String uid);
    int selectLogin(Member m);

}
