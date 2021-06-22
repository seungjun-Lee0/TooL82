package tool82.spring.project.dao;


import tool82.spring.project.vo.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
//import java.util.List;

@Repository("mdao") //이건 수기야!
public class MemberDAOImpl implements MemberDAO{
//빨간줄 생기면 메소드 구현!


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
