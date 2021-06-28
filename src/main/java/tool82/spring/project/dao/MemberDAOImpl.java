package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Member;

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


    @Override
    public int confirmBuystat(Member m) {
        return sqlSession.selectOne("member.confirmBuystat", m);
    }

    @Override
    public int confirmSelstat(Member m) {
        return sqlSession.selectOne("member.confirmSelstat", m);
    }

    @Override
    public void deleteMember(Member m) {
        sqlSession.delete("member.deleteSMember", m);
        sqlSession.delete("member.deleteBMember", m);
        sqlSession.delete("member.deleteMember", m);
    }
}
