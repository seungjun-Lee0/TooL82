package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;
import tool82.spring.project.vo.Sellist;

import java.util.List;
import java.util.Map;

@Repository("ldao")
public class ListDAOImpl implements ListDAO {

    @Autowired private SqlSession sqlSession;


    @Override
    public List<Buylist> selectBuy(int snum) {
        return sqlSession.selectList("sellbuy.selectBuy", snum);
    }

    @Override
    public List<Buylist> findSelectBuy(Map<String, Object> param) {
        return sqlSession.selectList("sellbuy.findSelectBuy", param);
    }

    @Override
    public Sellist selectOneSellUid(String mno) {
        return sqlSession.selectOne("sellbuy.selectSellUid", mno);
    }

    @Override
    public Buylist selectOneBuyUid(String mno) {
        return sqlSession.selectOne("sellbuy.selectBuyUid", mno);
    }

    @Override
    public List<Sellist> selectSell(int snum) {
        return sqlSession.selectList("sellbuy.selectSell", snum);
    }

    @Override
    public List<Sellist> findSelectSell(Map<String, Object> param) {
        return sqlSession.selectList("sellbuy.findSelectSell", param);
    }

    @Override
    public int selectCountSell() {
        return sqlSession.selectOne("sellbuy.countSell");
    }

    @Override
    public int selectCountSell(Map<String, Object> param) {
        return sqlSession.selectOne("sellbuy.countSell", param);
    }

    @Override
    public int selectCountBuy() {
        return sqlSession.selectOne("sellbuy.countBuy");
    }

    @Override
    public int selectCountBuy(Map<String, Object> param) {
        return sqlSession.selectOne("sellbuy.countBuy", param);
    }


}
