package tool82.spring.project.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.List;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO{

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertMember(Member m) {
        return sqlSession.insert("member.insertMember", m);
    }


    @Override
    public int selectOneUserid(String uid) {
        return 0;
    }

    @Override
    public int selectLogin(Member m) {
        return sqlSession.selectOne("member.checkLogin", m);
    }
}
