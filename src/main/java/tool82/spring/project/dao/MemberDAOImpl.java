package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Sellist;

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

//        if (m.getSelleryn() == "0") sqlSession.delete("member.deleteSMember", m); // 판매자일때 sellist 삭제

//        if (m.getSelleryn() == "0") sqlSession.delete("member.deleteSMember", m); // 판매자일때 buylist 삭제
//        if (m.getSelleryn() == "1") sqlSession.delete("member.deleteBMember", m); // 구매자일때


        sqlSession.delete("member.deleteSMember", m);
        sqlSession.delete("member.deleteBMember", m);
        sqlSession.delete("member.deleteMember", m);


    }

//    @Override public void deleteSMember(Sellist sl) {
//        sqlSession.delete("member.deleteSMember", sl);
//    }
//
//    @Override public void deleteBMember(Buylist bl) {
//        sqlSession.delete("member.deleteBMember", bl); // 구매목록 삭제
//    }

}
