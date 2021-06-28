package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;

import java.util.List;

@Repository("emldao")
public class EmailDaoImpl implements EmailDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<String> selectEmail() {

        return sqlSession.selectList("email.selectEmail");
    }

    @Override
    public int updateSussStat() {
        return sqlSession.update("email.updateSussStat");
    }

    @Override
    public int updateFailStat() {
        return sqlSession.update("email.updateFailStat");
    }

    @Override
    public int updateSussBuyStat() {
        return sqlSession.update("email.updateSussBuy");
    }

    @Override
    public int updateFailBuyStat() {
        return sqlSession.update("email.updateFailBuy");
    }

    @Override
    public void updateEmailStat() {
        sqlSession.update("email.updateEmailStat");
    }


}
