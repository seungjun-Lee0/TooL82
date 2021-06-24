package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Member;

import javax.servlet.http.HttpSession;
import java.util.List;

@Repository("mbdao")
public class MemberDAOImpl implements MemberDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertMember(Member m) {
        return sqlSession.insert("member.insertMember", m);
    }

    @Override
    public int selectOneUserid(String uid) {
        return sqlSession.selectOne("member.selectOneUserid", uid);
    }

    @Override
    public int selectLogin(Member m) {
        return sqlSession.selectOne("member.selectLogin", m);
    }

    @Override
    public Member showOneMember(String uid) {
        return sqlSession.selectOne("member.showOneMember", uid);
    }

    @Override
    public int updateMember(Member m) {
        return sqlSession.update("member.updateMember", m);
    }

}
